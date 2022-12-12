#!/bin/bash -e

echo "-------------------------------------------------------------------------"
echo "Installing ceres 2.0.0"
DIR=`pwd`
PKG_DIR="ceres-solver"


cd build

git clone --branch 2.0.0 https://github.com/ceres-solver/ceres-solver.git

cd $PKG_DIR

mkdir -p build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DCMAKE_MAKE_PROGRAM=make ..
make -j$(nproc)
make install

cd ${DIR}
