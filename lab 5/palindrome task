.model tiny
.data

    msg1 db "Enter values $"
    msg2 db 0Ah, 0Dh, "is palindrome $"
    msg3 db 0Ah, 0Dh, "is not a palindrome $"

    max1 db 7
	act1 db ?
	input db 7 dup(?)
	
	reverse db 7 dup(?)
	
	
    
.code
.startup

    lea dx, msg1
    mov ah, 09h
    int 21h

    
    mov dl, 0Ah
    mov ah, 02h
    int 21h
    mov dl, 0Dh
    mov ah, 02h
    int 21h
	
	lea dx,max1
	mov ah,0Ah
	int 21h
	
	mov dl, 0Ah
    mov ah, 02h
    int 21h
    mov dl, 0Dh
    mov ah, 02h
    int 21h
	
	mov bl, act1
	mov bh, 0
	lea si, input 
	add si, bx
	dec si              

	std                 

	lea di, reverse
	mov cx, bx          

	x1: mov al,[si]
		mov [di],al
		dec si
		inc di
		loop x1
		
	lea di,reverse
	lea si,input
	mov cx,bx
	
	x2: mov al,[si]
		cmp [di],al
		jne x4
		inc si
		inc di
		loop x2
		
	lea dx,msg2
	mov ah,09h
	int 21h
	jmp done
		
	x4: lea dx,msg3
		mov ah,09h
		int 21h
		jmp done
	
	done:	mov cx,0
.exit
end
