cmake_minimum_required (VERSION 2.8)
project (NEWHELLO)
add_subdirectory (src)
include (CTest)
add_test (mytest ${PROJECT_BINARY_DIR}/src/main)

message (STATUS "cmake_module_path is: ${CMAKE_MODULE_PATH}")
