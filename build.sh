#!/bin/bash

VERSION=5.1.2
buildpath=/tmp/gromacs_build

mkdir -p $buildpath/{"build","source/archives","versions"}
cd $buildpath/source

wget -O archives/gromacs-$VERSION.tar.gz ftp://ftp.gromacs.org/pub/gromacs/gromacs-$VERSION.tar.gz
tar zxvf archives/gromacs-$VERSION.tar.gz

export CC=gcc
export CXX=g++

cmake28 $buildpath/source/gromacs-$VERSION \
        -DCMAKE_INSTALL_PREFIX=$buildpath/versions/gromacs-$VERSION/gnu\
        -DGMX_BUILD_OWN_FFTW=ON -DGMX_PREFER_STATIC_LIBS=ON \
        -DGMX_GPU=OFF -DCMAKE_C_COMPILER=$CC \
        -DCMAKE_GXX_COMPILER=$CXX \
        -DGMX_BUILD_SHARED_EXE=OFF

make install -j 4

#TODO find the binaries and make them a conda package

rm -rf $buildpath/versions/gromacs-$VERSION/gnu/{'include','lib64','share/man'}

cd $buildpath/versions/gromacs-$VERSION/gnu/bin

mv gmx gmx.bin

echo '#!/bin/sh

DIR=$(dirname "$0")
export GMXDATA="$DIR/share/gromacs"
export LD_LIBRARY_PATH="$DIR/../lib/compat-libc:$LD_LIBRARY_PATH"
"$DIR/gmx.bin" "$@"' >> gmx

chmod +x gmx

cd $buildpath/versions

tar cvfz gromacs-$VERSION.tar.bz gromacs-$VERSION
cp gromacs-$VERSION.tar.bz /
