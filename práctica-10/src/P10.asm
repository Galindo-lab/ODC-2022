;;   AUTHOR: Luis Eduardo Galindo Amaya
;;     DATE: 21-10-2022
;; ASSEMBLE: 
;;     LINK:     
;;      RUN:

; %include "./lib/pc_io.inc"
    
section .data
    testmsg db "afdsfsfs",0xA,0x0
    filepath db "P10.txt",0x0
    
section .bss
    filebuffer resb 255
    
    testimp resb 20
    testimplenght resb 20

section .text
global _start

_start:

    call myreadfile


    
    mov ecx, testmsg
    call myputs

    mov ecx, testmsg
    call myputs
 
    mov ecx, testimp
    mov edx, testimplenght
    call mygets

    call myputs
    
	mov	eax, 1                  ;terminar programa
	mov ebx, 0
	int 80h


myreadfile:
	mov	eax, 5                  ;Obtener el descriptor
	mov	ebx, filepath
	mov	ecx, 0
	mov	edx, 0
	int	80h
    
    mov esi, eax                ;guardar el descriptor 

    mov eax, 3                  ;mueve los primeros 255
    mov ebx, esi                ;del archivo a file_buffer
    mov ecx, filebuffer       
    mov edx, 255
    int 80h

    mov eax, 6                  ;cierra el archivo
    mov ebx, esi
    int 80h 
    
    call myputs                 ;imprime el contenido del 
    ret

    
    
;; mygets
;; ======
;; captura un string en una seccion reservada de memoria
;;
;; Entradas:
;; - ecx, puntero a el string
;; - edx, tamaño maximo de entrada
;;
mygets:
    mov eax, 3                  ;numero de la interrupción
    mov ebx, 0                  ;unidad de salida
	int 80h    
    ret
    
;; myputs
;; ====
;; Imprime el string en ecx
;;
;; Entradas:
;; - ecx, puntero a el string
;;
myputs:
    call string_lenght          ;mueve el tamaño del ecx en edx
    mov eax,4
    mov ebx,1
	int 80h
    ret


;; string_lenght
;; =============
;; Cuenta el numero de caracteres hasta el terminado de cadena
;; y lo almacena en edx.
;; 
;; NOTE:
;; si el string no tiene terminador esto se queda en un bucle
;; infinito.
;;
;; Entradas:
;; - ecx, puntero a el string
;;
;; Salidas:
;; - edx, numero de caracteres
;;
string_lenght:
    mov edx, 0
    mov eax, ecx
    
.contloop:
    cmp byte[ecx], 0            ;si el contenido en ecx es 0
    jz .endloop                 ;termina el contador
    
    inc ecx                     ;incrementa la posicion del puntero
    inc edx                     ;incrementa el numero de caracteres
    jmp .contloop               ;continua 

.endloop:
    mov ecx, eax
    ret
