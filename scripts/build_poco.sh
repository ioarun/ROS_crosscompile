#! /bin/bash

echo "-------------------------------------------------------------------------"
echo "Installing poco 1.8.0.1"
DIR=`pwd`
PKG_DIR="poco-1.8.0.1"
PKG_TAR="poco-1.8.0.1.tar.gz"
DOWNLOAD_LINK="https://pocoproject.org/releases/poco-1.8.0.1/poco-1.8.0.1.tar.gz"

if [ -z  $INSTALL_PREFIX ]; then
  echo "Tell me where to install this. 'export INSTALL_PREFIX=your/path/'"
  exit
fi

cd build
if [ ! -d $PKG_DIR ]; then
  if [ ! -f $PKG_TAR ]; then
    wget $DOWNLOAD_LINK
  fi
  tar xzf $PKG_TAR
fi
cd $PKG_DIR

cp ../../config/ARM-Linux-gnuaarch64 build/config/

./configure --config=ARM-Linux-gnuaarch64 --prefix=${INSTALL_PREFIX} --no-samples --no-tests
make -j$(nproc)
make install
cd ${DIR}
