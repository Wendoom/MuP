.model tiny
.data
	fname db 'FILE.TXT',0
	handle dw ?
	dat1 db "Yashvardhan Sharma",0Dh,0Ah
	dat2 db "2022B1A71145P",0Dh,0Ah
	dat3 db "Budh",0Dh,0Ah
	dat4 db "1144",0Dh,0Ah
	
.code
.startup
	mov ah,3Dh 
	lea dx, fname
	mov al, 1 
	int 21h
	mov bx,ax
	
	mov cx,00h
	mov dx,00h
	mov al,2
	mov ah,42h
	int 21h
	
	mov ah,40h 
	mov cx,6
	lea dx, dat3 
	int 21h
	
	mov ah,40h 
	mov cx,6
	lea dx, dat4 
	int 21h
	
	mov ah,3eh  
	int 21h 
	
.exit
end