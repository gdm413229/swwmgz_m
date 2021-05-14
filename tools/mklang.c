/*
	mklang.c : Generate LANGUAGE files for lore library entries.
	This code is a mess and it's full of hacks, but that's to be expected
	when it's all really just for personal use.

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
#define _XOPEN_SOURCE 700
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <dirent.h>
#include <limits.h>

char *lang = 0;
FILE *lf = 0;
char *txt = 0;
long txtlen = 0;

void processentry( char *entname )
{
	int gottag = 0;
	long txtpos = 0;
	int txtnum = 0;
	char *nl = 0;
	int hl = 0;
gettag:
	if ( txtpos > txtlen-4 ) goto processend;
	if ( !strncmp(txt+txtpos,"TAG\n",4) )
	{
		txtpos += 4;
		goto processtag;
	}
	else if ( !strncmp(txt+txtpos,"TAB\n",4) )
	{
		txtpos += 4;
		goto processtab;
	}
	else if ( !strncmp(txt+txtpos,"REL\n",4) )
	{
		txtpos += 4;
		goto processrel;
	}
	else if ( !strncmp(txt+txtpos,"TXT\n",4) )
	{
		txtpos += 4;
		txtnum++;
		goto processtxt;
	}
processend:
	if ( gottag ) printf("\n");
	else printf(" \033[1;31mEMPTY???\033[0m\n");
	return;
processtag:
	printf(" \033[1;36mTAG\033[0m");
	nl = strchr(txt+txtpos,'\n');
	if ( !nl ) goto processend;
	*nl = '\0';
	fprintf(lf,"SWWM_LORETAG_%s = \"%s\";\n",entname,txt+txtpos);
	txtpos = (nl-txt)+1;
	gottag = 1;
	goto gettag;
processtab:
	printf(" \033[1;36mTAB\033[0m");
	nl = strchr(txt+txtpos,'\n');
	if ( !nl ) goto processend;
	*nl = '\0';
	fprintf(lf,"SWWM_LORETAB_%s = \"%s\";\n",entname,txt+txtpos);
	txtpos = (nl-txt)+1;
	gottag = 1;
	goto gettag;
processrel:
	printf(" \033[1;36mREL\033[0m");
	nl = strchr(txt+txtpos,'\n');
	if ( !nl ) goto processend;
	*nl = '\0';
	fprintf(lf,"SWWM_LOREREL_%s = \"%s\";\n",entname,txt+txtpos);
	txtpos = (nl-txt)+1;
	gottag = 1;
	goto gettag;
processtxt:
	printf(" \033[1;36mTXT\033[0m");
	hl = 0;
	if ( txtnum <= 1 ) fprintf(lf,"SWWM_LORETXT_%s = \"",entname);
	else fprintf(lf,"SWWM_LORETXT_%s%d = \"",entname,txtnum);
	while ( txt[txtpos] )
	{
		if ( txt[txtpos] == '\n' )
			fprintf(lf,"\\n");
		else if ( txt[txtpos] == '\"' )
			fprintf(lf,"\\\"");
		else if ( (txt[txtpos] == '*') && (txt[txtpos+1] == '*') )
		{
			hl = !hl;
			if ( hl ) fprintf(lf,"\\cf");
			else fprintf(lf,"\\c-");
			txtpos++;
		}
		else fputc(txt[txtpos],lf);
		txtpos++;
		if ( (txt[txtpos] == '\n') && ((txtpos >= txtlen-1) || !strncmp(txt+txtpos+1,"TXT\n",4) || !strncmp(txt+txtpos+1,"END\n",4)) )
		{
			txtpos++;
			break;
		}
	}
	fprintf(lf,"\";\n");
	gottag = 1;
	goto gettag;
}

void readentry( char *mpath, char *entpath, char *entname )
{
	FILE *f = fopen(mpath,"rb");
	if ( !f )
	{
		fprintf(stderr," \033[31mcannot open file \033[1m'%s'\033[22m: \033[1m%s\033[0m\n",entpath,strerror(errno));
		return;
	}
	fseek(f,0,SEEK_END);
	txtlen = ftell(f);
	rewind(f);
	if ( txt ) txt = realloc(txt,txtlen+1);
	else txt = malloc(txtlen+1);
	memset(txt,0,txtlen+1);
	fread(txt,1,txtlen,f);
	fclose(f);
	// strip extension from entname and set to allcaps
	char *ext = strchr(entname,'.');
	if ( ext ) *ext = '\0';
	printf(" \033[1;32m%s\033[22m:\033[0m",entname);
	char *c = entname;
	while ( *c )
	{
		// cheapass uppercase
		if ( (*c >= 0x61) && (*c <= 0x7A) )
			*c -= 0x20;
		c++;
	}
	processentry(entname);
	free(txt);
	txt = 0;
}

int txtonly( const struct dirent *e )
{
	if ( !strstr(e->d_name,".txt") ) return 0;
	return 1;
}

int invalphasort( const struct dirent **a, const struct dirent **b )
{
	return strcoll((*b)->d_name,(*a)->d_name);
}

void loopdir( char *mpath, char *appendto, int ofs, int lim )
{
	struct dirent **e;
	int ne = scandir(mpath,&e,txtonly,invalphasort);
	if ( ne == -1 )
	{
		fprintf(stderr,"\033[31mcannot scan directory \033[1m'%s'\033[22m: \033[1m%s\033[0m\n",appendto,strerror(errno));
		return;
	}
	while ( ne-- )
	{
		if ( snprintf(appendto+ofs,lim-ofs,"/%s",e[ne]->d_name) >= lim-ofs )
		{
			fprintf(stderr,"\033[31mpath length exceeded (over %u bytes).\033[0m\n",PATH_MAX);
			free(e[ne]);
			continue;
		}
		readentry(mpath,appendto,appendto+ofs+1);
		free(e[ne]);
	}
	free(e);
}

int main( int argc, char **argv )
{
	(void)argc;	// shush, compiler
	const char langs[][16] =
	{
		"default",
		"es",
/*		"jp",
		"ru",
		"fr",
		"it",
		"de",
		"pl"*/
	};
	const char langfiles[][32] =
	{
		"language.def_lore",
		"language.es_lore",
/*		"language.jp_lore",
		"language.ru_lore",
		"language.fr_lore",
		"language.it_lore",
		"language.de_lore",
		"language.pl_lore",*/
	};
	int nlangs = sizeof(langs)/16;	// hacky, but works
	char mpath[PATH_MAX+1];
	if ( !realpath(argv[0],mpath) )
	{
		fprintf(stderr,"\033[31merror getting full path: %s\033[0m\n",strerror(errno));
		return 1;
	}
	char* appendto = strstr(mpath,"/swwmgz_m/");
	if ( !appendto )
	{
		fprintf(stderr,"\033[31mbase swwmgz_m path could not be detected.\033[0m\n");
		return 1;
	}
	appendto += 10;
	int lim = PATH_MAX-(appendto-mpath);
	for ( int i=0; i<nlangs; i++ )
	{
		if ( snprintf(appendto,lim,"%s",langfiles[i]) >= lim )
		{
			fprintf(stderr,"\033[31mpath length exceeded (over %u bytes).\033[0m\n",PATH_MAX);
			continue;
		}
		printf("\033[33mprocessing language \033[1m'%s'\033[0m\n",langs[i]);
		lf = fopen(mpath,"wb");
		if ( !lf )
		{
			fprintf(stderr,"\033[31mcannot open \033[1m'%s'\033[22m for writing: \033[1m%s\033[0m\n",langfiles[i],strerror(errno));
			continue;
		}
		fprintf(lf,"// this file was generated by mklang, do not edit directly\n");
		fprintf(lf,"[%s]\n",langs[i]);
		int nb = snprintf(appendto,lim,"lore/%s",langs[i]);
		if ( nb >= lim )
		{
			fprintf(stderr,"\033[31mpath length exceeded (over %u bytes).\033[0m\n",PATH_MAX);
			fclose(lf);
			continue;
		}
		loopdir(mpath,appendto,nb,lim);
		fclose(lf);
	}
	return 0;
}

