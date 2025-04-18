.model tiny
.data

    msg1 db "Enter the string to be compared$"
    msg2 db 0Ah, 0Dh, "Matching string is found$"
    msg3 db 0Ah, 0Dh, "Matching string is not found$"
    dat1 db 'hello12345world67890$', 0   
	max1 db 5
	act1 db 4
    string1 db 5 dup(?)            ; Input buffer for 4 characters, max 5 bytes (first byte = max length, second byte = actual length)
    
.code
.startup

    ; Display the prompt "Enter the string to be compared"
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Move to next line (line feed and carriage return)
    mov dl, 0Ah
    mov ah, 02h
    int 21h
    mov dl, 0Dh
    mov ah, 02h
    int 21h

    ; Prompt user to enter 4 characters
    lea dx, max1
    mov ah, 0Ah
    int 21h

    ; Set up pointers and counters
    lea si, dat1          ; SI points to dat1 (the string to compare)
    lea di, string1    ; DI points to the first character of the user input (skip length bytes)
    mov cl, 17            ; CL = max length of dat1 (17 characters to check)

    ; Loop through dat1 to find matching 4 characters
x1: 
    mov al, [si]          ; Load a byte from dat1 into AL
    cmp al, [di]          ; Compare with the first character of the input
    jne x2                ; If they don't match, jump to x2 (continue looping)

    inc si
    inc di
    mov al, [si]
    cmp al, [di]          ; Compare second character
    jne x2                ; If they don't match, jump to x2

    inc si
    inc di
    mov al, [si]
    cmp al, [di]          ; Compare third character
    jne x2                ; If they don't match, jump to x2

    inc si
    inc di
    mov al, [si]
    cmp al, [di]          ; Compare fourth character
    jne x2                ; If they don't match, jump to x2

    ; If all 4 characters match, print "Matching string is found"
    lea dx, msg2
    mov ah, 09h
    int 21h
    jmp x4                ; Jump to end of program

x2:
    inc si                ; Move to the next byte in dat1
    loop x1               ; Repeat loop until end of dat1 is reached

    ; If no match is found, display "Matching string is not found"
    lea dx, msg3
    mov ah, 09h
    int 21h

x4:
.exit
end
