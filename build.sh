#!/bin/bash

VERSION=5.1.2
buildpath=/tmp/gromacs_build

mkdir -p $buildpath/{"build","source/archives","versions"}
cd $buildpath/source

wget -O archives/gromacs-$VERSION.tar.gz ftp://ftp.gromacs.org/pub/gromacs/gromacs-$VERSION.tar.gz
tar zxvf archives/gromacs-$VERSION.tar.gz

# TODO
# comilers based on docker image
# CC
# CXX
# FC

