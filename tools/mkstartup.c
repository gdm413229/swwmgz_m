/*
	mkstartup.c : Makes a Hexen startup screen from provided images.
	Requires all the files to be in the same folder it's executed in.
	I didn't bother adding any checks so if this thing catches on fire it's
	your own damn fault. Add them yourself if you want, this tool was made
	for personal use anyway.

	Copyright (c) 2020-2021 Marisa Kirisame, UnSX Team

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

int main( void )
{
	// we expect everything to be exported straight from gimp in raw image
	// data format, indexed, no alpha, all graphics must share the same
	// 16-color palette and have the exact dimensions shown here:
	//   STARTUP.data     : 640x480, I8 (307200 bytes)
	//   STARTUP.data.pal : 16 colors, RGB8 (48 bytes)
	//   NOTCH.data       : 16x23, I8 (368 bytes)
	//   NETNOTCH.data    : 4x16, I8 (64 bytes)
	uint8_t pal[48] = {0};
	uint8_t startup[4][38400] = {{0}};
	uint8_t notch[184] = {0};
	uint8_t netnotch[32] = {0};
	uint8_t blk[8] = {0};
	FILE *fout = fopen("STARTUP.dat","wb");
	FILE *fin = fopen("STARTUP.data.pal","rb");
	fread(&pal,1,48,fin);
	// reduce 8BPC palette to 6BPC
	for ( int i=0; i<48; i++ )
		pal[i] = (pal[i]>>2)&0x3f;
	fwrite(&pal,1,48,fout);
	fclose(fin);
	fin = fopen("STARTUP.data","rb");
	// compose 4-bit planar startup image
	for ( int i=0; i<38400; i++ )
	{
		fread(&blk,1,8,fin);
		for ( int j=0; j<8; j++ )
		{
			startup[0][i] |= !!(blk[j]&1)<<(7-j);
			startup[1][i] |= !!(blk[j]&2)<<(7-j);
			startup[2][i] |= !!(blk[j]&4)<<(7-j);
			startup[3][i] |= !!(blk[j]&8)<<(7-j);
		}
	}
	fclose(fin);
	fwrite(&startup,1,153600,fout);
	fclose(fout);
	fin = fopen("NOTCH.data","rb");
	fout = fopen("NOTCH.dat","wb");
	// compose 4-bit linear notch image
	for ( int i=0; i<184; i++ )
	{
		fread(&blk,1,2,fin);
		notch[i] |= (blk[0]<<4)&0xF0;
		notch[i] |= blk[1]&0x0F;
	}
	fclose(fin);
	fwrite(&notch,1,184,fout);
	fclose(fout);
	fin = fopen("NETNOTCH.data","rb");
	fout = fopen("NETNOTCH.dat","wb");
	// compose 4-bit linear netnotch image
	for ( int i=0; i<32; i++ )
	{
		fread(&blk,1,2,fin);
		netnotch[i] |= (blk[0]<<4)&0xF0;
		netnotch[i] |= blk[1]&0x0F;
	}
	fclose(fin);
	fwrite(&netnotch,1,32,fout);
	fclose(fout);
	return 0;
}
