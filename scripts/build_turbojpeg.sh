#! /bin/bash

echo "-------------------------------------------------------------------------"
echo "Installing libjpeg-turbo8 1.5.2"
DIR=`pwd`
PKG_DIR="libjpeg-turbo-1.5.2"
PKG_TAR="libjpeg-turbo-1.5.2.tar.gz"
DOWNLOAD_LINK="https://nchc.dl.sourceforge.net/project/libjpeg-turbo/1.5.2/libjpeg-turbo-1.5.2.tar.gz"

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

./configure --host=aarch64-linux-gnu CC=aarch64-linux-gnu-gcc AR=aarch64-linux-gnu-ar STRIP=aarch64-linux-gnu-strip RANLIB=aarch64-linux-gnu-ranlib --prefix=${INSTALL_PREFIX} CFLAGS=-fPIC CXXFLAGS=-fPIC
make
make install

cd ${DIR}
