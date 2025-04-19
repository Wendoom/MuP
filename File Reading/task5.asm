.model tiny

.data
filename db "test.txt",0           ; File name
filehandle dw ?
max1 db 100                 ; Max 100 chars
act1     db ?                  ; Actual number of characters typed
string1     db 100 dup(0)         ; Buffer space for user input

.code
.startup

    ; --- Create file ---
    mov ah, 3Ch
    mov cx, 0                     ; Normal attribute
    lea dx, filename
    int 21h
    mov filehandle, ax            ; Store handle

    ; --- Take input from keyboard ---
    mov ah, 0Ah                   ; Buffered input
    lea dx, max1
    int 21h

    ; --- Write input to file ---
    mov ah, 40h                   ; Write to file
    mov bx, filehandle
    lea dx, string1     ; Data starts after first two bytes
    mov cl, act1       ; Number of characters typed
    mov ch, 0
    int 21h

    ; --- Close file ---
    mov ah, 3Eh
    mov bx, filehandle
    int 21h

    ; --- Exit ---
    mov ah, 4Ch
    int 21h

end
