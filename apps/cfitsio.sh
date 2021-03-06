#!/bin/bash

# cfitsio compilation
ROOT_DIR=$(pwd)
mkdir -p /share/apps/cfitsio/3.49
cd /share/apps/cfitsio/3.49
wget http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio-3.49.tar.gz
tar -xf cfitsio-3.49.tar.gz
mv cfitsio-3.49 intel-2021
cd intel-2021
source /share/apps/intel/oneapi/setvars.sh --config=${ROOT_DIR}/config.txt
export CC='icc' CFLAGS='-xHost -O3 -g' F77='ifort' FFLAGS='-f77rtl -fast'
./configure --prefix=/share/apps/cfitsio/3.49/intel-2021
make
make install

# module
mkdir /share/apps/modules/cfitsio
cp ${ROOT_DIR}/modules/cfitsio/3.49_intel-2021 /share/apps/modules/cfitsio
