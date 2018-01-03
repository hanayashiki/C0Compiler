.data
const_str_10: .asciiz "INPUT YOUR OPCODE,0 : function1_x , 1: function2"
const_str_13: .asciiz "input a num"
const_str_14: .asciiz "return code is "
const_str_16: .asciiz "input a char  "
const_str_17: .asciiz " input a num (num < 11) "
const_str_22: .asciiz "error op!"
.text
j main_9
nop
# my_function1_0:
my_function1_0:
# PROLOG my_function1;
sw $8 -32($29)
sw $9 -36($29)
sw $10 -40($29)
sw $11 -44($29)
sw $12 -48($29)
sw $13 -52($29)
sw $14 -56($29)
sw $15 -60($29)
sw $16 -64($29)
sw $17 -68($29)
sw $18 -72($29)
sw $19 -76($29)
sw $20 -80($29)
sw $21 -84($29)
sw $22 -88($29)
sw $23 -92($29)
sw $24 -96($29)
sw $25 -100($29)
sw $31 -104($29)
# get param global: function1_x
lw $18 -8($29)
# a = 0;
# fetch a @ $19 global
addiu $19 $0 0
# %t0 = function1_x < 10;
# fetch %t0 @ $16 global
# fetch function1_x @ $18 global
addiu $1 $0 10
slti $16 $18 10
# if == 0 go to: %t0 if_false_1;
# fetch %t0 @ $16 global
beq $16 $0 if_false_1
nop
# %t1 = function1_x * 2;
# fetch %t1 @ $17 global
# fetch function1_x @ $18 global
addiu $1 $0 2
mul $17 $18 $1
# function1_x#1 = %t1;
# fetch function1_x#1 @ $16 global
# fetch %t1 @ $17 global
addiu $16 $17 0
# PUSH function1_x#1;
# fetch function1_x#1 @ $16 global
sw $16 -112($29)
# CALL my_function1;
addiu $29 $29 -104
jal my_function1_0
nop
addiu $29 $29 104
# GET %t2;
# fetch %t2 @ $16 global
# load %pass_val
lw $8 -108($29)
# fetch %pass_val @ $8
addiu $16 $8 0
# a = %t2;
# fetch a @ $19 global
# fetch %t2 @ $16 global
addiu $19 $16 0
# GOTO if_end_2;
j if_end_2
nop
# if_false_1:
if_false_1:
# RET function1_x;
# fetch function1_x @ $18 global
sw $18 -4($29)
lw $8 -32($29)
lw $9 -36($29)
lw $10 -40($29)
lw $11 -44($29)
lw $12 -48($29)
lw $13 -52($29)
lw $14 -56($29)
lw $15 -60($29)
lw $16 -64($29)
lw $17 -68($29)
lw $18 -72($29)
lw $19 -76($29)
lw $20 -80($29)
lw $21 -84($29)
lw $22 -88($29)
lw $23 -92($29)
lw $24 -96($29)
lw $25 -100($29)
lw $31 -104($29)
jr $31
nop
# if_end_2:
if_end_2:
# RET a;
# fetch a @ $19 global
sw $19 -4($29)
lw $8 -32($29)
lw $9 -36($29)
lw $10 -40($29)
lw $11 -44($29)
lw $12 -48($29)
lw $13 -52($29)
lw $14 -56($29)
lw $15 -60($29)
lw $16 -64($29)
lw $17 -68($29)
lw $18 -72($29)
lw $19 -76($29)
lw $20 -80($29)
lw $21 -84($29)
lw $22 -88($29)
lw $23 -92($29)
lw $24 -96($29)
lw $25 -100($29)
lw $31 -104($29)
jr $31
nop
# EPILOG;
lw $8 -32($29)
lw $9 -36($29)
lw $10 -40($29)
lw $11 -44($29)
lw $12 -48($29)
lw $13 -52($29)
lw $14 -56($29)
lw $15 -60($29)
lw $16 -64($29)
lw $17 -68($29)
lw $18 -72($29)
lw $19 -76($29)
lw $20 -80($29)
lw $21 -84($29)
lw $22 -88($29)
lw $23 -92($29)
lw $24 -96($29)
lw $25 -100($29)
lw $31 -104($29)
jr $31
nop
# my_function2_3:
my_function2_3:
# PROLOG my_function2;
sw $8 -120($29)
sw $9 -124($29)
sw $10 -128($29)
sw $11 -132($29)
sw $12 -136($29)
sw $13 -140($29)
sw $14 -144($29)
sw $15 -148($29)
sw $16 -152($29)
sw $17 -156($29)
sw $18 -160($29)
sw $19 -164($29)
sw $20 -168($29)
sw $21 -172($29)
sw $22 -176($29)
sw $23 -180($29)
sw $24 -184($29)
sw $25 -188($29)
sw $31 -192($29)
# %t4 = 0;
# fetch %t4 @ $8
addiu $8 $0 0
# save %t4
sw $8 -92($29)
# %t5 = 'H';
# fetch %t5 @ $8
addiu $8 $0 72
# save %t5
sb $8 -93($29)
# my_var4[%t4] = %t5;
# load my_var4
addiu $8 $28 0
# fetch my_var4 @ $8
# load %t5
lb $9 -93($29)
# fetch %t5 @ $9
# load %t4
lw $10 -92($29)
# fetch %t4 @ $10
addu $1 $8 $10
sb $9 0($1)
# save my_var4
# %t6 = 1;
# fetch %t6 @ $8
addiu $8 $0 1
# save %t6
sw $8 -100($29)
# %t7 = 'E';
# fetch %t7 @ $8
addiu $8 $0 69
# save %t7
sb $8 -101($29)
# my_var4[%t6] = %t7;
# load my_var4
addiu $8 $28 0
# fetch my_var4 @ $8
# load %t7
lb $11 -101($29)
# fetch %t7 @ $11
# load %t6
lw $12 -100($29)
# fetch %t6 @ $12
addu $1 $8 $12
sb $11 0($1)
# save my_var4
# %t8 = 2;
# fetch %t8 @ $8
addiu $8 $0 2
# save %t8
sw $8 -108($29)
# %t9 = 'L';
# fetch %t9 @ $8
addiu $8 $0 76
# save %t9
sb $8 -109($29)
# my_var4[%t8] = %t9;
# load my_var4
addiu $8 $28 0
# fetch my_var4 @ $8
# load %t9
lb $13 -109($29)
# fetch %t9 @ $13
# load %t8
lw $14 -108($29)
# fetch %t8 @ $14
addu $1 $8 $14
sb $13 0($1)
# save my_var4
# %t10 = 3;
# fetch %t10 @ $8
addiu $8 $0 3
# save %t10
sw $8 -16($29)
# %t11 = 'L';
# fetch %t11 @ $8
addiu $8 $0 76
# save %t11
sb $8 -17($29)
# my_var4[%t10] = %t11;
# load my_var4
addiu $8 $28 0
# fetch my_var4 @ $8
# load %t11
lb $15 -17($29)
# fetch %t11 @ $15
# save %t4
sw $10 -92($29)
# load %t10
lw $10 -16($29)
# fetch %t10 @ $10
addu $1 $8 $10
sb $15 0($1)
# save my_var4
# %t12 = 4;
# fetch %t12 @ $23 global
addiu $23 $0 4
# %t13 = 'O';
# fetch %t13 @ $22 global
addiu $22 $0 79
# my_var4[%t12] = %t13;
# load my_var4
addiu $8 $28 0
# fetch my_var4 @ $8
# fetch %t13 @ $22 global
# fetch %t12 @ $23 global
addu $1 $8 $23
sb $22 0($1)
# save my_var4
# %t14 = 5;
# fetch %t14 @ $8
addiu $8 $0 5
# save %t14
sw $8 -32($29)
# %t15 = 'W';
# fetch %t15 @ $8
addiu $8 $0 87
# save %t15
sb $8 -33($29)
# my_var4[%t14] = %t15;
# load my_var4
addiu $8 $28 0
# fetch my_var4 @ $8
# save %t10
sw $10 -16($29)
# load %t15
lb $10 -33($29)
# fetch %t15 @ $10
# save %t11
sb $15 -17($29)
# load %t14
lw $15 -32($29)
# fetch %t14 @ $15
addu $1 $8 $15
sb $10 0($1)
# save my_var4
# %t16 = 6;
# fetch %t16 @ $21 global
addiu $21 $0 6
# %t17 = 'W';
# fetch %t17 @ $20 global
addiu $20 $0 87
# my_var4[%t16] = %t17;
# load my_var4
addiu $8 $28 0
# fetch my_var4 @ $8
# fetch %t17 @ $20 global
# fetch %t16 @ $21 global
addu $1 $8 $21
sb $20 0($1)
# save my_var4
# %t18 = 7;
# fetch %t18 @ $19 global
addiu $19 $0 7
# %t19 = 'O';
# fetch %t19 @ $8
addiu $8 $0 79
# save %t19
sb $8 -49($29)
# my_var4[%t18] = %t19;
# load my_var4
addiu $8 $28 0
# fetch my_var4 @ $8
# save %t14
sw $15 -32($29)
# load %t19
lb $15 -49($29)
# fetch %t19 @ $15
# fetch %t18 @ $19 global
addu $1 $8 $19
sb $15 0($1)
# save my_var4
# %t20 = 8;
# fetch %t20 @ $17 global
addiu $17 $0 8
# %t21 = 'R';
# fetch %t21 @ $18 global
addiu $18 $0 82
# my_var4[%t20] = %t21;
# load my_var4
addiu $8 $28 0
# fetch my_var4 @ $8
# fetch %t21 @ $18 global
# fetch %t20 @ $17 global
addu $1 $8 $17
sb $18 0($1)
# save my_var4
# %t22 = 9;
# fetch %t22 @ $16 global
addiu $16 $0 9
# %t23 = 'L';
# fetch %t23 @ $8
addiu $8 $0 76
# save %t23
sb $8 -65($29)
# my_var4[%t22] = %t23;
# load my_var4
addiu $8 $28 0
# fetch my_var4 @ $8
# save %t15
sb $10 -33($29)
# load %t23
lb $10 -65($29)
# fetch %t23 @ $10
# fetch %t22 @ $16 global
addu $1 $8 $16
sb $10 0($1)
# save my_var4
# %t24 = 10;
# fetch %t24 @ $8
addiu $8 $0 10
# save %t24
sw $8 -72($29)
# %t25 = 'D';
# fetch %t25 @ $8
addiu $8 $0 68
# save %t25
sb $8 -73($29)
# my_var4[%t24] = %t25;
# load my_var4
addiu $8 $28 0
# fetch my_var4 @ $8
# save %t19
sb $15 -49($29)
# load %t25
lb $15 -73($29)
# fetch %t25 @ $15
# save %t23
sb $10 -65($29)
# load %t24
lw $10 -72($29)
# fetch %t24 @ $10
addu $1 $8 $10
sb $15 0($1)
# save my_var4
# i = 0;
# fetch i @ $8
addiu $8 $0 0
# save i
sw $8 -116($29)
# GOTO for_block_6;
j for_block_6
nop
# for_condition_4:
for_condition_4:
# %t26 = i < 11;
# fetch %t26 @ $16 global
# load i
lw $8 -116($29)
# fetch i @ $8
addiu $1 $0 11
slti $16 $8 11
# if == 0 go to: %t26 for_end_5;
# fetch %t26 @ $16 global
beq $16 $0 for_end_5
nop
# for_block_6:
for_block_6:
# if != go to: i function2_y if_false_7;
# load i
lw $8 -116($29)
# fetch i @ $8
# load function2_y
lw $9 -12($29)
# fetch function2_y @ $9
bne $8 $9 if_false_7
nop
# %t27 = i;
# fetch %t27 @ $16 global
# load i
lw $8 -116($29)
# fetch i @ $8
addiu $16 $8 0
# %t28 = function2_x;
# fetch %t28 @ $17 global
# load function2_x
lb $10 -5($29)
# fetch function2_x @ $10
addiu $17 $10 0
# my_var4[%t27] = %t28;
# load my_var4
addiu $11 $28 0
# fetch my_var4 @ $11
# fetch %t28 @ $17 global
# fetch %t27 @ $16 global
addu $1 $11 $16
sb $17 0($1)
# save my_var4
# GOTO if_end_8;
j if_end_8
nop
# if_false_7:
if_false_7:
# if_end_8:
if_end_8:
# i = i + 1;
# fetch i @ $8
# load i
lw $8 -116($29)
# fetch i @ $8
addiu $8 $8 1
# save i
sw $8 -116($29)
# GOTO for_condition_4;
j for_condition_4
nop
# for_end_5:
for_end_5:
# RET;
lw $8 -120($29)
lw $9 -124($29)
lw $10 -128($29)
lw $11 -132($29)
lw $12 -136($29)
lw $13 -140($29)
lw $14 -144($29)
lw $15 -148($29)
lw $16 -152($29)
lw $17 -156($29)
lw $18 -160($29)
lw $19 -164($29)
lw $20 -168($29)
lw $21 -172($29)
lw $22 -176($29)
lw $23 -180($29)
lw $24 -184($29)
lw $25 -188($29)
lw $31 -192($29)
jr $31
nop
# EPILOG;
lw $8 -120($29)
lw $9 -124($29)
lw $10 -128($29)
lw $11 -132($29)
lw $12 -136($29)
lw $13 -140($29)
lw $14 -144($29)
lw $15 -148($29)
lw $16 -152($29)
lw $17 -156($29)
lw $18 -160($29)
lw $19 -164($29)
lw $20 -168($29)
lw $21 -172($29)
lw $22 -176($29)
lw $23 -180($29)
lw $24 -184($29)
lw $25 -188($29)
lw $31 -192($29)
jr $31
nop
# main_9:
main_9:
# PROLOG main;
sw $8 -56($29)
sw $9 -60($29)
sw $10 -64($29)
sw $11 -68($29)
sw $12 -72($29)
sw $13 -76($29)
sw $14 -80($29)
sw $15 -84($29)
sw $16 -88($29)
sw $17 -92($29)
sw $18 -96($29)
sw $19 -100($29)
sw $20 -104($29)
sw $21 -108($29)
sw $22 -112($29)
sw $23 -116($29)
sw $24 -120($29)
sw $25 -124($29)
sw $31 -128($29)
# PRINT_STR const_str_10;
addiu $2 $0 4
la $4 const_str_10
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# READ_INT op;
addiu $2 $0 5
syscall
# fetch op @ $18 global
addiu $18 $2 0
# %t29 = op == 0;
# fetch %t29 @ $16 global
# fetch op @ $18 global
xori $1 $18 0
sltiu $16 $1 1
# if == 0 go to: %t29 case_end_12;
# fetch %t29 @ $16 global
beq $16 $0 case_end_12
nop
# PRINT_STR const_str_13;
addiu $2 $0 4
la $4 const_str_13
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# READ_INT function1_arg1;
addiu $2 $0 5
syscall
# fetch function1_arg1 @ $16 global
addiu $16 $2 0
# PUSH function1_arg1;
# fetch function1_arg1 @ $16 global
sw $16 -136($29)
# CALL my_function1;
addiu $29 $29 -128
jal my_function1_0
nop
addiu $29 $29 128
# GET %t30;
# fetch %t30 @ $17 global
# load %pass_val
lw $8 -132($29)
# fetch %pass_val @ $8
addiu $17 $8 0
# function_return = %t30;
# fetch function_return @ $16 global
# fetch %t30 @ $17 global
addiu $16 $17 0
# PRINT_STR const_str_14;
addiu $2 $0 4
la $4 const_str_14
syscall
# PRINT_INT function_return;
addiu $2 $0 1
# fetch function_return @ $16 global
addiu $4 $16 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_11;
j switch_end_11
nop
# case_end_12:
case_end_12:
# %t32 = op == 1;
# fetch %t32 @ $16 global
# fetch op @ $18 global
xori $1 $18 1
sltiu $16 $1 1
# if == 0 go to: %t32 case_end_15;
# fetch %t32 @ $16 global
beq $16 $0 case_end_15
nop
# PRINT_STR const_str_16;
addiu $2 $0 4
la $4 const_str_16
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# READ_CHAR function2_arg2;
addiu $2 $0 12
syscall
# fetch function2_arg2 @ $17 global
addiu $17 $2 0
# PRINT_STR const_str_17;
addiu $2 $0 4
la $4 const_str_17
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# READ_INT function2_arg1;
addiu $2 $0 5
syscall
# fetch function2_arg1 @ $16 global
addiu $16 $2 0
# PUSH function2_arg2;
# fetch function2_arg2 @ $17 global
sb $17 -133($29)
# fetch function2_arg1 @ $16 global
sw $16 -140($29)
# CALL my_function2;
addiu $29 $29 -128
jal my_function2_3
nop
addiu $29 $29 128
# i = 0;
# fetch i @ $17 global
addiu $17 $0 0
# GOTO for_block_20;
j for_block_20
nop
# for_condition_18:
for_condition_18:
# %t35 = i < 11;
# fetch %t35 @ $16 global
# fetch i @ $17 global
addiu $1 $0 11
slti $16 $17 11
# if == 0 go to: %t35 for_end_19;
# fetch %t35 @ $16 global
beq $16 $0 for_end_19
nop
# for_block_20:
for_block_20:
# %t36 = i;
# fetch %t36 @ $18 global
# fetch i @ $17 global
addiu $18 $17 0
# %t37 = my_var4[%t36];
# load my_var4
addiu $8 $28 0
# fetch my_var4 @ $8
# fetch %t37 @ $16 global
# fetch %t36 @ $18 global
addu $1 $8 $18
lb $16 0($1)
# PRINT_CHAR %t37;
addiu $2 $0 11
# fetch %t37 @ $16 global
addiu $4 $16 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# i = i + 1;
# fetch i @ $17 global
# fetch i @ $17 global
addiu $17 $17 1
# GOTO for_condition_18;
j for_condition_18
nop
# for_end_19:
for_end_19:
# GOTO switch_end_11;
j switch_end_11
nop
# case_end_15:
case_end_15:
# PRINT_STR const_str_22;
addiu $2 $0 4
la $4 const_str_22
syscall
# PRINT_INT op;
addiu $2 $0 1
# fetch op @ $18 global
addiu $4 $18 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_11;
j switch_end_11
nop
# case_end_21:
case_end_21:
# switch_end_11:
switch_end_11:
# RET;
j __exit__
nop
# EPILOG;
j __exit__
nop
__exit__:
addiu $2 $0 10
syscall
