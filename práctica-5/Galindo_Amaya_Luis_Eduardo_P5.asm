
%include "./pc_io.inc"
    
section	.text
global _start
    
_start:
    mov edx,msg0                ; "HELLO WORLD"
    call puts

    mov edx,msg1                ; "OTRO STRING"
    call puts

    mov edx,msg2                ; "Y OTRO"
    call puts

    mov edx, msg3               ; "CAPTURA CARACTER"
    call puts
    
    call getch                  ; CAPTURA CARACTER
    push eax
    call putchar                ; MUESTRA CARACTER
    
    mov edx, msg4
    call puts
    
    mov	eax,1                   ; TERMINAR PROGRAMA
    int	0x80                    

section	.data
    msg0 db 'Hello, world!', 0xA, 0x0
    msg1 db 'Otro String!', 0xA, 0x0
    msg2 db 'y otro String!', 0xA, 0x0
    msg3 db 'Captura caracter', 0xA, 0x0    
    msg4 db 0xA, 0x0            ;TERMINADOR DE CADENA
