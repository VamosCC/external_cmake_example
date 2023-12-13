cmake_minimum_required(VERSION 3.10)

project(installed_external)

# 使用File-copy指令在cmake配置阶段进行文件拷贝
file(INSTALL include lib
	DESTINATION ${CMAKE_SOURCE_DIR}/install/
	)

message(STATUS "dist cmake in progress!")