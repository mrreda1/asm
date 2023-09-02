section .data
    msg db "Enter number: ",0
section .bss
    digitbuffer resb 100
    takenint resb 10
section .text
    global _start

%include "macros.inc"
_start:
    mov rax, 0
    mov rdi, 0
    mov rsi, takenint
    mov rdx, 10
    syscall
    
    mov rax, takenint
    call _strtoint
    
    mov rax, 60
    mov rdi, 0
    syscall

_strtoint:
    mov rsi, rax
    push rax
_strtointloop:
    inc rsi
    mov cl, [rsi]
    cmp cl, 0
    jne _strtointloop
    dec rsi
    mov rdi, 1
    mov rbx, 0
_strtointloop2:
    mov al, [rsi]
    sub al, 48
    mov rdx, 0
    mul rdi
    add rbx, rax
    mov rax, rdi
    mov cl, 10
    mov rdx, 0
    mul rcx
    mov rdi, rax
    dec rsi
    pop rcx
    push rcx
    cmp rcx, rsi 
    jge _strtointloop2
    printi rbx
    ret
