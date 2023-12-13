cmake_minimum_required(VERSION 3.10)

project(main)

# find_package(external REQUIRED
# 			PATHS ${CMAKE_CURRENT_SOURCE_DIR}/../install/lib/cmake
#             NO_DEFAULT_PATH)
# find_package(PkgConfig REQUIRED)
# set(ENV{PKG_CONFIG_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/../install/lib/pkgconfig")
# message(STATUS "pkg_config_path is $ENV{PKG_CONFIG_PATH}")
# pkg_check_modules (External IMPORTED_TARGET external)


link_directories(
# 	${CMAKE_CURRENT_SOURCE_DIR}/../dist/
	${CMAKE_CURRENT_SOURCE_DIR}/../install/lib
)

add_executable(${PROJECT_NAME}
	main.cpp
	)

target_link_libraries(${PROJECT_NAME}
	external
# 	PkgConfig::External
	)