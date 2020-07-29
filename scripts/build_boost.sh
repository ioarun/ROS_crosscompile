#! /bin/bash -e

echo "-------------------------------------------------------------------------"
echo "Installing boost 1.65.1"
DIR=`pwd`
PKG_DIR="boost_1_65_1"
PKG_TAR="boost_1_65_1.tar.gz"
DOWNLOAD_LINK="https://dl.bintray.com/boostorg/release/1.65.1/source/boost_1_65_1.tar.gz"

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

export C_INCLUDE_PATH=${INSTALL_PREFIX}/include/python2.7
export CPLUS_INCLUDE_PATH=${INSTALL_PREFIX}/include/python2.7

./bootstrap.sh
echo "using gcc
    : aarch64
    : aarch64-linux-gnu-g++
    : <cxxflags>-std=gnu++0x
    ; " > tools/build/src/user-config.jam
echo "using python
    : 2.7
    : ${INSTALL_PREFIX}/bin/python
    : ${INSTALL_PREFIX}/include/python2.7
    : ${INSTALL_PREFIX}/lib
    ; " >> tools/build/src/user-config.jam
./b2 -j$(nproc) install toolset=gcc-aarch64 --prefix=${INSTALL_PREFIX}
cd ${DIR}
