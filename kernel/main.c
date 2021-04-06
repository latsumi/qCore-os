#include "defs.h"

extern char ekernel[];
extern char s_bss[];
extern char e_bss[];

void clean_bss() {
    char* p;
    for(p = s_bss; p < e_bss; ++p)
        *p = 0;
}

void main() {
    clean_bss();
    printf("\n");
    printf("hello world!\n");
    trapinit();
    batchinit();
    run_next_app();
}
