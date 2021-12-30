%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    ;write your code here
    xor ax, ax
    
    GET_DEC 1, a
    GET_DEC 1, b
        
    mov al, [a]
    add al, [b]
    mov [sum_result],byte al
    
    mov al, [a]
    sub al, [b]
    mov [sub_result], byte al

    mov al, [a]
    mov bx, [b]
    mul bx
    mov [mul_result], ax
    
    mov ax, 0
    mov al, [a]
    mov bl, [b]
    div bl
    mov [q_result], al
    mov [d_result], ah
            
    PRINT_STRING str_sum
    PRINT_DEC 1, [sum_result]
    NEWLINE
    PRINT_STRING str_sub
    PRINT_DEC 1, [sub_result]
    NEWLINE
    PRINT_STRING str_mul
    PRINT_DEC 1, [mul_result]
    NEWLINE
    PRINT_STRING str_quo
    PRINT_DEC 1, [q_result]
    NEWLINE
    PRINT_STRING str_div
    PRINT_DEC 1, [d_result]
    NEWLINE
    
    xor rax, rax
    ret
    
 section .data
    a db 0
    b db 0
    
    sum_result db 0
    sub_result db 0
    mul_result db 0
    q_result db 0
    d_result db 0
    
    str_sum db 'SUM:' , 0x00
    str_sub db 'SUB:' , 0x00
    str_mul db 'MUL:' , 0x00
    str_quo db 'QUO:' , 0x00
    str_div db 'DIV:' , 0x00