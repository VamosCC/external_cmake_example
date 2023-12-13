cmake_minimum_required(VERSION 3.10)
project(myProject)

# # 方法1：使用File-copy指令在cmake阶段进行文件拷贝
add_subdirectory(dist)

# file(INSTALL ${CMAKE_CURRENT_SOURCE_DIR}/dist/include
# 	DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/install/
# 	)
# file(INSTALL ${CMAKE_CURRENT_SOURCE_DIR}/dist/lib
# 	DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/install/
# 	)

# 下面的两种方法都只能在make阶段进行文件拷贝，因此在main函数的cmake阶段使用findpackage是找不到文件的

# 方法2：使用add_custom_target进行文件拷贝
# add_custom_target(dist_install ALL
#     COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/dist/include/ ${CMAKE_CURRENT_SOURCE_DIR}/install/include/
#     COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/dist/lib/ ${CMAKE_CURRENT_SOURCE_DIR}/install/lib/
#     COMMENT "Installing dist"
# )


# 方法3：使用add_custom_target进行到目前位置的make install
# add_subdirectory(dist)
# message(STATUS CMAKE_BINARY_DIR = ${CMAKE_BINARY_DIR})
# add_custom_target(dist_install ALL
#     COMMAND ${CMAKE_MAKE_PROGRAM} install        # make install
#     WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/dist
#     COMMENT "Installing dist"
# )

add_subdirectory(main)

# 方法2/3：将dist_install作为main子项目的依赖
# add_dependencies(main dist_install)

