;credits @SSJ our GOAT

.model tiny
.data
max1 db 2
act1 db ?
inp db 2('$')
.code
.startup
mov ah,0h
mov al,03h
int 10h
mov ah,02h
mov dl,0
mov bh,0
int 10h
l1: inc dl
    mov ah,02h
    mov bh,0
    int 10h
    mov ah,08h
    int 21h
    cmp al,'%'
    je l4
l11:mov ah,09h
    mov bh,0
    mov cx,1
    mov bl, 00011110b
    int 10h
l2: add dl,40
    mov ah,02h
    mov bh,0
    int 10h
    mov ah,09h
    mov bh,0
    mov cx,1
    mov bl,01111010b
    int 10h
    sub dl,40
    cmp dl,40; to see if we have to enter
    jne l1
    jmp l3
l3: mov dl,0
    inc dh
    jmp l1
l4: mov ah,09h ;% 
    mov bh,0
    mov cx,1
    mov bl,000111000b
    int 10h
l5: add dl,40
    mov ah,02h
    mov bh,0
    int 10h
    mov ah,09h
    mov bh,0
    mov cx,1
    mov bl,01111010b
    int 10h
    sub dl,40
    cmp dl,40
    jne l6
    jmp l7
l6: inc dl
    mov ah,02h
    mov bh,0
    int 10h
    mov ah,08h
    int 21h
    cmp al,'$'
    je l8
    jmp l11
l7: mov dl,0
    inc dh
    jmp l6
l8: mov ah,09h
    mov bh,0
    mov cx,1
    mov bl,000111110b
    int 10h
    add dl,40
    mov ah,02h
    mov bh,0
    int 10h
    mov ah,09h
    mov bh,0
    mov cx,1
    mov bl,01111010b
    int 10h
    .exit

end
