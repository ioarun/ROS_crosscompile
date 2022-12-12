#! /bin/bash

echo "-------------------------------------------------------------------------"
echo "Installing gpgme"
DIR=`pwd`
PKG_DIR="gpgme-1.14.0"
PKG_TAR="gpgme-1.14.0.tar.bz2"
DOWNLOAD_LINK="https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.14.0.tar.bz2"

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
# CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++ AR=aarch64-linux-gnu-ar RANLIB=aarch64-linux-gnu-ranlib CFLAGS=-fPIC CXXFLAGS=-fPIC ./configure \
# --host=aarch64-linux-gnu \
# --build=x86_64-linux-gnu \
# --prefix=${DIR}/arm-linux
#
# # cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake ..
# make -j$(nproc)
# make install
#
# cd ${DIR}

cp misc/gpgme/gpg* ${INSTALL_PREFIX}/include/
cp misc/gpgme/libgpg* ${INSTALL_PREFIX}/lib/
