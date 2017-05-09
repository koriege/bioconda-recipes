#!/bin/bash
set -eu -o pipefail

cd segemehl
sed -i -r 's/^\s*(C|LD)FLAGS\s*=\s*/override \1FLAGS += /' Makefile
make CFLAGS="-I$PREFIX/include -I$PREFIX/include/ncurses" LDFLAGS="-L$PREFIX/lib"
mkdir -p $PREFIX/bin
cp segemehl.x $PREFIX/bin
