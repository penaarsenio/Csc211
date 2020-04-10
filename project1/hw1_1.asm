	global	_start

	section	.text
_start:	mov	eax, 4		;system call to write
	mov	ebx, 1		;system call to write to sdout (standard out)
	mov	ecx, message	;moves the address of the string to output
	mov	edx, 28		;number of bytes required
	int	80h		;interupts the program flow to linux kernel
exit:	mov	eax, 1		;system call for exit
	mov	ebx, 0		;return 0 for "no errors"
	int	80h		;interupts the program flow to linux kernel

	section	.data
message:	db	"Arsenio Pena, 23542330, MM2", 0Ah	;string/data used for
								;program