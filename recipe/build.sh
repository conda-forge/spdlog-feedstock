#!/bin/bash

mkdir build
cd build

cmake ${CMAKE_ARGS} -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=$PREFIX -D SPDLOG_BUILD_TESTS=ON -D CMAKE_INSTALL_LIBDIR=lib -D SPDLOG_BUILD_SHARED=ON -D SPDLOG_FMT_EXTERNAL=ON -D SPDLOG_BUILD_EXAMPLE=OFF ..
make -j${CPU_COUNT}
if [[ ( "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ) && "$target_platform" != osx-* ]]; then
ctest -VV --output-on-failure
fi
make install
