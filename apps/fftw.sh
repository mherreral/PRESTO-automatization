#!/bin/bash

# fftw compilation
ROOT_DIR=$(pwd)
mkdir -p /shared/apps/fftw/3.3.9
cd /shared/apps/fftw/3.3.9
wget http://www.fftw.org/fftw-3.3.9.tar.gz
tar -xf fftw-3.3.9.tar.gz
mv fftw-3.3.9 intel-2021
cd intel-2021
source /shared/apps/intel/oneapi/setvars.sh --config=${ROOT_DIR}/config.txt
export CC='icc' CFLAGS='-xHost -O3 -g' F77='ifort' FFLAGS='-f77rtl -fast'
./configure --enable-shared --enable-single --prefix=/shared/apps/fftw/3.3.9/intel-2021 --enable-avx
make
make install

# module
mkdir /shared/apps/modules/fftw
cp ${ROOT_DIR}/modules/fftw/3.3.9_intel-2021 /shared/apps/modules/fftw
