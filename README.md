# qCore-os

## 项目介绍

毕业设计的代码部分，主要目标是用 `C` 语言完成一个基于 `RISC-V` 架构的操作系统内核。

## 日程规划

基于对自己的督促，每日在 [grad-design-schedule](https://github.com/latsumi/grad-design-schedule) 仓库里上传进度情况以及学习的笔记，希望后面总结起来会比较有条理。

## 项目当前状态

裸机环境，使用如下指令编译链接：
```
riscv -march=rv64g -mabi=lp64 -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -T ./tools/kernel.ld -Isifive_u ./kernel/entry.S -o qCore
```

然后使用QEMU运行生成的可执行文件：
```
qemu-system-riscv64 -nographic -machine sifive_u -bios none -kernel qCore
```