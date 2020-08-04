#!/bin/bash

mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=$PREFIX -D SPDLOG_BUILD_TESTS=ON -D CMAKE_INSTALL_LIBDIR=lib ..
make -j${CPU_COUNT}
make test
make install
