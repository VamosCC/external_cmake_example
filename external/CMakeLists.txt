# 参考博文创建自己的xxxConfig.cmake，用于第三方使用https://blog.csdn.net/xiaoxiaozengz/article/details/127399274
cmake_minimum_required(VERSION 3.10)
project(external)

#==================生成库======================
# 添加要构建的库
add_library(${PROJECT_NAME} SHARED myVector.cpp)

target_include_directories(${PROJECT_NAME} PUBLIC 
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>)

set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER "include/myVector.h")

#==================生成目标文件的xxxTarget.cmake======================
# 会将生成的库libxxx.so安装到${CMAKE_INSTALL_PREFIX}/lib下
install(TARGETS ${PROJECT_NAME}
        EXPORT ${PROJECT_NAME}-targets
        PUBLIC_HEADER DESTINATION include
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        )
# 生成 xxx-targets.cmake文件
install(EXPORT ${PROJECT_NAME}-targets
        FILE ${PROJECT_NAME}-targets.cmake
        NAMESPACE ${PROJECT_NAME}::
        DESTINATION lib/cmake/${PROJECT_NAME})

#===================生成 xxx-config.cmake=============================
# include(GNUInstallDirs) # 用于跨平台
# set(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}
#     CACHE PATH "Location of header files" )

set(INCLUDE_DIRS include)
set(LIBRARY_DIRS lib)
set(LIBRARIES lib/lib${PROJECT_NAME}.so)
set(TARGET_FILE ${PROJECT_NAME}-targets.cmake)
# 由cmake提供
include(CMakePackageConfigHelpers)

# 使用模板xxx-config.cmake.in生成xxx-config.cmake
configure_package_config_file(
  ${PROJECT_NAME}-config.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config.cmake
  INSTALL_DESTINATION lib/cmake/${PROJECT_NAME}
  PATH_VARS INCLUDE_DIRS LIBRARY_DIRS LIBRARIES TARGET_FILE
#   INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX}
  )

# 生成 xxx-configVersion.cmake 文件
write_basic_package_version_file(
  ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
  VERSION 1.0.1
  COMPATIBILITY SameMajorVersion )

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config.cmake
              ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
        DESTINATION lib/cmake/${PROJECT_NAME} )

#===================生成 xxx.pc=============================
configure_file(${PROJECT_NAME}.pc.in ${PROJECT_NAME}.pc @ONLY)
install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}.pc
        DESTINATION lib/pkgconfig)
