.model tiny
.data
disp db "Enter a 5 digit number:$"
maxl db 6
actl db ?
input db 6 dup('$')
dispevenpositive db "Even and positive$"
dispevennegative db "Even and negative$"
dispoddpositive db "Odd and positive$"
dispoddnegative db "Odd and negative$"
msg db "Enter another number?$"
max1 db 2
act1 db ?
inp db 2 dup('$')
newline db 0ah,0dh,'$'
.code
.startup

l0: lea dx,newline
    mov ah,09h
    int 21h
    lea dx,disp
    mov ah,09h
    int 21h
    lea dx,maxl
    mov ah,0ah
    int 21h
    lea si,input
    mov al,[si]
l1: cmp al,038h ;8
    jae l2 ;>= 8
    jmp l4
l2: mov al,[si+04h] ;negative, stores last digit
    xor edx,edx; clear dx
    mov cx,02h
    div cx
    cmp dx,0h ; even/odd
    je l3
    jmp l6
l3: lea dx,newline
    mov ah,09h
    int 21h
    lea dx,dispevennegative
    mov ah,09h
    int 21h
    jmp l8
l4: mov al,[si+04h] ;positive
    xor edx,edx
    mov eax,al
    mov ecx,02h
    div ecx
    cmp edx,0h
    je l5
    jmp l7
l5: lea dx,newline
    mov ah,09h
    int 21h
    lea dx,dispevenpositive
    mov ah,09h
    int 21h
    jmp l8
l6: lea dx,newline
    mov ah,09h
    int 21h
    lea dx,dispoddnegative
    mov h,09h
    int 21h
    jmp l8
l7: lea dx,newline
    mov ah,09h
    int 21h
    lea dx,dispoddpositive
    mov ah,09h
    int 21h
    jmp l8
l8: lea dx,newline
    mov ah,09h
    int 21h
    lea dx,msg
    mov ah,09h
    int 21h
    lea si,inp
    mov al,[si]
    cmp al,'Y'
    je l0
    .exit

end
