.model tiny

.data
filename db "file.txt", 0
filehandle dw ?
buffer db 100h dup('$')   ; reserve 256 bytes and DOS needs $-terminated for AH=09h

.code
.startup

    ; --- Open file ---
    mov ah, 3Dh          ; DOS Function: Open existing file
    mov al, 0            ; Read-only mode
    lea dx, filename
    int 21h
    mov filehandle, ax   ; Save handle

    ; --- Read file ---
    mov ah, 3Fh          ; DOS Function: Read file
    mov bx, filehandle
    lea dx, buffer
    mov cx, 100h         ; Number of bytes to read (256)
    int 21h
   
    mov di, ax
	mov buffer[di], '$'


    ; --- Display contents ---
    mov ah, 09h          ; DOS Function: Display string
    lea dx, buffer
    int 21h

    ; --- Close file ---
    mov ah, 3Eh          ; DOS Function: Close file
    mov bx, filehandle
    int 21h

    ; --- Exit program ---
    mov ah, 4Ch
    int 21h



.exit
end
