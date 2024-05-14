# BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE
# TENURES OF THE OHIO STATE UNIVERSITY’S ACADEMIC INTEGRITY POLICY. 

# Brett Emory
# x86-64 Assembler code for function create_key().

#directives fot the file

.file "create_key.s" 

.section .rodata
promptFormat:
	.string "Please enter a 4-digit key: "

.data 
key:
	.long 0
index:
	.byte 0	

.text
.global create_key
.type	create_key, @function

create_key:
	pushq %rbp
	movq %rsp, %rbp

	movl $0, key

	#Call printf with the prompt to tell the user to enter the 4-digit key
	movq $0,%rax
	pushq %rax
	movq $promptFormat, %rdi
	movq $0,%rax
	call printf
	popq %rax

	#initialize index to 0
	movb $0, index

	gcLoopStart: 
	#incrememnt the index, see if the loop has ran 4 times, conditional jump to 
	#the rest of the function after all of the digits were read and stored
	incb index
	cmpb $5,index
	je gcLoopEnd

	movl $0,%eax
	# Read a character
	call getchar
	movl %eax, %ecx  # Copy the character to another register

	# Perform a bitwise AND with 1 (binary 00000001)
	andl $1, %ecx
	sall $1, key
	orl %ecx, key

	jmp gcLoopStart

	gcLoopEnd:
	
	movl key, %r11d
	sall $4, key
	orl %r11d,key
	movl key, %eax
	leave
	ret
.size create_key, .-create_key





