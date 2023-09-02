section .bss
    digitspace resb 100 ; I'am printing more than single digit
    digitspacepos resb 8 ; Enough space to hold a 64 bit register 

section .text
    global _start

_start: 
    mov rax, 123
    call _printint

    mov rax, 60
    mov rdi, 0
    syscall

_printint:
    mov rcx, digitspace

    mov rbx, 10
    mov [rcx], rbx
    inc rcx
    mov [digitspacepos], rcx

_printintloop:
    mov rdx, 0
    mov rbx, 10
    div rbx
    push rax
    add rdx, 48
    mov rcx, [digitspacepos]
    mov [rcx], dl
    inc rcx
    mov [digitspacepos], rcx
    pop rax
    cmp rax, 0
    jne _printintloop
_printintloop2:
    mov rcx, [digitspacepos]

    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall

    mov rcx, [digitspacepos]
    dec rcx
    mov [digitspacepos], rcx

    cmp rcx, digitspace
    jge _printintloop2
    ret
