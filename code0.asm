section .data
 text db 10,"Hey, I hope you have a great day!",10,10,0

section .text
    global _start

%include "macros.inc"

_start:

    print text
    exit
