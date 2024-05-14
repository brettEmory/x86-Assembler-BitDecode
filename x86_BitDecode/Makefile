# Name: Brett Emory

gcc_Copt = -std=c99 -pedantic -g -Wimplicit-function-declaration -Wreturn-type -Wformat -c
gcc_Sopt = -lc -m64 -c -g

# target 'all' is for all targets currently defined in this file
all: lab6.zip bit_decode

# you must have a subsequent target for each file listed above on the right side of the colon

lab6.zip: Makefile lab6Readme create_key.s rotate_right.s rotate_left.s bit_decode.c
	zip lab6.zip Makefile lab6Readme create_key.s rotate_right.s rotate_left.s bit_decode.c

bit_decode: bit_decode.o create_key.o rotate_right.o rotate_left.o
	gcc bit_decode.o create_key.o rotate_right.o rotate_left.o -o bit_decode

bit_decode.o: bit_decode.c
	gcc $(gcc_Copt) bit_decode.c

create_key.o: create_key.s
	gcc $(gcc_Sopt) create_key.s

rotate_right.o: rotate_right.s
	gcc $(gcc_Sopt) rotate_right.s

rotate_left.o: rotate_left.s
	gcc $(gcc_Sopt) rotate_left.s

clean:
	rm -rf lab6.zip create_key.o rotate_right.o rotate_left.o bit_decode.o
