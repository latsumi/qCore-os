OUTPUT_ARCH( "riscv" )  /*输入文件的架构是riscv*/

OUTPUT_FORMAT("elf64-littleriscv")  /*表示elf64小端*/

ENTRY( _start ) /*表示函数入口是_start*/

SECTIONS
{
  /* text: test code section */
  . = 0x80200000;
  start = .;

  .text : {
     stext = .;
        *(.text.entry)
        *(.text .text.*)
        . = ALIGN(4K);
        etext = .;
  }

  .data : {
        sdata = .;
        *(.data .data.*)
        edata = .;
  }

  .bss : {
        sbss = .;
        *(.bss .bss.*)
        ebss = .;
  }

  PROVIDE(end = .);
}