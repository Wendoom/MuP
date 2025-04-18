.model tiny
.data

.code
.startup

	start:
		; Set Video Mode 12h (640x480, 16 colors)
		mov ah, 00h
		mov al, 12h
		int 10h

		; Set registers
		mov cx, 80      ; X start
		mov dx, 70      ; Y start

		; Draw top horizontal line
	draw_top:
		mov ah, 0Ch
		mov al, 4       ; Red color
		mov bh, 0
		int 10h
		inc cx
		cmp cx, 180     ; 80 + 100 width
		jne draw_top

		; Draw bottom horizontal line
		mov cx, 80
		mov dx, 149     ; 70 + 80 height -1
		
	draw_bottom:
		mov ah, 0Ch
		mov al, 4
		mov bh, 0
		int 10h
		inc cx
		cmp cx, 180
		jne draw_bottom

		; Draw left vertical line
		mov cx, 80
		mov dx, 70
	draw_left:
		mov ah, 0Ch
		mov al, 4
		mov bh, 0
		int 10h
		inc dx
		cmp dx, 150     ; 70 + 80
		jne draw_left

		; Draw right vertical line
		mov cx, 179     ; 80 + 100 - 1
		mov dx, 70
	draw_right:
		mov ah, 0Ch
		mov al, 4
		mov bh, 0
		int 10h
		inc dx
		cmp dx, 150
		jne draw_right

		x1: mov ah,07h
			int 21h
			cmp al,'%'
			jnz x1
.exit
end
