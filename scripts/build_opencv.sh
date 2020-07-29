#!/bin/bash -e

echo "-------------------------------------------------------------------------"
echo "Installing opencv 3.2"
DIR=`pwd`
PKG_DIR="opencv-3.2.0"
PKG_TAR="opencv-3.2.0.zip"
DOWNLOAD_LINK="https://netix.dl.sourceforge.net/project/opencvlibrary/opencv-unix/3.2.0/opencv-3.2.0.zip"

if [ -z  $INSTALL_PREFIX ]; then
  echo "Tell me where to install this. 'export INSTALL_PREFIX=your/path/'"
  exit
fi

cd build
if [ ! -d $PKG_DIR ]; then
  if [ ! -f $PKG_TAR ]; then
    wget $DOWNLOAD_LINK
  fi
  unzip $PKG_TAR
fi
cd $PKG_DIR

mkdir -p build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=../platforms/linux/aarch64-gnu.toolchain.cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DCMAKE_MAKE_PROGRAM=make ..
make -j$(nproc)
make install

cd ${DIR}
