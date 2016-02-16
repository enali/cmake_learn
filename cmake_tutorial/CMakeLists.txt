### cmake最小版本要求
cmake_minimum_required (VERSION 2.8)

### 项目名
project (Tutorial)

### 设置项目版本号
# 设置版本变量
set (Tutorial_VERSION_MAJOR 1)
set (Tutorial_VERSION_MINOR 0)

# 测试系统是否提供log和exp函数,如果提供,则定义HAVE_LOG,HAVE_EXP
include (CheckFunctionExists)
check_function_exists (log HAVE_LOG)
check_function_exists (exp HAVE_EXP)

# 设置标志决定链接时使用哪个库
option (USE_MYMATH "Use tutorial provided math implementation" ON)

# 由.h.in文件生成.h文件,同时执行相应函数和变量替换
configure_file (
  "${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
  "${PROJECT_BINARY_DIR}/TutorialConfig.h"
  )

# 添加项目二进制目录到包含路径中
include_directories ("${PROJECT_BINARY_DIR}")


# 选择编译
if (USE_MYMATH)
  # 将子目录添加到包含路径中
  include_directories ("${PROJECT_SOURCE_DIR}/MathFunctions")
  # 添加子目录,意即执行子目录中的CMakeLists.txt
  add_subdirectory (MathFunctions)
  # 将子目录的库添加到变量EXTRA_LIBS中
  set (EXTRA_LIBS ${EXTRA_LIBS} MathFunctions)
endif (USE_MYMATH)


### 生成
# 指定可执行文件名
add_executable (Tutorial tutorial.cc)
# 链接
target_link_libraries (Tutorial ${EXTRA_LIBS})

### 安装
### 默认/usr/local/,可通过-DCMAKE_INSTALL_PREFIX选项改变
# 安装可执行文件
install (TARGETS Tutorial DESTINATION bin)
# 安装头文件
install (FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h" DESTINATION include)

### 测试
include (CTest)
# 测试程序是否正常运行,add_test(testname testexe testargs)
add_test (TutorialRuns Tutorial 25)

# 定义宏,方便添加一种类型的测试
macro (do_test testname arg result)
  add_test (Tutorial${testname} Tutorial ${arg})
  set_tests_properties (Tutorial${testname} PROPERTIES PASS_REGULAR_EXPRESSION "${arg} is ${result}")
endmacro (do_test)

do_test ("num" 25 5)
do_test ("negtive" -25 0)
do_test ("small" 0.0001 0.01)

# 测试无参数时输出的帮助信息是否正确
add_test (TutorialUsage Tutorial)
set_tests_properties (TutorialUsage PROPERTIES PASS_REGULAR_EXPRESSION "Usage:.*number")

### 将软件打包成各种类型的包,如.dev, .rpm等
# 构建cpack驱动的安装包
include (InstallRequiredSystemLibraries)
# 设置源码协议文件
set (CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
# 设置包主版本号
set (CPACK_PACKAGE_VERSION_MAJOR "${Tutorial_VERSION_MAJOR}")
# 设置包副版本号
set (CPACK_PACKAGE_VERSION_MINOR "${Tutorial_VERSION_MINOR}")
include (CPack)

message ("cmake_root is ${CMAKE_ROOT}")
message ("project_binary_dir is ${PROJECT_BINARY_DIR}")
message ("project_source_dir is ${PROJECT_SOURCE_DIR}")
message ("use_mymath is ${USE_MYMATH}")
message ("HAVE_EXP is ${HAVE_EXP}")
message ("HAVE_LOG is ${HAVE_LOG}")
message (${CMAKE_SYSTEM_NAME})

# MSVC
if (UNIX)
  message ("unix")
endif (UNIX)
