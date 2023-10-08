cmake_minimum_required(VERSION 3.17)

set(TAICHI_AOT_APP_NAME TaichiAot)
project(${TAICHI_AOT_APP_NAME} LANGUAGES C CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")


# Declare executable target.
add_executable(${TAICHI_AOT_APP_NAME} taichi_build_test.cc taichi_kernel.cc)
target_include_directories(${TAICHI_AOT_APP_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/include)

# Find and link Taichi runtime library.
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
find_package(Taichi REQUIRED)
target_link_libraries(${TAICHI_AOT_APP_NAME} Taichi::Runtime)