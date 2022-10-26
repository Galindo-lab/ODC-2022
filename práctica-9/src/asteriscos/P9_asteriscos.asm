;;   AUTHOR: Luis Eduardo Galindo Amaya
;;     DATE: 21-10-2022
;; ASSEMBLE: 
;;     LINK:     
;;      RUN:

section .data

section .bss

section .text
global _start

_start:
    ; C) Colocar en CX la cantidad de renglones con asteriscos
    ;    se desean imprimir. El procedimiento imprime las
    ;    líneas con asteriscos. La primera línea cuenta con 1
    ;    asterisco, la segunda con 2, etc.
    

    MOV AL, 'a'
    MOV CX, 26
    
.out:

    ; Print 'A' character 
    mov ecx,'A'     ; ecx should contain the value to print
    mov edx,1       ; edx should contain how many characters to print
    int 80h

    LOOP .out

    
    
    
    ; TERMINAR PROGRAMA
	mov eax, 1
	mov ebx, 0
	int 80h
