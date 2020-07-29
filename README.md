# ROS aarch64 crosscompiler

ROS melodic cross compile for arm64/aarch64 architecture

## Crosscompiled ROS components

- ros_comm
- common_msgs
- sensor_msgs
- image_transport
- vision_opencv
- tf

## Install build dependencies
First. you have to install build dependencies.
Start with cloning this repositiory

```bash
git clone https://github.com/teshanshanuka/ROS_crosscompile.git
cd ROS_crosscompile
./scripts/install_dependencies.sh
```

## Cross compile dependencies
ROS depends on some libraries. You also have to cross compile these libraries.
The script cross compiles for **aarch64** by using `gcc-aarch64-linux-gnu`
or `g++-aarch64-linux-gnu`

Basic ROS stuff depends on following packages

- bzip2 1.0.6
- console_bridge
- lz4
- poco 1.8.0.1
- tinyxml2
- python 2.7
- boost 1.65.1
- opencv 3.2.0
- eigen 3.3.4
- turbojpeg 1.5.2
- yamlcpp
- openssl
- log4cxx (not croscompiling)
- gpgrt (not croscompiling)
- gpgme (not croscompiling)

The script file `build_dependencies.sh` will cross compile above libraries into
the path specified by `INSTALL_PREFIX`

```bash
export INSTALL_PREFIX="/desired/install/directory"
./scripts/build_dependencies.sh
```

## Cross Compile ROS

```bash
export INSTALL_PREFIX="/desired/install/directory"
./scripts/xcompile.sh
```

# TODO

1. `catkin_make` can't find `pthread` - [My question on answers.ros](https://answers.ros.org/question/358263/cross-compiled-ros-cant-find-pthread/)
2. Crosscompile **log4cxx** - [ROS nao guide which didn't work](http://wiki.ros.org/nao/Installation/Cross-Compiling_Catkin
)
3. Crosscompile **gpgme** and **gpg-error** - [Similar problem on gnupg mailing list](https://lists.gnupg.org/pipermail/gnupg-users/2012-June/044884.html)
