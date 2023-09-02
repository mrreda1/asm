%macro exit 0
    MOV RAX, 60
    MOV RDI, 0
    SYSCALL
%endmacro

%macro prints 1
    MOV RAX, %1
    CALL _prints
%endmacro

%macro printi 1
    mov rax, %1
    call _prtdigit
%endmacro

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
