OUTPUT_ARCH( "riscv" )  /*输入文件的架构是riscv*/

OUTPUT_FORMAT("elf64-littleriscv")  /*表示elf64小端*/

ENTRY( _start ) /*表示函数入口是_start*/

SECTIONS
{
  /* text: test code section */
  . = 0x80000000;   /*起始地址开始处*/
  .text : { *(.text) }
  /* data: Initialized data segment */
  .gnu_build_id : { *(.note.gnu.build-id) }
  .data : { *(.data) }
  .rodata : { *(.rodata) }
  .sdata : { *(.sdata) }
  .debug : { *(.debug) }
  . += 0x8000;
  stack_top = .;

  /* End of uninitalized data segement */
  _end = .;
}