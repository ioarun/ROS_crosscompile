#! /bin/bash

echo "-------------------------------------------------------------------------"
echo "Installing yaml-cpp"
DIR=`pwd`
PKG_DIR="yaml-cpp"
PKG_GIT="https://github.com/jbeder/yaml-cpp.git"

if [ -z  $INSTALL_PREFIX ]; then
  echo "Tell me where to install this. 'export INSTALL_PREFIX=your/path/'"
  exit
fi

cd build
if [ ! -d $PKG_DIR ]; then
  git clone	$PKG_GIT
fi
cd $PKG_DIR

mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DBUILD_SHARED_LIBS=1 ..
make -j$(nproc)
make install

cd ${DIR}
