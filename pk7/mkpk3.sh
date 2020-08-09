#!/bin/sh
pushd ..
7z a -tzip -mx=9 -x@pk7/excl.lst ../swwmgz_m.pk3 .
popd
