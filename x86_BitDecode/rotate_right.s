#BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE
#TENURES OF THE OHIO STATE UNIVERSITY’S ACADEMIC INTEGRITY POLICY. 

.file "rotate_right.s"
.section .rodata
.data
.text
.global rotate_right
.type	rotate_right, @function
rotate_right:
	pushq %rbp
	movq %rsp, %rbp

	movq $0, %r11
	movq $0, %rax
	movb %dil, %r11b 	#copy the value that needs to be rotated
	shrb $1, %dil		#shift the value logically to the right 1
	andb $1, %r11b		#get LSD
	salb $7, %r11b 		#shift value to the left 7 to save the LSD
	orb %r11b, %dil		#or the two values to gether to get rotated value
	movb %dil, %al		#move return value into %eax
	leave
	ret
.size rotate_right, .-rotate_right
	
