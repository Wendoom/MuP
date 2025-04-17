.model tiny
.data
	fname db 'FILE.TXT',0
	handle dw ?
	dat1 db "Yashvardhan Sharma",0Dh,0Ah
	dat2 db "2022B1A71145P",0Dh,0Ah
	
.code
.startup
	mov ah,3ch 
	lea dx, fname
	mov cl, 0
	int 21h
	mov bx,ax
	
	mov ah,40h 
	mov cx,20 
	lea dx, dat1 
	int 21h
	
	mov ah,40h 
	mov cx,15
	lea dx, dat2 
	int 21h
	
	mov ah,40h 
	mov cx,20 
	lea dx, dat1 
	int 21h
	
	mov ah,40h 
	mov cx,15
	lea dx, dat2 
	int 21h
	
	mov ah,3eh  
	int 21h 
	
.exit
end