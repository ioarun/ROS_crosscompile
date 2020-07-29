#! /bin/bash

echo "-------------------------------------------------------------------------"
echo "Installing gpg-error"
DIR=`pwd`
PKG_DIR="libgpg-error-1.38"
PKG_TAR="libgpg-error-1.38.tar.bz2"
DOWNLOAD_LINK="https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.38.tar.bz2"

if [ -z  $INSTALL_PREFIX ]; then
  echo "Tell me where to install this. 'export INSTALL_PREFIX=your/path/'"
  exit
fi

# cd build
# if [ ! -d $PKG_DIR ]; then
#   if [ ! -f $PKG_TAR ]; then
#     wget $DOWNLOAD_LINK
#   fi
#   tar xhf $PKG_TAR
# fi
# cd $PKG_DIR
#
# # mkdir -p build
# # cd build
#
# set -e
# #AR=aarch64-linux-gnu-ar RANLIB=aarch64-linux-gnu-ranlib CFLAGS=-fPIC CXXFLAGS=-fPIC
# CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++ \
# ./configure \
# --host=aarch64-linux-gnu \
# --build=x86_64-linux-gnu \
# --prefix=${INSTALL_PREFIX}
#
# # cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake ..
# make -j$(nproc)
# make install

# cd ${DIR}
