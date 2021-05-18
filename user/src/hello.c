#include <stdio.h>
#include <unistd.h>

int main() {
    puts("hello world!");
    sched_yield();
    puts("hello world!");
    puts("hello world!");
    sched_yield();
    puts("hello world!");
    return 0;
}
