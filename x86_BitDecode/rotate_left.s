#BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE
#TENURES OF THE OHIO STATE UNIVERSITY’S ACADEMIC INTEGRITY POLICY. 

.file "rotate_left.s"
.section .rodata
.data
.text
.global rotate_left
.type	rotate_left, @function
rotate_left:
	pushq %rbp
	movq %rsp, %rbp
	
	movq $0, %r11
	movq $0, %rax
	movb %dil, %r11b	#copy the value that needs to be rotated
	salb $1, %dil		#shift the value to the left 1
	shrb $7, %r11b		#shift value to the right 7 to get the MSD
	andb $1, %r11b		#save that value
	orb %r11b, %dil		#or the two values to gether to get rotated value
	movb %dil, %al		#move return value into %eax
	leave
	ret
.size rotate_left, .-rotate_left
