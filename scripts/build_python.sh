#!/bin/bash -e

echo "-------------------------------------------------------------------------"
echo "Installing python 2.7.3"
DIR=`pwd`
PKG_DIR="Python-2.7.3"
PKG_TAR="Python-2.7.3.tar.xz"
DOWNLOAD_LINK="http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tar.xz"
# https://www.python.org/ftp/python/2.7.17/Python-2.7.17.tar.xz # 2.7.17 is the one that comes with Ubuntu18

if [ -z  $INSTALL_PREFIX ]; then
  echo "Tell me where to install this. 'export INSTALL_PREFIX=your/path/'"
  exit
fi

cd build
if [ ! -d $PKG_DIR ]; then
  if [ ! -f $PKG_TAR ]; then
    wget $DOWNLOAD_LINK
  fi
  tar xvf $PKG_TAR
fi
cd $PKG_DIR

if [ ! -f "Python-2.7.3-xcompile.patch" ]; then
  wget https://gist.githubusercontent.com/bmount/6929380/raw/8ef8e2701e7d5b1b22c5687e93d22f6ef9ca7ec6/Python-2.7.3-xcompile.patch
fi
./configure

make python Parser/pgen
mv python hostpython
mv Parser/pgen Parser/hostpgen
make distclean

patch -p1 < Python-2.7.3-xcompile.patch

CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++ AR=aarch64-linux-gnu-ar RANLIB=aarch64-linux-gnu-ranlib CFLAGS=-fPIC CXXFLAGS=-fPIC ./configure --host=aarch64-linux-gnu --build=x86_64-linux-gnu --prefix=${INSTALL_PREFIX} --enable-shared
make -j$(nproc) HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen BLDSHARED="aarch64-linux-gnu-gcc -shared" CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_TARGET=yes HOSTARCH=aarch64-linux-gnu BUILDARCH=x86_64-linux-gnu
make install HOSTPYTHON=./hostpython BLDSHARED="aarch64-linux-gnu-gcc -shared" CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_TARGET=yes prefix=${INSTALL_PREFIX}
cd ${DIR}
