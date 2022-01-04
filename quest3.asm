%include "io64.inc"

section .text
global CMAIN
CMAIN:
    GET_DEC 2, a
    GET_DEC 2, b
    GET_DEC 2, c
    
    mov ax, [a]
    mov bx, [b]
    cmp ax, bx
    jge lb_greater
    mov cx, bx  
    jmp lb_greater_end 
lb_greater:
    mov cx, ax
lb_greater_end:
    mov ax, [c]
    cmp ax, cx
    jge lb_set_max
    mov [max], cx
    jmp lb_set_max_end
lb_set_max:
    mov [max], ax
lb_set_max_end:

    mov ax, [a]
    mov bx, [b]
    cmp ax, bx
    jle lb_less
    mov cx, bx
    jmp lb_less_end
lb_less:
    mov cx, ax
lb_less_end:
    mov ax, [c]
    cmp ax, cx
    jle lb_set_min
    mov [min], cx
    jmp lb_set_min_end
lb_set_min:
    mov [min], ax
lb_set_min_end:

    xor eax, eax
    xor edx, edx
    
    mov ax, [max]
    mov bx, [min]
    mul bx
        
    and ax, 0x0000FFFF
    shl dx, 16
    or eax, edx
    
    mov [total], eax
    PRINT_DEC 4, total
    NEWLINE

    xor rax, rax
    ret
    
section .bss
    a resw 1
    b resw 1
    c resw 1
    
    max resw 1
    min resw 1
    
    total resd 1