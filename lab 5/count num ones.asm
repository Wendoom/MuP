.model tiny
.data
msg db "Enter the hex number:$"
msg2 db "Number of 1s: $"
newline db 0ah,0dh,'$'
.code
.startup
lea dx,msg
mov ah,09h
int 21h
lea dx,newline
mov ah,09h
int 21h
mov ah,01h ; single character input
int 21h
sub al,30h
mov cl,4
xor bl,bl
l1: cmp cl,0h
    je l3
    ror al,1; shifts first bit into carry
    jc l2; if carry is set increment bl
    dec cl
    jmp l1
l2: inc bl
    dec cl
    jmp l1
l3: lea dx,newline
    mov ah,09h
    int 21h
    lea dx, msg2
    mov ah,09h
    int 21h
    lea dx,newline
    mov ah,09h
    int 21h
    add bl,30h; to print appropriate number
    mov dl,bl
    mov ah,02h
    int 21h
    .exit

end
