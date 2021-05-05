#!/bin/sh
pushd ..
7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on -x@pk7/excl.lst -up0q0r2x2y2z1w2 ../swwmgz_m.pk7 .
popd
