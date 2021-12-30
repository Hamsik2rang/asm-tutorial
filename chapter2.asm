%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here    
    GET_DEC 2, ax
    GET_DEC 2, bx
    mov cx, ax
    mov dx, ax
    add cx, dx                  ; cx = cx + dx
    mov [add_result], word cx   ; if move data register into memory, must assign data size.
    PRINT_DEC 2, add_result
    NEWLINE
    
    mov cx, ax
    mov dx, bx
    sub cx, dx                  ; cx = cx - dx
    mov [sub_result], word cx
    PRINT_DEC 2, sub_result
    NEWLINE
    
    mov ax, 0
    mov al, 2   ; multiplicand must be stored in al register
    mov bx, 3   ; for 3 * 2
    mul bx      ; ax = ax * bx. result of multiply is always stored in ax register. (in case of 1byte multiply)
    
    PRINT_DEC 1, ax
    NEWLINE
    
    mov ax, 7   ; dividend must be stored in ax register
    mov bl, 2   
    div bl      ; result of div is stored in al(quotient) and ah(remainder) separately. (in case of 1byte divide)
    
    mov bl, ah
    PRINT_DEC 1, al
    NEWLINE
    
    PRINT_DEC 1, bl
    NEWLINE
    
    xor rax, rax
    ret
   
section .bss
    add_result resw 1
    sub_result resw 1
    mul_result resw 1
    div_result resw 1
    
section .data
    msg1 db 'Hello, World!', 0x0D,'Bye, World!', 0