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
        -DGMX_BUILD_SHARED_EXE=ON

make install -j 4

rm -rf $buildpath/versions/gromacs-$VERSION/gnu/{'include','lib64','share/man'}
