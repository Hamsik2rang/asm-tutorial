%include "io64.inc"

; 1. 초기값이 있는 메모리 변수 4개를 선언하고 크기는 1, 2, 4, 8byte로 지정한 후 16진수 값으로 초기화하라.
; 2. 초기값이 없는 1, 2, 4, 8byte 크기 메모리 변수를 각각 1개씩 선언하고 1. 에서 선언한 값을 각각 2.에서 선언한 변수로 이동시켜라.
; 3. 8개 변수를 모두 16진수로 출력하라.

; step 1
section .data
    a db 0x12
    b dw 0x1234
    c dd 0x12345678
    d dq 0x12345678abcdefef
    
; step 2
section .bss
    ra resb 1
    rb resw 1
    rc resd 1
    rd resq 1
    
section .text
global CMAIN
CMAIN:
    ;write your code here
    mov al, [a]
    mov [ra], al
    mov ax, [b]
    mov [rb], ax
    mov eax, [c]
    mov [rc], eax
    mov rax, [d]
    mov [rd], rax
    
    PRINT_HEX 1, a
    NEWLINE
    PRINT_HEX 1, ra
    NEWLINE
    PRINT_HEX 2, b
    NEWLINE
    PRINT_HEX 2, rb
    NEWLINE
    PRINT_HEX 4, c
    NEWLINE
    PRINT_HEX 4, rc
    NEWLINE
    PRINT_HEX 8, d
    NEWLINE
    PRINT_HEX 8, rd
    NEWLINE
    
    xor eax, eax
    xor rax, rax
    ret


