#! /bin/bash

echo "-------------------------------------------------------------------------"
echo "Installing lz4"
DIR=`pwd`
PKG_DIR="lz4"
PKG_GIT="https://github.com/lz4/lz4"

if [ -z  $INSTALL_PREFIX ]; then
  echo "Tell me where to install this. 'export INSTALL_PREFIX=your/path/'"
  exit
fi

cd build
if [ ! -d $PKG_DIR ]; then
  git clone	$PKG_GIT
fi
cd $PKG_DIR

make CC=aarch64-linux-gnu-gcc AR=aarch64-linux-gnu-ar CFLAGS=-fPIC
cp lib/lib* ${INSTALL_PREFIX}/lib/
cp lib/*.h ${INSTALL_PREFIX}/include/

cd ${DIR}
