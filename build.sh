#!/bin/bash
set -eou pipefail

PNGQUANT_VERSION="2.11.7"
LIBPNG_VERSION="v1.6.34"

PNGQUANT_REPO="https://github.com/kornelski/pngquant.git"
LIBPNG_REPO="git://git.code.sf.net/p/libpng/code"

# Download and compile libpng
git clone --recursive --branch $LIBPNG_VERSION $LIBPNG_REPO libpng
(
    cd libpng
    ./autogen.sh
    # build statically to ensure the lib is portable
    ./configure --enable-static
    make
)

# Download and compile pngquant
git clone --recursive --branch $PNGQUANT_VERSION $PNGQUANT_REPO pngquant
(
    cd pngquant
    # use the statically compiled libpng from the previous step
    mv ../libpng ./libpng
    ./configure
    make
    # compress the built binary after compilation
    gzip -9 -c pngquant > pngquant.gz
)
