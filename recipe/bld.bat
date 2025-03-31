mkdir build
cd build

:: Define the `SPDLOG_COMPILED_LIB` compiler definition
:: to make sure the spdlog shared library exports all symbols
:: correctly and that those symbols can be imported correctly then.
:: See: https://github.com/gabime/spdlog/blob/48bcf39a661a13be22666ac64db8a7f886f2637e/include/spdlog/common.h#L28-L48
set CMAKE_CXX_FLAGS="%CMAKE_CXX_FLAGS% -DSPDLOG_COMPILED_LIB"
set CMAKE_C_FLAGS="%CMAKE_C_FLAGS% -DSPDLOG_COMPILED_LIB"

cmake -G "NMake Makefiles" -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D SPDLOG_BUILD_SHARED=ON -D SPDLOG_FMT_EXTERNAL=ON -D SPDLOG_BUILD_EXAMPLE=OFF ..
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
