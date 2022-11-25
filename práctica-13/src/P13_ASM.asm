section .data

section .bss

section .text
global sumaMatrices:

sumaMatrices:
    push ebp
    mov ebp, esp
    
	push EBX
	push EDI
	push ESI

    ;[ebp+8]                    ;a
    ;[ebp+12]                   ;b
    ;[ebp+16]                   ;c
    
    ;[ebp+20]                   ;columnas
    ;[ebp+24]                   ;filas

    mov eax, [ebp+20]           ;columnas
    mov ecx, [ebp+24]           ;filas
    mul ecx                     ;EDX:EAX = EAX*ECX
    mov edx, eax                ;guardar bits menos signi.
    
    mov ecx, edx
    mov esi, [ebp+16]           ;matriz c
    
    mov eax, [ebp+8]            ;matriz a
    mov edi, 0                  ;iterador

.sumar_A:
    mov ebx, [eax+edi*4]
    add [esi+edi*4], ebx
    inc edi
    loop .sumar_A

    mov ecx, edx
    mov eax, [ebp+12]            ;matriz b
    mov edi, 0                   ;iterador
    
.sumar_B:
    mov ebx, [eax+edi*4]
    add [esi+edi*4], ebx
    inc edi
    loop .sumar_B
    
    pop ESI
	pop EDI
	pop EBX

	mov esp, ebp
	pop EBP
	ret

    
