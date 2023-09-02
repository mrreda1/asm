section .bss
    msg resb 100
section .text
    global _start
_start:
    mov rax, msg
    call _takestr

    mov rax, msg 
    call _printstr

    mov rax, 60
    mov rdi, 0
    syscall

_printstr:
    mov rbx, 1
    push rax
_printstrloop:
    inc rax
    inc rbx
    mov cl, [rax]
    cmp cl, 0
    jne _printstrloop

    mov rax, 1
    mov rdi, 1
    pop rsi
    mov rdx, rbx
    syscall
    ret

_takestr:
    push rax
    mov rax, 0
    mov rdi, 0
    pop rsi
    mov rdx, 100
    syscall
    ret
