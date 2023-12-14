cmake_minimum_required(VERSION 3.10)

project(main)

find_package(external REQUIRED
			PATHS ${CMAKE_CURRENT_SOURCE_DIR}/../install/lib/cmake
            NO_DEFAULT_PATH)
if (external_FOUND)
  message(STATUS "Found external, VERSION ${external_VERSION}, Include ${external_INCLUDEDIR}, Libdir ${external_LIBDIR}")
  message(STATUS "Found external, VERSION ${external_VERSION}, Include ${external_INCLUDE_DIRS}, Libdir ${external_LIBRARY_DIRS}, Lib ${external_LIBRARIES}")
else()
  message(STATUS "Not Found external ")
endif()

find_package(PkgConfig REQUIRED)
set(ENV{PKG_CONFIG_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/../install/lib/pkgconfig")
message(STATUS "pkg_config_path is $ENV{PKG_CONFIG_PATH}")
pkg_check_modules (External IMPORTED_TARGET external)

# link_directories( ${external_LIBRARY_DIRS})

add_executable(${PROJECT_NAME}_find_pkg
	main.cpp
	)

target_link_libraries(${PROJECT_NAME}_find_pkg
	external::external
	)


add_executable(${PROJECT_NAME}_pkg_config
	main.cpp
	)

target_link_libraries(${PROJECT_NAME}_pkg_config
	PkgConfig::External
	)