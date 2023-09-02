%include "macros.inc"
section .bss
    digitbuffer resb 100

section .text
    global _start

_start:
    printi 2000
    exit
