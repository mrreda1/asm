section .bss
    result resb 20
    digitbuffer resb 100

section .text
    global _start

_start:
    mov rax, 7
    call _febonacci

    mov rax, 60
    mov rdi, 0
    syscall

_febonacci:
    mov rbx, 1
    mov rcx, 0
    dec rax
_febonacciloop:
    push rbx
    add rbx, rcx
    pop rcx
    dec rax
    cmp rax, 0
    jne _febonacciloop
    mov rax, rbx
    call _prtdigit
    ret

_prtdigit:
    mov rcx, digitbuffer
    mov rbx, 10
    mov [rcx], rbx
    inc rcx
_prtdigitloop:
    mov rdx, 0
    mov rbx, 10
    div rbx
    add rdx, 48
    mov [rcx], dl
    inc rcx
    cmp rax, 0
    jne _prtdigitloop
_prtdigitloop2:
    dec rcx
    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    push rcx
    syscall
    pop rcx
    cmp rcx, digitbuffer
    jge _prtdigitloop2
    ret

_prints:
    PUSH RAX
    MOV RBX, 0
_printsloop:
    INC RAX
    INC RBX
    MOV CL, [RAX]
    CMP CL, 0
    JNE _printsloop

    MOV RAX, 1
    MOV RDI, 1
    POP RSI
    MOV RDX, RBX
    SYSCALL
    RET
