# external_cmake_example
It is a tested cmake example of using installed external example.
主要实现了将已经安装好的external库，拷贝至install目录，并在main/CMakeLists.txt中通过find_package/pkg-config等找到这个库并用import-target的方式链接。
相比在dist/CMakeLists.txt中使用install(...)命令，file(INSTALL ...)可以在cmake配置makefile过程中进行文件的拷贝，只有这样在main/CMakeLists.txt中通过find_package找external包的时候才能找到。

原始目录c++工程树如下
.
├── build
├── CMakeLists.txt
├── dist
│   ├── CMakeLists.txt
│   ├── include
│   │   └── myVector.h
│   └── lib
│       ├── cmake
│       │   └── external
│       │       ├── externalConfig.cmake
│       │       └── externalConfig-noconfig.cmake
│       ├── libexternal.so
│       └── pkgconfig
│           └── external.pc
├── install
└── main
    ├── CMakeLists.txt
    └── main.cpp

在build目录执行：
$ cmake ../ -DCMAKE_INSTALL_PREFIX={your_path}/install/
$ make
$ make install
