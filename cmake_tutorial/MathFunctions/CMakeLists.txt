# 首先,添加用于生成表的可执行程序目标
add_executable(MakeTable MakeTable.cc)

# 添加生成表的命令
add_custom_command (
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/Table.h
  COMMAND MakeTable ${CMAKE_CURRENT_BINARY_DIR}/Table.h
  DEPENDS MakeTable
  )

# 添加当前目录到包含路径
include_directories( ${CMAKE_CURRENT_BINARY_DIR} )

# 添加库生成目标
add_library(MathFunctions mysqrt.cc ${CMAKE_CURRENT_BINARY_DIR}/Table.h  )

# 配置安装
install (TARGETS MathFunctions DESTINATION bin)
install (FILES MathFunctions.h DESTINATION include)
