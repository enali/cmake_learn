FILE(REMOVE_RECURSE
  "CMakeFiles/hello.dir/hello.cc.o"
  "libhello.pdb"
  "libhello.so"
  "libhello.so.1.2"
  "libhello.so.1"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang CXX)
  INCLUDE(CMakeFiles/hello.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
