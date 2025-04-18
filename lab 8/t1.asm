.model tiny
.data
	char db 'D'
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
	
	mov ah,09h
	mov al,char
	mov bh,0
	mov bl, 10001010b
	mov cx, 4h
	int 10h
	
	x1: mov ah,07h
		int 21h
		cmp al,'%'
		jnz x1
.exit
end
