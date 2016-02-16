cmake_minimum_required (VERSION 2.8)

project (Hello)

add_subdirectory (src)

install (FILES COPYRIGHT README.md
  DESTINATION share/doc/cmake/t2
  )
install (PROGRAMS runhello.sh
  DESTINATION bin
  )
install (DIRECTORY doc/
  DESTINATION share/doc/cmake/t2
  )
