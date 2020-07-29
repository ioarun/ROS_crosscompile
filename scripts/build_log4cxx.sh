#! /bin/bash

echo "-------------------------------------------------------------------------"
echo "Installing log4cxx 0.10.0"
DIR=`pwd`
PKG_DIR="apache-log4cxx-0.10.0"
PKG_TAR="apache-log4cxx-0.10.0.zip"
DOWNLOAD_LINK="https://downloads.apache.org/logging/log4cxx/0.10.0/apache-log4cxx-0.10.0.zip"

if [ -z  $INSTALL_PREFIX ]; then
  echo "Tell me where to install this. 'export INSTALL_PREFIX=your/path/'"
  exit
fi

# Log 4xx cannot be cross compiled. --host=aarch64-linux-gnu is not understood by configure

# cd build
# if [ ! -d $PKG_DIR ]; then
#   if [ ! -f $PKG_TAR ]; then
#     wget $DOWNLOAD_LINK
#   fi
#   unzip $PKG_TAR
# fi
# cd $PKG_DIR

# CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++ LINK=aarch64-linux-gnu-ld CFLAGS=-fPIC CXXFLAGS=-fPIC ./configure \
# --prefix=${INSTALL_PREFIX} #\
# --host=aarch64-linux-gnu \
# --build=x86_64-linux-gnu
# make
# make install

####################################################################
# from http://wiki.ros.org/nao/Installation/Cross-Compiling_Catkin #
####################################################################
# add '#include <cstring>' in src/main/cpp/inputstreamreader.cpp and src/main/cpp/socketoutputstream.cpp and
# '#include <cstring>' + '#include <cstdio>' in src/examples/cpp/console.cpp
# CC=i686-aldebaran-linux-gnu-gcc CXX=i686-aldebaran-linux-gnu-g++ LINK=i686-aldebaran-linux-gnu-ld ./configure \
# --prefix=$ROSDEPS --with-apr=$ROSDEPS --with-apr-util=$ROSDEPS
# cd src/main/cpp && cp .libs/liblog4cxx.a .libs/liblog4cxx.lai
# make install
#  |
# \ /
#  V
# grep -q '#include <cstring>' src/main/cpp/inputstreamreader.cpp || sed -i '1i #include <cstring>' src/main/cpp/inputstreamreader.cpp
# grep -q '#include <cstring>' src/main/cpp/socketoutputstream.cpp || sed -i '1i #include <cstring>' src/main/cpp/socketoutputstream.cpp
#
# grep -q '#include <cstdio>' src/examples/cpp/console.cpp || sed -i '1i #include <cstdio>' src/examples/cpp/console.cpp
# grep -q '#include <cstring>' src/examples/cpp/console.cpp || sed -i '1i #include <cstring>' src/examples/cpp/console.cpp
#
# CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++ LINK=aarch64-linux-gnu-ld CFLAGS=-fPIC CXXFLAGS=-fPIC ./configure \
# --prefix=${INSTALL_PREFIX} --with-apr=${INSTALL_PREFIX} --with-apr-util=${INSTALL_PREFIX}
####################################################################

# make
# make install
# cd ${DIR}

# since above does not work, we're copying header files to the install directory
cp -r misc/log4cxx/ ${INSTALL_PREFIX}/include/
