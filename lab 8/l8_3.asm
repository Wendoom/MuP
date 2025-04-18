.model tiny
.data
buffer db 80 dup('$')  
col    db 0
last1  db 0
last2  db 0
.code
.startup

    mov ah, 0
    mov al, 3
    int 10h

main_loop:
    ; Read key
    mov ah, 0
    int 16h
    mov bl, al          

    mov al, last1
    mov last2, al
    mov last1, bl

    cmp last2, '$'
    jne continue
    cmp last1, '#'
    jne continue
    jmp exit_editor

continue:
    mov si, 0
    mov al, col
    mov cl, al
    mov ch, 0
    add si, cx           

    mov [buffer + si], bl

    ; -------- LEFT HALF --------
    mov ah, 02h
    mov bh, 0
    mov dh, 12
    mov dl, col
    int 10h

    mov ah, 09h
    mov al, [buffer + si]
    mov bh, 0
    mov bl, 1Eh          
    mov cx, 1
    int 10h

    ; -------- RIGHT HALF --------
    mov ah, 02h
    mov bh, 0
    mov dh, 12
    mov dl, col
    add dl, 40
    int 10h

    mov ah, 09h
    mov al, [buffer + si]
    mov bh, 0
    mov bl, 7Ah         
    mov cx, 1
    int 10h

    inc col
    cmp col, 40
    jl main_loop
    mov col, 0
    jmp main_loop

exit_editor:
    mov ah, 0
    mov al, 3
    int 10h

.exit
end
