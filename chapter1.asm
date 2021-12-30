%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov eax, 0x1234
    mov ax, 0x1234
    mov ax, bx
    
    PRINT_DEC 1, eax
    NEWLINE
    
    xor rax, rax
    ret
    
section .bss    ; 초기화되지 않은 변수
    a resb 1    ; byte * 1개
    b resw 2    ; word * 2개
    c resd 1    ; dword * 1개
    d resq 3    ; qword * 3
    
section .data               ; 초기화된 변수
    x db 0x33               ; 0x33으로 초기화된 byte 크기 변수 x 선언
    y dw 0x1234             ; 0x1234로 초기화된 word 크기 변수 y 선언
    z dd 0x12345678         ; 0x12345678로 초기화된 dword 크기 변수 z 선언
    w dq 0x12345678abcdefef ; 0x12345678abcdefef로 초기화된 qword 크기 변수 w 선