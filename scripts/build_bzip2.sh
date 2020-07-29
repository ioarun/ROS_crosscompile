#! /bin/bash

echo "-------------------------------------------------------------------------"
echo "Installing bzip2 1.0.6"
DIR=`pwd`
PKG_DIR="bzip2-1.0.6"
PKG_GIT="https://github.com/enthought/bzip2-1.0.6.git"

if [ -z  $INSTALL_PREFIX ]; then
  echo "Tell me where to install this. 'export INSTALL_PREFIX=your/path/'"
  exit
fi

cd build
if [ ! -d $PKG_DIR ]; then
  git clone	$PKG_GIT
fi
cd $PKG_DIR

make install CC=aarch64-linux-gnu-gcc AR=aarch64-linux-gnu-ar CFLAGS=-fPIC PREFIX=${INSTALL_PREFIX}
cd ${DIR}
