.model tiny
.data
msg db "Enter 10 hexadecimal numbers: $"
max_even db 11
act_even db ?
even_no db 11 dup ('$')
max_odd db 11
act_odd db ?
odd_no db 11 dup ('$')
newline db 0ah,0dh,'$'
even_msg db "Even numbers are: $"
odd_msg db "Odd numbers are: $"
.code
.startup
mov cl,10
lea si,even_no
lea di,odd_no
lea dx,msg
mov ah,09h
int 21h
l1 : cmp cl,0h
     je l4
     mov ah,08h ; single char input
     int 21h
     mov ch,al
     xor ah,ah ;clear
     mov bl,02h ;even/odd
     div bl
     cmp ah,0h ;if 0 then move to even storage
     je l2
     jmp l3
l2: dec cl
    mov [si],ch
    inc si
    jmp l1
l3: dec cl
    mov [di],ch
    inc di
    jmp l1
l4: lea dx,newline
    mov ah,09h
    int 21h
    lea dx,even_msg
    mov ah,09h
    int 21h
    lea dx,even_no
    mov ah,09h
    int 21h
    lea dx,newline
    mov ah,09h
    int 21h
    lea dx,odd_msg
    mov ah,09h
    int 21h
    lea dx,odd_no
    mov ah,09h
    int 21h
    .exit  
end
