.model tiny
.data
	char db 'A'
	dl_val db 40
	dh_val db 12
.code
.startup
	MOV AH, 00H 
	MOV AL, 3 
	INT 10H 
	
	
	mov cx,13
	
	write: 
		mov ah,02h
		mov dh, dh_val
		mov dl, dl_val
		mov bh,0
		int 10h
		
		push cx
		
		mov ah,09h
		mov al,char
		mov bh,0
		mov bl,00001101b
		mov cx,1
		int 10h
		
		inc [dh_val]
		inc [dl_val]
		pop cx
		loop write
		
	x1: mov ah,07h
		int 21h
		cmp al,'%'
		jnz x1
.exit
end
