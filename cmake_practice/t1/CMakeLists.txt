cmake_minimum_required (VERSION 2.8)

project (Hello)

set (_SRC_LIST main.cc)

message (STATUS "this is binary dir " ${PROJECT_BINARY_DIR})
message (STATUS "this is source dir " ${PROJECT_SOURCE_DIR})

add_executable (hello ${_SRC_LIST})
