#! /bin/bash

echo "-------------------------------------------------------------------------"
echo "Installing eigen 3.3.4"
DIR=`pwd`
PKG_DIR="eigen-eigen-5a0156e40feb"
PKG_TAR="3.3.4.tar.bz2"
DOWNLOAD_LINK="http://bitbucket.org/eigen/eigen/get/3.3.4.tar.bz2"

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
