.data
const_str_1: .asciiz "a=%d "
const_str_2: .asciiz "a=%d "
const_str_3: .asciiz "a=%d "
const_str_4: .asciiz "a=%d "
const_str_5: .asciiz "a=%d "
const_str_6: .asciiz "a=%d "
.text
j main_0
nop
# main_0:
main_0:
# PROLOG main;
sw $8 -44($29)
sw $9 -48($29)
sw $10 -52($29)
sw $11 -56($29)
sw $12 -60($29)
sw $13 -64($29)
sw $14 -68($29)
sw $15 -72($29)
sw $16 -76($29)
sw $17 -80($29)
sw $18 -84($29)
sw $19 -88($29)
sw $20 -92($29)
sw $21 -96($29)
sw $22 -100($29)
sw $23 -104($29)
sw $24 -108($29)
sw $25 -112($29)
sw $31 -116($29)
# a = 1;
# fetch a @ $8
addiu $8 $0 1
# save a
sw $8 -32($29)
# b = 2;
# fetch b @ $8
addiu $8 $0 2
# save b
sw $8 -36($29)
# c = 3;
# fetch c @ $8
addiu $8 $0 3
# save c
sw $8 -40($29)
# %t0 = 10 * b;
# fetch %t0 @ $8
# load b
lw $9 -36($29)
# fetch b @ $9
addiu $1 $0 10
mul $8 $9 $1
# save %t0
sw $8 -8($29)
# a = %t0;
# fetch a @ $8
# load %t0
lw $10 -8($29)
# fetch %t0 @ $10
addiu $8 $10 0
# save a
sw $8 -32($29)
# PRINT_STR const_str_1;
addiu $2 $0 4
la $4 const_str_1
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -32($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t1 = b * 10;
# fetch %t1 @ $11
# load b
lw $9 -36($29)
# fetch b @ $9
addiu $1 $0 10
mul $11 $9 $1
# save %t1
sw $11 -12($29)
# a = %t1;
# fetch a @ $8
# load %t1
lw $11 -12($29)
# fetch %t1 @ $11
addiu $8 $11 0
# save a
sw $8 -32($29)
# PRINT_STR const_str_2;
addiu $2 $0 4
la $4 const_str_2
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -32($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t2 = b / 2;
# fetch %t2 @ $12
# load b
lw $9 -36($29)
# fetch b @ $9
addiu $1 $0 2
div $9 $1
mflo $12
# save %t2
sw $12 -16($29)
# a = %t2;
# fetch a @ $8
# load %t2
lw $12 -16($29)
# fetch %t2 @ $12
addiu $8 $12 0
# save a
sw $8 -32($29)
# PRINT_STR const_str_3;
addiu $2 $0 4
la $4 const_str_3
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -32($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t3 = 100 / b;
# fetch %t3 @ $13
addiu $1 $0 100
# load b
lw $9 -36($29)
# fetch b @ $9
div $1 $9
mflo $13
# save %t3
sw $13 -20($29)
# a = %t3;
# fetch a @ $8
# load %t3
lw $13 -20($29)
# fetch %t3 @ $13
addiu $8 $13 0
# save a
sw $8 -32($29)
# PRINT_STR const_str_4;
addiu $2 $0 4
la $4 const_str_4
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -32($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t4 = 1 - b;
# fetch %t4 @ $14
addiu $1 $0 1
# load b
lw $9 -36($29)
# fetch b @ $9
subu $14 $1 $9
# save %t4
sw $14 -24($29)
# a = %t4;
# fetch a @ $8
# load %t4
lw $14 -24($29)
# fetch %t4 @ $14
addiu $8 $14 0
# save a
sw $8 -32($29)
# PRINT_STR const_str_5;
addiu $2 $0 4
la $4 const_str_5
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -32($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t5 = 1 + b;
# fetch %t5 @ $15
# load b
lw $9 -36($29)
# fetch b @ $9
addiu $15 $9 1
# save %t5
sw $15 -28($29)
# a = %t5;
# fetch a @ $8
# load %t5
lw $15 -28($29)
# fetch %t5 @ $15
addiu $8 $15 0
# save a
sw $8 -32($29)
# PRINT_STR const_str_6;
addiu $2 $0 4
la $4 const_str_6
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -32($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# RET;
j __exit__
nop
# EPILOG;
j __exit__
nop
__exit__:
addiu $2 $0 10
syscall
