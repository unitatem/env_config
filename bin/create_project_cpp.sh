#!/bin/bash

name=$1

mkdir "$name"
cd "$name"

cat >.gitignore <<EOF
build/

EOF

cat > CMakeLists.txt <<EOF
cmake_minimum_required(VERSION 3.10)
project($name)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

option(TESTS "enable/disable tests" ON)

add_compile_options(
    -Wall
    -Wextra
    -Werror
    -Wshadow
    -Wnon-virtual-dtor
    -pedantic
    )

include_directories(include)
add_subdirectory(src)

if (TESTS)
    add_subdirectory(tests)
endif ()

EOF

mkdir include
pushd include > /dev/null
mkdir "$name"
popd > /dev/null

mkdir build

mkdir src
touch src/CMakeLists.txt

mkdir tests
touch tests/CMakeLists.txt

mkdir tools
cat > tools/build.sh <<EOF
#!/bin/bash

mkdir -p build && cmake . -B./build && cmake --build build

EOF
chmod u+x tools/build.sh

cat > tools/test.sh <<EOF
#!/bin/bash

cd build/tests && export GTEST_COLOR=1; ctest -V

EOF

tree

