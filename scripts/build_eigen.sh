#! /bin/bash

echo "-------------------------------------------------------------------------"
echo "Installing eigen 3.3.4"
DIR=`pwd`
PKG_DIR="eigen-3.3.4"
PKG_TAR="eigen-3.3.4.tar.gz"
DOWNLOAD_LINK="https://gitlab.com/libeigen/eigen/-/archive/3.3.4/eigen-3.3.4.tar.gz"

if [ -z  $INSTALL_PREFIX ]; then
  echo "Tell me where to install this. 'export INSTALL_PREFIX=your/path/'"
  exit
fi

cd build
if [ ! -d $PKG_DIR ]; then
  if [ ! -f $PKG_TAR ]; then
    wget $DOWNLOAD_LINK
  fi
  tar xhf $PKG_TAR
fi
cd $PKG_DIR

mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake ..
make -j$(nproc)
make install

cd ${DIR}
