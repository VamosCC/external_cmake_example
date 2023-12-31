
####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was external-config.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

include(${CMAKE_CURRENT_LIST_DIR}/external-targets.cmake)

# 指定动态库的头文件目录
set_and_check(external_INCLUDE_DIRS ${PACKAGE_PREFIX_DIR}/include)

# 指定动态库的库目录
set_and_check(external_LIBRARY_DIRS ${PACKAGE_PREFIX_DIR}/lib)

# 指定动态库
set_and_check(external_LIBRARIES ${PACKAGE_PREFIX_DIR}/lib/libexternal.so)

check_required_components(external)
