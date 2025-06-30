# 介绍
本目录及其子目录包含 LLVM 的源代码。LLVM 是一个用于构建高度优化的编译器、优化器和运行时环境的工具包。

# 使用说明
LLVM 项目包含多个组件。项目核心本身称为"LLVM"，包含处理中间表示(IR)并将其转换为目标文件所需的所有工具、库和头文件。工具包括汇编器、反汇编器、位码分析器和位码优化器。同时还包含基础回归测试。

C 类语言使用 Clang 前端。该组件将 C、C++、Objective-C 和 Objective-C++ 代码编译为 LLVM 位码——然后使用 LLVM 生成目标文件。

其他组件包括：
libc++ C++ 标准库、LLD 链接器等。

## 构建LLVM源代码
以下是构建LLVM源代码的示例
- cd llvm-project
- mkdir build
- cd build
- cmake -G <generator> [选项] ../llvm
    常用构建系统：
    - Ninja：生成 Ninja 构建文件（多数 LLVM 开发者使用）
    - Unix Makefiles：生成 make 兼容的并行 Makefile
    - Visual Studio：生成 Visual Studio 项目和解决方案
    - Xcode：生成 Xcode 项目

    常用选项：
    - -DLLVM_ENABLE_PROJECTS='...' --- 分号分隔的您希望额外构建的 LLVM 子项目列表。可包括：clang, clang-tools-extra, libcxx, libcxxabi, libunwind, lldb, compiler-rt, lld, polly 或 debuginfo-tests

    - -DCMAKE_INSTALL_PREFIX=目录 --- 指定 LLVM 工具和库的完整安装路径（默认 /usr/local）

    - -DCMAKE_BUILD_TYPE=类型 --- 有效类型：Debug, Release, RelWithDebInfo, MinSizeRel（默认 Debug）

    - -DLLVM_ENABLE_ASSERTIONS=On --- 启用断言检查（Debug 构建默认开启）

- cmake --build build . [-- [options] <target>]或直接使用您上面指定的构建系统。

     - 默认目标（如 ninja 或 make）将构建所有 LLVM 组件
     - check-all target（如 ninja check-all）将运行回归测试
     - CMake 会为每个工具和库生成目标，大多数 LLVM 子项目有自己的 check-<project> target.
     - 串行构建会很慢。可通过并行构建提高速度：Ninja 默认并行；make 使用 -j NNN 选项（NNN 为并行作业数）

 - 更多信息请参见[Cmake](https://llvm.org/docs/CMake.html)

# 参与贡献
如果您想为本仓库贡献代码，请向本仓库任意maintainer发送邮件
如果您找到产品中的任何Bug，欢迎您提出ISSUE