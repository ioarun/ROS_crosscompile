#! /bin/bash

echo "-------------------------------------------------------------------------"
echo "Installing openssl 1.1.1"
DIR=`pwd`
PKG_DIR="openssl"
PKG_GIT="https://github.com/openssl/openssl.git"

if [ -z  $INSTALL_PREFIX ]; then
  echo "Tell me where to install this. 'export INSTALL_PREFIX=your/path/'"
  exit
fi

cd build
if [ ! -d $PKG_DIR ]; then
  git clone	$PKG_GIT
fi
cd $PKG_DIR
# git checkout OpenSSL_1_1_1

./Configure linux-aarch64 shared --prefix=${INSTALL_PREFIX} --openssldir=${INSTALL_PREFIX}/openssl --cross-compile-prefix=aarch64-linux-gnu-

make -j$(nproc)
make install

cd ${DIR}
