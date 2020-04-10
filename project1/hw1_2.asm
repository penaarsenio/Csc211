	global	_start

	section	.text

_start:	push	eax		;save eax to the stack
	push	message		;push argument to the stack (string: message)
	call	strlen		;call the function

	add	esp, 4		;remove argument: string
	mov	edx, eax	;string length is stored in eax
	pop	eax		;restore the original value of eax

	mov	eax, 4		;tells the system to write
	mov	ebx, 1		;tells the system to write to stdout (standard out)
	mov	ecx, message	;address of the string to output
	mov	edx, edx	;moves the byte count to edx for output

	int	80h		;interupts the program flow to linux kernel
exit:	
	mov	eax, 1		;system call for exit
	mov	ebx, 0		;return 0 for "no errors"
	int	80h		;interupts the program flow to linux kernel

strlen:
; Subroutine Prologue
	push	ebp		;save the original base pointer value
	mov	ebp,esp		;set the new base pointer (the one that moves)
	push	edi		;save value of register to be used for string
	push	esi		;save register used for counter
; Subroutine body
	mov	edi, [ebp+8]	;register now contains our string
	mov	esi,0		;save and clear counter
stringstart:
	cmp	[edi], byte 0	;check the byte for a character
	jz	stringend	;jump to string end if the previous statement is zero
	inc esi			;increment by 1 since we did not reach 0
	inc edi			;move the position to the next byte in the string
	jmp stringstart		;start the function/loop over

; Subroutine Epilogue

stringend:
	mov	eax,esi		;move the counter value to eax, for return value
	pop	esi		;restore the original value of esi
	pop 	edi		;restore the original value of edi

	mov	ebp,esp		;deallocate local variables
	pop	ebp		;restore the callers base pointer value
	ret

	section	.data
message:	db	"Arsenio", 0Ah	;the string used for the program