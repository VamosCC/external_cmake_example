cmake_minimum_required(VERSION 3.10)
project(external)

# 添加要构建的库
add_library(${PROJECT_NAME} SHARED myVector.cpp)

# 设置库的安装路径
install(TARGETS ${PROJECT_NAME}
        EXPORT ${PROJECT_NAME}Config
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        )
install(FILES myVector.h DESTINATION include)
# 生成.cmake文件
install(EXPORT ${PROJECT_NAME}Config
        FILE ${PROJECT_NAME}Config.cmake
        NAMESPACE ${PROJECT_NAME}::
        DESTINATION lib/cmake/${PROJECT_NAME})

# 生成.pc文件
configure_file(${PROJECT_NAME}.pc.in ${PROJECT_NAME}.pc @ONLY)
install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}.pc
        DESTINATION lib/pkgconfig)