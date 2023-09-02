section .bss
    digit resb 100
    digitpos resb 8
section .text
    global _start

%macro printint 1
    mov rax, %1
    call _printint
%endmacro
%macro exit 1
    mov rax, 60
    mov rdi, %1
    syscall
%endmacro

_start:

    printint 2004
    exit 0
    
_printint: 
    mov rcx, digit
    mov rbx, 10
    mov [rcx], rbx
    inc rcx
    mov [digitpos], rcx
_printintloop:
    mov rdx, 0
    mov rbx, 10
    div rbx
    add rdx, 48
    mov rcx, [digitpos]
    mov [rcx], dl
    inc rcx
    mov [digitpos], rcx
    cmp rax, 0
    jne _printintloop
_printintloop2:
    mov rcx, [digitpos]
    
    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall
    mov rcx, [digitpos]
    dec rcx
    mov [digitpos], rcx
    cmp rcx, digit
    jge _printintloop2
    ret
