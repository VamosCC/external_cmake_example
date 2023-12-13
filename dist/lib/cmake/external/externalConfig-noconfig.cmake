#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "external::external" for configuration ""
set_property(TARGET external::external APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(external::external PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libexternal.so"
  IMPORTED_SONAME_NOCONFIG "libexternal.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS external::external )
list(APPEND _IMPORT_CHECK_FILES_FOR_external::external "${_IMPORT_PREFIX}/lib/libexternal.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
