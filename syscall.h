#ifndef SYSCALL_H
#define SYSCALL_H

#include "process.h"

// implement in asm_syscall.S
int get_ticks(void);
int set_vga_mode(void);
int write(char *buf, int len);
int sendrec(int function, int src_dest, Message *m, Process *p);
int printk(int unused1, int unused2, char *s, Process *proc);

#endif
