%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov ax, 20
    mov bx, 20
    
    cmp ax, bx
    je lb_equal
    mov cx, 0
    jmp lb_equal_end    
    
lb_equal:
    mov cx, 100
lb_equal_end:   

    PRINT_DEC 2, cx
    NEWLINE  
    xor rax, rax
    ret
    
section .bss
    a resw 1
    b resw 1