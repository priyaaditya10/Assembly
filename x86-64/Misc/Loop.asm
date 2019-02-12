section  .data

msg: 		db	'Hello, world!',0xa
length: 	equ	$-msg
section  .text

global  _start

_start:
	mov 	rcx, 0x10   	;initializing counter to 10
begin:  push 	rcx 		;pushing rcx to save it's value
	mov 	rax, 0x1    	;write syscall number
	mov 	rdi, 0x1 	;fd to write
	mov 	rsi, msg 	;msg to write
	mov 	rdx, length 	;length of message to write
	syscall 		;calling system
	pop 	rcx
	loop 	begin 		;now using single instruction to loop
	mov 	rax, 0x3c   	;exit syscall number
	mov 	rdi, 0x0    	;exit status
	syscall 		;syscall
