include_directories (/usr/local/include/hello)
aux_source_directory (. SRC_LIST)
add_executable (main ${SRC_LIST})
#或
#exec_program (ls ${CMAKE_CURRENT_SOURCE_DIR}
  #ARGS "*.cc" 
  #OUTPUT_VARIABLE LS_OUTPUT
  #RETURN_VALUE LS_RVALUE
  #)
#if (NOT LS_RVALUE)
  #message (STATUS "ls result: ${LS_OUTPUT}")
#endif (NOT LS_RVALUE)

#add_executable (main ${LS_OUTPUT})

target_link_libraries (main hello)

#或指定CMAKE_INCLUDE_PATH环境变量
#find_path(myHeader hello.hpp)
#if (myHeader)
  #include_directories (${myHeader})
#endif (myHeader)
