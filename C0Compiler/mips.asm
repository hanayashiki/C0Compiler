.data
const_str_3: .asciiz "< is good. "
const_str_6: .asciiz "> is good. "
const_str_10: .asciiz ">= is good"
const_str_14: .asciiz "<= is good"
.text
j main_0
nop
# main_0:
main_0:
# PROLOG main;
sw $8 -52($29)
sw $9 -56($29)
sw $10 -60($29)
sw $11 -64($29)
sw $12 -68($29)
sw $13 -72($29)
sw $14 -76($29)
sw $15 -80($29)
sw $16 -84($29)
sw $17 -88($29)
sw $18 -92($29)
sw $19 -96($29)
sw $20 -100($29)
sw $21 -104($29)
sw $22 -108($29)
sw $23 -112($29)
sw $24 -116($29)
sw $31 -120($29)
# a = 100;
addiu $8 $0 100
# b = 200;
addiu $9 $0 200
# t0 = a < b;
slt $10 $8 $9
# if == 0 go to: t0 if_false_1;
beq $10 $0 if_false_1
nop
# t2 = -1 < 2;
addiu $11 $0 1
# if == 0 go to: t2 if_false_2;
beq $11 $0 if_false_2
nop
# PRINT_STR const_str_3;
addiu $2 $0 4
la $4 const_str_3
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# if_false_2:
if_false_2:
# if_false_1:
if_false_1:
# a = 200;
addiu $8 $0 200
# b = 100;
addiu $9 $0 100
# t3 = a > b;
slt $12 $9 $8
# if == 0 go to: t3 if_false_4;
beq $12 $0 if_false_4
nop
# t5 = 200 > -100;
addiu $13 $0 1
# if == 0 go to: t5 if_false_5;
beq $13 $0 if_false_5
nop
# PRINT_STR const_str_6;
addiu $2 $0 4
la $4 const_str_6
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# if_false_5:
if_false_5:
# if_false_4:
if_false_4:
# a = 200;
addiu $8 $0 200
# b = 200;
addiu $9 $0 200
# t6 = a >= b;
slt $1 $8 $9
xori $14 $1 1
# if == 0 go to: t6 if_false_7;
beq $14 $0 if_false_7
nop
# t7 = 200 >= 200;
addiu $15 $0 1
# if == 0 go to: t7 if_false_8;
beq $15 $0 if_false_8
nop
# t9 = 200 >= -100;
sw $8 -4($29)
addiu $8 $0 1
# if == 0 go to: t9 if_false_9;
beq $8 $0 if_false_9
nop
# PRINT_STR const_str_10;
addiu $2 $0 4
la $4 const_str_10
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# if_false_9:
if_false_9:
# if_false_8:
if_false_8:
# if_false_7:
if_false_7:
# t10 = a <= b;
sw $10 -12($29)
sw $11 -28($29)
addiu $1 $11 -1
slt $10 $1 $9
# if == 0 go to: t10 if_false_11;
beq $10 $0 if_false_11
nop
# t11 = 200 <= 200;
sw $11 -4($29)
addiu $11 $0 1
# if == 0 go to: t11 if_false_12;
beq $11 $0 if_false_12
nop
# t12 = 100 <= 200;
sw $9 -8($29)
addiu $9 $0 1
# if == 0 go to: t12 if_false_13;
beq $9 $0 if_false_13
nop
# PRINT_STR const_str_14;
addiu $2 $0 4
la $4 const_str_14
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# if_false_13:
if_false_13:
# if_false_12:
if_false_12:
# if_false_11:
if_false_11:
