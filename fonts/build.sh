#!/bin/sh
gcc -std=c11 -march=native -Og -g -Wall -Wextra -Werror -pedantic $(pkg-config --libs --cflags freetype2 libpng) -o mkfontblock mkfontblock.c
