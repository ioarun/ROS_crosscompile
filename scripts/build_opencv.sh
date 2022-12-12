#!/bin/bash -e

echo "-------------------------------------------------------------------------"
echo "Installing opencv 3.2"
DIR=`pwd`
PKG_DIR="opencv"


cd build

git clone --branch 3.4.18 https://github.com/opencv/opencv.git

cd $PKG_DIR

mkdir -p build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=../platforms/linux/aarch64-gnu.toolchain.cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DCMAKE_MAKE_PROGRAM=make ..
make -j$(nproc)
make install

cd ${DIR}
