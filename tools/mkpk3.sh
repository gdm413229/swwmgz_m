#!/bin/sh
WORKDIR=$(readlink -f $0 | sed 's/\(swwmgz_m\)\(.*\)/\1/')
pushd "$WORKDIR"
7z a -tzip -mx=9 -x@tools/excl.lst -up0q0r2x2y2z1w2 ../swwmgz${1}_m.pk3 .
popd
