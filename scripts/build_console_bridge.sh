#! /bin/bash

echo "-------------------------------------------------------------------------"
echo "Installing console_bridge"
DIR=`pwd`

PKG_DIR="console_bridge"
PKG_GIT="https://github.com/ros/console_bridge.git"

if [ -z  $INSTALL_PREFIX ]; then
  echo "Tell me where to install this. 'export INSTALL_PREFIX=your/path/'"
  exit
fi

cd build
if [ ! -d $PKG_DIR ]; then
  git clone	$PKG_GIT
fi
cd $PKG_DIR
# git checkout 8c3c62501bf8521dcf53705b497ea982b874c25d

mkdir -p build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake ..
make
make install
cd ${DIR}
