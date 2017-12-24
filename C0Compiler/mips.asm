.data
const_str_1: .asciiz "move:"
const_str_2: .asciiz "a="
const_str_3: .asciiz "b="
const_str_6: .asciiz "a+b="
.text
j main_7
nop
# main_7:
main_7:
# PROLOG main;
sw $8 -12($29)
sw $9 -16($29)
sw $10 -20($29)
sw $11 -24($29)
sw $12 -28($29)
sw $13 -32($29)
sw $14 -36($29)
sw $15 -40($29)
sw $16 -44($29)
sw $17 -48($29)
sw $18 -52($29)
sw $19 -56($29)
sw $20 -60($29)
sw $21 -64($29)
sw $22 -68($29)
sw $23 -72($29)
sw $24 -76($29)
sw $25 -80($29)
sw $31 -84($29)
# PUSH 1;
addiu $1 $0 1
sw $1 -92($29)
addiu $1 $0 1
sw $1 -96($29)
# CALL move;
addiu $29 $29 -84
jal move_0
nop
addiu $29 $29 84
# GET %t10;
# fetch %t10 @ $8
# load %pass_val
lw $9 -88($29)
# fetch %pass_val @ $9
addiu $8 $9 0
# save %t10
sw $8 -8($29)
# PRINT_INT %t10;
addiu $2 $0 1
# load %t10
lw $8 -8($29)
# fetch %t10 @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# EPILOG;
j __exit__
nop
# move_0:
move_0:
# PROLOG move;
sw $8 -40($29)
sw $9 -44($29)
sw $10 -48($29)
sw $11 -52($29)
sw $12 -56($29)
sw $13 -60($29)
sw $14 -64($29)
sw $15 -68($29)
sw $16 -72($29)
sw $17 -76($29)
sw $18 -80($29)
sw $19 -84($29)
sw $20 -88($29)
sw $21 -92($29)
sw $22 -96($29)
sw $23 -100($29)
sw $24 -104($29)
sw $25 -108($29)
sw $31 -112($29)
# %t0 = a + 1;
# fetch %t0 @ $8
# load a
lw $9 -8($29)
# fetch a @ $9
addiu $8 $9 1
# save %t0
sw $8 -16($29)
# a = %t0;
# fetch a @ $9
# load %t0
lw $8 -16($29)
# fetch %t0 @ $8
addiu $9 $8 0
# save a
sw $9 -8($29)
# PRINT_STR const_str_1;
addiu $2 $0 4
la $4 const_str_1
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_2;
addiu $2 $0 4
la $4 const_str_2
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $9 -8($29)
# fetch a @ $9
addiu $4 $9 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_3;
addiu $2 $0 4
la $4 const_str_3
syscall
# PRINT_INT b;
addiu $2 $0 1
# load b
lw $10 -12($29)
# fetch b @ $10
addiu $4 $10 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t1 = a < 5;
# fetch %t1 @ $11
# load a
lw $9 -8($29)
# fetch a @ $9
addiu $1 $0 5
slti $11 $9 5
# save %t1
sw $11 -20($29)
# if == 0 go to: %t1 if_false_4;
# load %t1
lw $11 -20($29)
# fetch %t1 @ $11
beq $11 $0 if_false_4
nop
# PUSH a;
# load a
lw $9 -8($29)
# fetch a @ $9
sw $9 -120($29)
# load b
lw $10 -12($29)
# fetch b @ $10
sw $10 -124($29)
# CALL move;
addiu $29 $29 -112
jal move_0
nop
addiu $29 $29 112
# GET %t5;
# fetch %t5 @ $12
# load %pass_val
lw $13 -116($29)
# fetch %pass_val @ $13
addiu $12 $13 0
# save %t5
sw $12 -28($29)
# PUSH a;
# load a
lw $9 -8($29)
# fetch a @ $9
sw $9 -120($29)
# load %t5
lw $12 -28($29)
# fetch %t5 @ $12
sw $12 -124($29)
# CALL move;
addiu $29 $29 -112
jal move_0
nop
addiu $29 $29 112
# GET %t2;
# fetch %t2 @ $13
# load %pass_val
lw $14 -116($29)
# fetch %pass_val @ $14
addiu $13 $14 0
# save %t2
sw $13 -24($29)
# b = %t2;
# fetch b @ $10
# load %t2
lw $13 -24($29)
# fetch %t2 @ $13
addiu $10 $13 0
# save b
sw $10 -12($29)
# GOTO if_end_5;
j if_end_5
nop
# if_false_4:
if_false_4:
# if_end_5:
if_end_5:
# PRINT_STR const_str_6;
addiu $2 $0 4
la $4 const_str_6
syscall
# %t8 = a + b;
# fetch %t8 @ $8
# load a
lw $9 -8($29)
# fetch a @ $9
# load b
lw $10 -12($29)
# fetch b @ $10
addu $8 $9 $10
# save %t8
sw $8 -32($29)
# PRINT_INT %t8;
addiu $2 $0 1
# load %t8
lw $8 -32($29)
# fetch %t8 @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t9 = a + b;
# fetch %t9 @ $11
# load a
lw $9 -8($29)
# fetch a @ $9
# load b
lw $10 -12($29)
# fetch b @ $10
addu $11 $9 $10
# save %t9
sw $11 -36($29)
# RET %t9;
# load %t9
lw $11 -36($29)
# fetch %t9 @ $11
sw $11 -4($29)
lw $8 -40($29)
lw $9 -44($29)
lw $10 -48($29)
lw $11 -52($29)
lw $12 -56($29)
lw $13 -60($29)
lw $14 -64($29)
lw $15 -68($29)
lw $16 -72($29)
lw $17 -76($29)
lw $18 -80($29)
lw $19 -84($29)
lw $20 -88($29)
lw $21 -92($29)
lw $22 -96($29)
lw $23 -100($29)
lw $24 -104($29)
lw $25 -108($29)
lw $31 -112($29)
jr $31
nop
# EPILOG;
lw $8 -40($29)
lw $9 -44($29)
lw $10 -48($29)
lw $11 -52($29)
lw $12 -56($29)
lw $13 -60($29)
lw $14 -64($29)
lw $15 -68($29)
lw $16 -72($29)
lw $17 -76($29)
lw $18 -80($29)
lw $19 -84($29)
lw $20 -88($29)
lw $21 -92($29)
lw $22 -96($29)
lw $23 -100($29)
lw $24 -104($29)
lw $25 -108($29)
lw $31 -112($29)
jr $31
nop
__exit__:
addiu $2 $0 10
syscall
