.model tiny
.data
msg db "Enter single digit number: $"
msg2 db "Enter single digit number: $"
msg3 db "Enter operator (+) $"
newline db 0ah,0dh,'$'
.code
.startup
lea dx,msg
mov ah,09h
int 21h
lea dx,newline
mov ah,09h
int 21h
mov ah,01h ;single input
int 21h
mov bl,al
sub bl,30h ;original number - 6h
lea dx,newline
mov ah,09h
int 21h
lea dx,msg2
mov ah,09h
int 21h
lea dx,newline
mov ah,09h
int 21h
mov ah,01h ;single character
int 21h
sub al,30h; original numbr
add bl,al; original sum
add bl,30h; converted to print appropriately
lea dx,newline
mov ah,09h
int 21h
lea dx,msg3
mov ah,09h
int 21h
lea dx,newline
mov ah,09h
int 21h
mov ah,01h
int 21h
lea dx,newline
mov ah,09h
int 21h
mov dl,bl
mov ah,02h
int 21h
.exit
end
	
