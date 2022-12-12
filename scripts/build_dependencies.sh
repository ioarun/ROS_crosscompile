#! /bin/bash -e
DIR=`pwd`
DIR_NAME=`basename ${DIR}`

# user must have access to this directory
if [ -z $INSTALL_PREFIX ]; then
  export INSTALL_PREFIX="/xcompiled_aarch64"
fi

mkdir -p build
mkdir -p ${INSTALL_PREFIX}/bin
mkdir -p ${INSTALL_PREFIX}/lib
mkdir -p ${INSTALL_PREFIX}/include

if [ $DIR_NAME == ROS_crosscompile ] ; then
  echo "Building dependencies with aarch64-linux-gnu"
  ./scripts/build_bzip2.sh
  ./scripts/build_console_bridge.sh
  ./scripts/build_lz4.sh
  ./scripts/build_poco.sh
  ./scripts/build_tinyxml2.sh
  ./scripts/build_python.sh
  ./scripts/build_boost.sh
  ./scripts/build_opencv.sh
  ./scripts/build_eigen.sh
  ./scripts/build_turbojpeg.sh
  ./scripts/build_yamlcpp.sh
  ./scripts/build_openssl.sh
  ./scripts/build_log4cxx.sh
  ./scripts/build_gpgrt.sh
  ./scripts/build_gpgme.sh
  ./scripts/build_glog.sh
  ./scripts/build_ceres.sh
else
  echo "Run the command from 'ROS_crosscompile' directory"
  echo "Finished with error."
fi
