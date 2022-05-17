#!/bin/gdb

#Auth Brian escobar
#Program name: final

#clear any previously complied outputs
#rm *.o
#rm *.out

echo "Assemble asm file"
#compiles the assembely code
nasm -f elf64 -l resistance.lis -o resistance.o resistance.asm -g -gdwarf

echo "Assemble c++ file driver file"
#compiles the c++ code
g++ -c -m64 -Wall -o driver.o driver.cpp -fno-pie -no-pie -std=c++17 -g

echo "Link the two .o files"
#Link the o files together
g++ -m64 -o final.out driver.o resistance.o -fno-pie -no-pie -std=c++17 -g

echo "Run the  Program"
gdb ./final.out

echo "The bash script file is now closing"
