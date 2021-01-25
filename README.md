# qCore-os

## 项目介绍

毕业设计的代码部分，主要目标是用 `C` 语言完成一个基于 `RISC-V` 架构的操作系统内核。

## 日程规划

基于对自己的督促，每日在 [grad-design-schedule](https://github.com/latsumi/grad-design-schedule) 仓库里上传进度情况以及学习的笔记，希望后面总结起来会比较有条理。

## 项目当前状态

完成了最小化运行内核，包括设置内存布局和初始化完成后跳转到main入口，然后调用 `openSBI` 的 `SBI_CONSOLE_PUTCHAR` 接口在屏幕上输出字符串，步骤如下：

* 首先运行 `build.sh` 进行编译链接

* 然后运行 `run.sh` 在QEMU中运行生成的 `hello.elf`

