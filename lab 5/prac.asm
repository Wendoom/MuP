.model tiny
.data

msg1 db "Enter a string with maximum 20 characters.",24h
max1 db 21
len db ?
string1 db 20 dup(?)

encrypted db 20 dup(?)
shifter db 05h
finalMsg db "The encrypted string is $"
.code
.startup
	lea dx,msg1
	mov ah,09h
	int 21h
	
	mov dl,0Ah
	mov ah,02h
	int 21h
	mov dl, 0Dh
	mov ah,02h
	int 21h
	
	lea dx,max1
	mov ah,0Ah
	int 21h
	
	mov dl,0Ah
	mov ah,02h
	int 21h
	mov dl, 0Dh
	mov ah,02h
	int 21h
	
	lea si,string1
	mov bl,len
	mov bh,0
	add si,bx
	dec si
	
	lea di,encrypted
	std
	mov cl,len
	mov ch,0
	
	x1: lodsb
		stosb
		loop x1
	
	lea si, encrypted
	mov cl,len
	mov ch,0
	
	x2: mov bx,[si]
		not bx
		mov ax,cx
		mov cl,shifter
		ror bx,cl
		mov cx,ax
		mov [si],bx
		inc si
		loop x2
		
	lea dx, finalMsg
	mov ah,09h
	int 21h

	; Append $ to encrypted string for printing
	lea si, encrypted
	mov bl, len
	mov bh, 0
	add si, bx
	mov byte ptr [si], '$'

	; Print encrypted string
	lea dx, encrypted
	mov ah,09h
	int 21h
		
	
		
	
.exit
end
