find_path (HELLO_INCLUDE_DIR hello.hpp 
  /usr/include/hello
  /usr/local/include/hello
  )

find_library (HELLO_LIBRARY 
  NAMES hello
  PATH /usr/lib /usr/local/lib
  )

if (HELLO_INCLUDE_DIR AND HELLO_LIBRARY)
  set (HELLO_FOUND TRUE)
endif (HELLO_INCLUDE_DIR AND HELLO_LIBRARY)

if (HELLO_FOUND)
  if (NOT HELLO_FIND_QUIETLY)
    message (STATUS "Found Hello: ${HELLO_LIBRARY}")
  endif (NOT HELLO_FIND_QUIETLY)
else (HELLO_FOUND)
  if (HELLO_FIND_REQUIRED)
    message(FATAL_ERROR "Could not find hello library")
  endif (HELLO_FIND_REQUIRED)
endif (HELLO_FOUND)
