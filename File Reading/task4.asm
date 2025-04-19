.model tiny

.data
filename db "FILE.txt", 0        ; Your Task 2 file
filehandle dw ?
buffer db 200h dup('$')          ; Reserve 512 bytes, DOS needs $-terminated for AH=09h
bytesRead dw 0                   ; Count how many bytes were read

.code
.startup
    ; Open file
    mov ah, 3Dh
    mov al, 0                    ; Open for reading
    lea dx, filename
    int 21h
    mov filehandle, ax           ; Store file handle

    mov si, 0                    ; SI points to buffer

read_loop:
    mov ah, 3Fh                  ; DOS read function
    mov bx, filehandle
    lea dx, buffer[si]           ; Read at current buffer position
    mov cx, 1                    ; Read 1 byte
    int 21h

    cmp ax, 0                    ; AX=0 means EOF
    je end_reading

    inc si                       ; Next buffer position
    jmp read_loop                ; Loop back

end_reading:
    mov buffer[si], '$'          ; Append $ for DOS print

    ; Display using AH=09h
    mov ah, 09h
    lea dx, buffer
    int 21h

    ; Close the file
    mov ah, 3Eh
    mov bx, filehandle
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h


.exit
end
