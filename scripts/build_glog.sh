#!/bin/bash -e

echo "-------------------------------------------------------------------------"
echo "Installing glog v0.5.0 "
DIR=`pwd`
PKG_DIR="glog"


cd build

git clone --branch v0.5.0 https://github.com/google/glog.git

cd $PKG_DIR

mkdir -p build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DCMAKE_MAKE_PROGRAM=make ..
make -j$(nproc)
make install

cd ${DIR}
