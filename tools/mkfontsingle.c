/*
	mkfontsingle.c : Make font pngs for gzdoom, in an ugly cheap way.
	This code is a mess but I keep it here so people know how much I had
	to suffer to get this done.
	(C)2020 Marisa Kirisame, UnSX Team.
	Released under the MIT license:

	Copyright (c) 2020 Marisa Kirisame

	Permission is hereby granted, free of charge, to any person obtaining
	a copy of this software and associated documentation files (the
	"Software"), to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:

	The above copyright notice and this permission notice shall be
	included in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
	IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
	CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
	TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
	SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <png.h>
#include <ft2build.h>
#include FT_FREETYPE_H

int writepng( const char *filename, uint8_t *fdata, int w, int h, int p )
{
	if ( !filename ) return 0;
	png_structp pngp;
	png_infop infp;
	FILE *pf;
	if ( !(pf = fopen(filename,"wb")) ) return 0;
	pngp = png_create_write_struct(PNG_LIBPNG_VER_STRING,0,0,0);
	if ( !pngp )
	{
		fclose(pf);
		return 0;
	}
	infp = png_create_info_struct(pngp);
	if ( !infp )
	{
		fclose(pf);
		png_destroy_write_struct(&pngp,0);
		return 0;
	}
	if ( setjmp(png_jmpbuf(pngp)) )
	{
		png_destroy_write_struct(&pngp,&infp);
		fclose(pf);
		return 0;
	}
	png_init_io(pngp,pf);
	png_set_IHDR(pngp,infp,w,h,8,PNG_COLOR_TYPE_GA,
		PNG_INTERLACE_NONE,PNG_COMPRESSION_TYPE_DEFAULT,
		PNG_FILTER_TYPE_DEFAULT);
	png_write_info(pngp,infp);
	for ( int i=0; i<h; i++ ) png_write_row(pngp,fdata+(p*i));
	png_write_end(pngp,infp);
	png_destroy_write_struct(&pngp,&infp);
	fclose(pf);
	return 1;
}

FT_Library ftlib;
FT_Face fnt;

int iw, ih;
int w, h, pxsiz;
uint8_t *idata;

int gradient = 0;
int upshift = 0;

void putpixel( uint8_t v, uint8_t a, int x, int y )
{
	if ( (x < 0) || (x >= iw) || (y < 0) || (y >= ih) ) return;
	uint32_t tpos = (x+y*iw)*2;
	// add alpha
	int alph = idata[tpos+1];
	alph += a;
	if ( alph > 255 ) alph = 255;
	idata[tpos+1] = alph;
	// blend color
	int col = idata[tpos]*(a-255);
	col += v*a;
	col /= 255;
	idata[tpos] = col;
}

uint8_t lerpg( float a )
{
	return (uint8_t)(a*191+64);
}

int draw_glyph( FT_Bitmap *bmp, uint8_t v, uint32_t px, uint32_t py, uint8_t ox, uint8_t oy )
{
	int drawn = 0;
	unsigned i, j;
	for ( j=0; j<bmp->rows; j++ )
	{
		uint8_t rv = v;
		// apply gradient, if any
		if ( v == 255 )
		{
			float a = (j+oy-upshift)/(float)h;
			if ( (gradient&3) == 1 ) rv = lerpg(1.-a);
			else if ( (gradient&3) == 2 ) rv = lerpg(a);
		}
		for ( i=0; i<bmp->width; i++ )
		{
			if ( bmp->pixel_mode == FT_PIXEL_MODE_GRAY )
			{
				uint8_t a = bmp->buffer[i+j*bmp->pitch];
				if ( !drawn ) drawn = (a > 0);
				putpixel(rv,a,px+ox+i,py+oy+j);
			}
			else if ( bmp->pixel_mode == FT_PIXEL_MODE_MONO )
			{
				// thanks to https://stackoverflow.com/a/14905971
				unsigned p = bmp->pitch;
				uint8_t *row = &bmp->buffer[p*j];
				uint8_t a = ((row[i>>3])&(128>>(i&7)))?255:0;
				if ( !drawn ) drawn = (a > 0);
				putpixel(rv,a,px+ox+i,py+oy+j);
			}
		}
	}
	return drawn;
}

int main( int argc, char **argv )
{
	if ( argc < 4 )
	{
		fprintf(stderr,"usage: mkfontsingle <font name> <pxsize> <wxh>"
			" <unicode range (hex)> [gradient type] [upshift]\n");
		return 1;
	}
	if ( FT_Init_FreeType(&ftlib) )
		return 2;
	uint32_t range[2] = {0x0000,0x00FF};
	sscanf(argv[2],"%d",&pxsiz);
	sscanf(argv[3],"%dx%d",&w,&h);
	sscanf(argv[4],"%x-%x",&range[0],&range[1]);
	if ( argc > 5 ) sscanf(argv[5],"%d",&gradient);
	if ( argc > 6 ) sscanf(argv[6],"%d",&upshift);
	if ( FT_New_Face(ftlib,argv[1],0,&fnt) )
		return 4;
	if ( FT_Set_Pixel_Sizes(fnt,0,pxsiz) )
		return 8;
	FT_Select_Charmap(fnt,FT_ENCODING_UNICODE);
	iw = w;
	ih = h;
	idata = calloc(iw*ih,2);
	for ( uint32_t i=range[0]; i<=range[1]; i++ )
	{
		FT_UInt glyph = FT_Get_Char_Index(fnt,i);
		if ( !FT_Load_Glyph(fnt,glyph,FT_LOAD_DEFAULT) && glyph )
		{
			FT_Render_Glyph(fnt->glyph,FT_RENDER_MODE_NORMAL);
			int xx = 0;
			int yy = -upshift;
			int valid;
			if ( gradient&4 )
			{
				// draw outline first
				draw_glyph(&fnt->glyph->bitmap,0,xx,yy,fnt->glyph->bitmap_left,pxsiz-fnt->glyph->bitmap_top);
				draw_glyph(&fnt->glyph->bitmap,0,xx+1,yy,fnt->glyph->bitmap_left,pxsiz-fnt->glyph->bitmap_top);
				draw_glyph(&fnt->glyph->bitmap,0,xx+2,yy,fnt->glyph->bitmap_left,pxsiz-fnt->glyph->bitmap_top);
				draw_glyph(&fnt->glyph->bitmap,0,xx,yy+1,fnt->glyph->bitmap_left,pxsiz-fnt->glyph->bitmap_top);
				draw_glyph(&fnt->glyph->bitmap,0,xx+2,yy+1,fnt->glyph->bitmap_left,pxsiz-fnt->glyph->bitmap_top);
				draw_glyph(&fnt->glyph->bitmap,0,xx,yy+2,fnt->glyph->bitmap_left,pxsiz-fnt->glyph->bitmap_top);
				draw_glyph(&fnt->glyph->bitmap,0,xx+1,yy+2,fnt->glyph->bitmap_left,pxsiz-fnt->glyph->bitmap_top);
				draw_glyph(&fnt->glyph->bitmap,0,xx+2,yy+2,fnt->glyph->bitmap_left,pxsiz-fnt->glyph->bitmap_top);
				valid = draw_glyph(&fnt->glyph->bitmap,255,xx+1,yy+1,fnt->glyph->bitmap_left,pxsiz-fnt->glyph->bitmap_top);
			}
			else
			{
				// draw drop shadow first
				draw_glyph(&fnt->glyph->bitmap,0,xx+1,yy+1,fnt->glyph->bitmap_left,pxsiz-fnt->glyph->bitmap_top);
				valid = draw_glyph(&fnt->glyph->bitmap,255,xx,yy,fnt->glyph->bitmap_left,pxsiz-fnt->glyph->bitmap_top);
			}
			if ( valid )
			{
				char fname[256];
				snprintf(fname,256,"%04X.png",i);
				writepng(fname,idata,iw,ih,iw*2);
			}
			memset(idata,0,iw*ih*2);
		}
	}
	free(idata);
	FT_Done_Face(fnt);
	FT_Done_FreeType(ftlib);
	return 0;
}
