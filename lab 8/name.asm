.model tiny
.data
	char db 'Y', 'A', 'S', 'H'
.code
.startup
	MOV AH, 00H 
	MOV AL, 3 
	INT 10H 
	
    mov ah,02h
	mov dl, 36
	mov dh, 12
	mov bh, 0
	int 10h
	
	lea si,char
	mov cx,4
	
	loop1:
		mov ah,09h
		mov al,[si]
		mov bh,0
		mov bl, 10001010b
		push cx
		mov cx, 1
		int 10h
		inc si
		pop cx
		
		mov ah,02h
		inc dl
		mov dh, 12
		mov bh, 0
		int 10h
		loop loop1
		
	
	x1: mov ah,07h
		int 21h
		cmp al,'%'
		jnz x1
.exit
end
