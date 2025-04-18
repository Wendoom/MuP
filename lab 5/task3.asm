.model tiny
.data

    msg1 db "Enter the string to be compared$"
    msg2 db 0Ah, 0Dh, "Matching string is found$"
    msg3 db 0Ah, 0Dh, "Matching string is not found$"

    dat1 db 'hxxxohlll5world67890$', 0   
    max1 db 4
    string1 db 5, ?, 5 dup(?)   ; First byte=max input, second byte=actual input, rest for characters
    
.code
.startup

    ; Display the message
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Newline for input
    mov dl, 0Ah
    mov ah, 02h
    int 21h
    mov dl, 0Dh
    mov ah, 02h
    int 21h

    ; Accept 4-character input
    lea dx, string1
    mov ah, 0Ah
    int 21h

    ; Set up pointers
    lea si, dat1             ; dat1 base
    lea bx, string1 + 2      ; input string base
    mov cl, 17 - 4 + 1       ; Loop only valid positions (14 attempts)

check_loop:
    push si                  ; Save SI for reset if failed
    lea di, string1 + 2      ; Always start comparison from input start

    mov al, [si]             ; First char
    cmp al, [di]
    jne no_match

    inc si
    inc di
    mov al, [si]             ; Second char
    cmp al, [di]
    jne no_match

    inc si
    inc di
    mov al, [si]             ; Third char
    cmp al, [di]
    jne no_match

    inc si
    inc di
    mov al, [si]             ; Fourth char
    cmp al, [di]
    jne no_match

    ; If all 4 matched
    lea dx, msg2
    mov ah, 09h
    int 21h
    jmp done

no_match:
    pop si                   ; Restore SI to next position
    inc si                   ; Move to next char
    loop check_loop          ; Try next window

    ; If loop finishes: no match
    lea dx, msg3
    mov ah, 09h
    int 21h

done:
.exit
end
