#! /bin/bash

echo "-------------------------------------------------------------------------"
echo "Installing tinyxml2"
DIR=`pwd`
PKG_DIR="tinyxml2"
PKG_GIT="https://github.com/leethomason/tinyxml2.git"

if [ -z  $INSTALL_PREFIX ]; then
  echo "Tell me where to install this. 'export INSTALL_PREFIX=your/path/'"
  exit
fi

cd build
if [ ! -d $PKG_DIR ]; then
  git clone	--branch 8.0.0 $PKG_GIT
fi
cd $PKG_DIR

mkdir -p build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DCMAKE_CXX_FLAGS=-fPIC ..
make
cp libtinyxml2.so* ${INSTALL_PREFIX}/lib/
cp ../tinyxml2.h ${INSTALL_PREFIX}/include/

cd ${DIR}
