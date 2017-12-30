.data
const_str_12: .asciiz "The mode is illegal."
const_str_14: .asciiz "The number is too large."
const_str_16: .asciiz "The number should not be negative or zero."
const_str_28: .asciiz "mode:"
const_str_29: .asciiz "result:"
.text
j main_37
nop
# error_9:
error_9:
# PROLOG error;
sw $8 -24($29)
sw $9 -28($29)
sw $10 -32($29)
sw $11 -36($29)
sw $12 -40($29)
sw $13 -44($29)
sw $14 -48($29)
sw $15 -52($29)
sw $16 -56($29)
sw $17 -60($29)
sw $18 -64($29)
sw $19 -68($29)
sw $20 -72($29)
sw $21 -76($29)
sw $22 -80($29)
sw $23 -84($29)
sw $24 -88($29)
sw $25 -92($29)
sw $31 -96($29)
# %t11 = num == 1;
# fetch %t11 @ $8
# load num
lw $9 -8($29)
# fetch num @ $9
xori $1 $9 1
sltiu $8 $1 1
# save %t11
sw $8 -12($29)
# if == 0 go to: %t11 case_end_11;
# load %t11
lw $8 -12($29)
# fetch %t11 @ $8
beq $8 $0 case_end_11
nop
# PRINT_STR const_str_12;
addiu $2 $0 4
la $4 const_str_12
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_10;
j switch_end_10
nop
# case_end_11:
case_end_11:
# %t12 = num == 2;
# fetch %t12 @ $8
# load num
lw $9 -8($29)
# fetch num @ $9
xori $1 $9 2
sltiu $8 $1 1
# save %t12
sw $8 -16($29)
# if == 0 go to: %t12 case_end_13;
# load %t12
lw $8 -16($29)
# fetch %t12 @ $8
beq $8 $0 case_end_13
nop
# PRINT_STR const_str_14;
addiu $2 $0 4
la $4 const_str_14
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_10;
j switch_end_10
nop
# case_end_13:
case_end_13:
# %t13 = num == 3;
# fetch %t13 @ $8
# load num
lw $9 -8($29)
# fetch num @ $9
xori $1 $9 3
sltiu $8 $1 1
# save %t13
sw $8 -20($29)
# if == 0 go to: %t13 case_end_15;
# load %t13
lw $8 -20($29)
# fetch %t13 @ $8
beq $8 $0 case_end_15
nop
# PRINT_STR const_str_16;
addiu $2 $0 4
la $4 const_str_16
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_10;
j switch_end_10
nop
# case_end_15:
case_end_15:
# GOTO switch_end_10;
j switch_end_10
nop
# case_end_17:
case_end_17:
# switch_end_10:
switch_end_10:
# RET;
lw $8 -24($29)
lw $9 -28($29)
lw $10 -32($29)
lw $11 -36($29)
lw $12 -40($29)
lw $13 -44($29)
lw $14 -48($29)
lw $15 -52($29)
lw $16 -56($29)
lw $17 -60($29)
lw $18 -64($29)
lw $19 -68($29)
lw $20 -72($29)
lw $21 -76($29)
lw $22 -80($29)
lw $23 -84($29)
lw $24 -88($29)
lw $25 -92($29)
lw $31 -96($29)
jr $31
nop
# EPILOG;
lw $8 -24($29)
lw $9 -28($29)
lw $10 -32($29)
lw $11 -36($29)
lw $12 -40($29)
lw $13 -44($29)
lw $14 -48($29)
lw $15 -52($29)
lw $16 -56($29)
lw $17 -60($29)
lw $18 -64($29)
lw $19 -68($29)
lw $20 -72($29)
lw $21 -76($29)
lw $22 -80($29)
lw $23 -84($29)
lw $24 -88($29)
lw $25 -92($29)
lw $31 -96($29)
jr $31
nop
# getmode_4:
getmode_4:
# PROLOG getmode;
sw $8 -8($29)
sw $9 -12($29)
sw $10 -16($29)
sw $11 -20($29)
sw $12 -24($29)
sw $13 -28($29)
sw $14 -32($29)
sw $15 -36($29)
sw $16 -40($29)
sw $17 -44($29)
sw $18 -48($29)
sw $19 -52($29)
sw $20 -56($29)
sw $21 -60($29)
sw $22 -64($29)
sw $23 -68($29)
sw $24 -72($29)
sw $25 -76($29)
sw $31 -80($29)
# READ_CHAR mode;
addiu $2 $0 12
syscall
# fetch mode @ $8
addiu $8 $2 0
# save mode
sb $8 48($28)
# RET;
lw $8 -8($29)
lw $9 -12($29)
lw $10 -16($29)
lw $11 -20($29)
lw $12 -24($29)
lw $13 -28($29)
lw $14 -32($29)
lw $15 -36($29)
lw $16 -40($29)
lw $17 -44($29)
lw $18 -48($29)
lw $19 -52($29)
lw $20 -56($29)
lw $21 -60($29)
lw $22 -64($29)
lw $23 -68($29)
lw $24 -72($29)
lw $25 -76($29)
lw $31 -80($29)
jr $31
nop
# EPILOG;
lw $8 -8($29)
lw $9 -12($29)
lw $10 -16($29)
lw $11 -20($29)
lw $12 -24($29)
lw $13 -28($29)
lw $14 -32($29)
lw $15 -36($29)
lw $16 -40($29)
lw $17 -44($29)
lw $18 -48($29)
lw $19 -52($29)
lw $20 -56($29)
lw $21 -60($29)
lw $22 -64($29)
lw $23 -68($29)
lw $24 -72($29)
lw $25 -76($29)
lw $31 -80($29)
jr $31
nop
# init_0:
init_0:
# PROLOG init;
sw $8 -24($29)
sw $9 -28($29)
sw $10 -32($29)
sw $11 -36($29)
sw $12 -40($29)
sw $13 -44($29)
sw $14 -48($29)
sw $15 -52($29)
sw $16 -56($29)
sw $17 -60($29)
sw $18 -64($29)
sw $19 -68($29)
sw $20 -72($29)
sw $21 -76($29)
sw $22 -80($29)
sw $23 -84($29)
sw $24 -88($29)
sw $25 -92($29)
sw $31 -96($29)
# pra = 0;
# fetch pra @ $8
addiu $8 $0 0
# save pra
sw $8 4($28)
# mode = 'a';
# fetch mode @ $8
addiu $8 $0 97
# save mode
sb $8 48($28)
# i = 1023;
# fetch i @ $8
addiu $8 $0 1023
# save i
sw $8 -20($29)
# GOTO for_block_3;
j for_block_3
nop
# for_condition_1:
for_condition_1:
# %t1 = i >= 0;
# fetch %t1 @ $8
# load i
lw $9 -20($29)
# fetch i @ $9
addiu $1 $0 0
slti $1 $9 0
xori $8 $1 1
# save %t1
sw $8 -8($29)
# if == 0 go to: %t1 for_end_2;
# load %t1
lw $8 -8($29)
# fetch %t1 @ $8
beq $8 $0 for_end_2
nop
# for_block_3:
for_block_3:
# %t2 = i;
# fetch %t2 @ $8
# load i
lw $9 -20($29)
# fetch i @ $9
addiu $8 $9 0
# save %t2
sw $8 -12($29)
# %t3 = 0;
# fetch %t3 @ $8
addiu $8 $0 0
# save %t3
sw $8 -16($29)
# factors[%t2] = %t3;
# load factors
addiu $8 $28 8
# fetch factors @ $8
# load %t3
lw $10 -16($29)
# fetch %t3 @ $10
# load %t2
lw $11 -12($29)
# fetch %t2 @ $11
sll $1 $11 2
addu $1 $1 $8
sw $10 0($1)
# save factors
# i = i - 1;
# fetch i @ $9
# load i
lw $9 -20($29)
# fetch i @ $9
addiu $1 $0 1
subu $9 $9 $1
# save i
sw $9 -20($29)
# GOTO for_condition_1;
j for_condition_1
nop
# for_end_2:
for_end_2:
# RET;
lw $8 -24($29)
lw $9 -28($29)
lw $10 -32($29)
lw $11 -36($29)
lw $12 -40($29)
lw $13 -44($29)
lw $14 -48($29)
lw $15 -52($29)
lw $16 -56($29)
lw $17 -60($29)
lw $18 -64($29)
lw $19 -68($29)
lw $20 -72($29)
lw $21 -76($29)
lw $22 -80($29)
lw $23 -84($29)
lw $24 -88($29)
lw $25 -92($29)
lw $31 -96($29)
jr $31
nop
# EPILOG;
lw $8 -24($29)
lw $9 -28($29)
lw $10 -32($29)
lw $11 -36($29)
lw $12 -40($29)
lw $13 -44($29)
lw $14 -48($29)
lw $15 -52($29)
lw $16 -56($29)
lw $17 -60($29)
lw $18 -64($29)
lw $19 -68($29)
lw $20 -72($29)
lw $21 -76($29)
lw $22 -80($29)
lw $23 -84($29)
lw $24 -88($29)
lw $25 -92($29)
lw $31 -96($29)
jr $31
nop
# getnumber_5:
getnumber_5:
# PROLOG getnumber;
sw $8 -8($29)
sw $9 -12($29)
sw $10 -16($29)
sw $11 -20($29)
sw $12 -24($29)
sw $13 -28($29)
sw $14 -32($29)
sw $15 -36($29)
sw $16 -40($29)
sw $17 -44($29)
sw $18 -48($29)
sw $19 -52($29)
sw $20 -56($29)
sw $21 -60($29)
sw $22 -64($29)
sw $23 -68($29)
sw $24 -72($29)
sw $25 -76($29)
sw $31 -80($29)
# READ_INT number;
addiu $2 $0 5
syscall
# fetch number @ $8
addiu $8 $2 0
# save number
sw $8 0($28)
# RET;
lw $8 -8($29)
lw $9 -12($29)
lw $10 -16($29)
lw $11 -20($29)
lw $12 -24($29)
lw $13 -28($29)
lw $14 -32($29)
lw $15 -36($29)
lw $16 -40($29)
lw $17 -44($29)
lw $18 -48($29)
lw $19 -52($29)
lw $20 -56($29)
lw $21 -60($29)
lw $22 -64($29)
lw $23 -68($29)
lw $24 -72($29)
lw $25 -76($29)
lw $31 -80($29)
jr $31
nop
# EPILOG;
lw $8 -8($29)
lw $9 -12($29)
lw $10 -16($29)
lw $11 -20($29)
lw $12 -24($29)
lw $13 -28($29)
lw $14 -32($29)
lw $15 -36($29)
lw $16 -40($29)
lw $17 -44($29)
lw $18 -48($29)
lw $19 -52($29)
lw $20 -56($29)
lw $21 -60($29)
lw $22 -64($29)
lw $23 -68($29)
lw $24 -72($29)
lw $25 -76($29)
lw $31 -80($29)
jr $31
nop
# getResult_6:
getResult_6:
# PROLOG getResult;
sw $8 -36($29)
sw $9 -40($29)
sw $10 -44($29)
sw $11 -48($29)
sw $12 -52($29)
sw $13 -56($29)
sw $14 -60($29)
sw $15 -64($29)
sw $16 -68($29)
sw $17 -72($29)
sw $18 -76($29)
sw $19 -80($29)
sw $20 -84($29)
sw $21 -88($29)
sw $22 -92($29)
sw $23 -96($29)
sw $24 -100($29)
sw $25 -104($29)
sw $31 -108($29)
# %t4 = number + -1;
# fetch %t4 @ $8
# load number
lw $9 0($28)
# fetch number @ $9
addiu $8 $9 -1
# save %t4
sw $8 -20($29)
# %t5 = i < %t4;
# fetch %t5 @ $8
# load i
lw $10 -8($29)
# fetch i @ $10
# load %t4
lw $11 -20($29)
# fetch %t4 @ $11
slt $8 $10 $11
# save %t5
sw $8 -24($29)
# if == 0 go to: %t5 if_false_7;
# load %t5
lw $8 -24($29)
# fetch %t5 @ $8
beq $8 $0 if_false_7
nop
# %t8 = i + 1;
# fetch %t8 @ $12
# load i
lw $10 -8($29)
# fetch i @ $10
addiu $12 $10 1
# save %t8
sw $12 -32($29)
# PUSH %t8;
# load %t8
lw $12 -32($29)
# fetch %t8 @ $12
sw $12 -116($29)
# load r
lw $13 -12($29)
# fetch r @ $13
sw $13 -120($29)
# CALL getResult;
addiu $29 $29 -108
jal getResult_6
nop
addiu $29 $29 108
# GET %t6;
# fetch %t6 @ $14
# load %pass_val
lw $15 -112($29)
# fetch %pass_val @ $15
addiu $14 $15 0
# save %t6
sw $14 -28($29)
# %t10 = i * %t6;
# fetch %t10 @ $14
# load i
lw $10 -8($29)
# fetch i @ $10
# load %t6
lw $15 -28($29)
# fetch %t6 @ $15
mul $14 $10 $15
# save %t10
sw $14 -16($29)
# r = %t10;
# fetch r @ $13
# load %t10
lw $14 -16($29)
# fetch %t10 @ $14
addiu $13 $14 0
# save r
sw $13 -12($29)
# GOTO if_end_8;
j if_end_8
nop
# if_false_7:
if_false_7:
# if_end_8:
if_end_8:
# RET r;
# load r
lw $8 -12($29)
# fetch r @ $8
sw $8 -4($29)
lw $8 -36($29)
lw $9 -40($29)
lw $10 -44($29)
lw $11 -48($29)
lw $12 -52($29)
lw $13 -56($29)
lw $14 -60($29)
lw $15 -64($29)
lw $16 -68($29)
lw $17 -72($29)
lw $18 -76($29)
lw $19 -80($29)
lw $20 -84($29)
lw $21 -88($29)
lw $22 -92($29)
lw $23 -96($29)
lw $24 -100($29)
lw $25 -104($29)
lw $31 -108($29)
jr $31
nop
# EPILOG;
lw $8 -36($29)
lw $9 -40($29)
lw $10 -44($29)
lw $11 -48($29)
lw $12 -52($29)
lw $13 -56($29)
lw $14 -60($29)
lw $15 -64($29)
lw $16 -68($29)
lw $17 -72($29)
lw $18 -76($29)
lw $19 -80($29)
lw $20 -84($29)
lw $21 -88($29)
lw $22 -92($29)
lw $23 -96($29)
lw $24 -100($29)
lw $25 -104($29)
lw $31 -108($29)
jr $31
nop
# check_18:
check_18:
# PROLOG check;
sw $8 -20($29)
sw $9 -24($29)
sw $10 -28($29)
sw $11 -32($29)
sw $12 -36($29)
sw $13 -40($29)
sw $14 -44($29)
sw $15 -48($29)
sw $16 -52($29)
sw $17 -56($29)
sw $18 -60($29)
sw $19 -64($29)
sw $20 -68($29)
sw $21 -72($29)
sw $22 -76($29)
sw $23 -80($29)
sw $24 -84($29)
sw $25 -88($29)
sw $31 -92($29)
# %t14 = number / preFactor;
# fetch %t14 @ $8
# load number
lw $9 0($28)
# fetch number @ $9
# load preFactor
lw $10 -8($29)
# fetch preFactor @ $10
div $9 $10
mflo $8
# save %t14
sw $8 -12($29)
# %t15 = %t14 * preFactor;
# fetch %t15 @ $8
# load %t14
lw $11 -12($29)
# fetch %t14 @ $11
# load preFactor
lw $10 -8($29)
# fetch preFactor @ $10
mul $8 $11 $10
# save %t15
sw $8 -16($29)
# if == go to: %t15 number if_false_19;
# load %t15
lw $8 -16($29)
# fetch %t15 @ $8
# load number
lw $9 0($28)
# fetch number @ $9
beq $8 $9 if_false_19
nop
# RET 'n';
addiu $1 $0 110
sw $1 -4($29)
lw $8 -20($29)
lw $9 -24($29)
lw $10 -28($29)
lw $11 -32($29)
lw $12 -36($29)
lw $13 -40($29)
lw $14 -44($29)
lw $15 -48($29)
lw $16 -52($29)
lw $17 -56($29)
lw $18 -60($29)
lw $19 -64($29)
lw $20 -68($29)
lw $21 -72($29)
lw $22 -76($29)
lw $23 -80($29)
lw $24 -84($29)
lw $25 -88($29)
lw $31 -92($29)
jr $31
nop
# GOTO if_end_20;
j if_end_20
nop
# if_false_19:
if_false_19:
# RET 'y';
addiu $1 $0 121
sw $1 -4($29)
lw $8 -20($29)
lw $9 -24($29)
lw $10 -28($29)
lw $11 -32($29)
lw $12 -36($29)
lw $13 -40($29)
lw $14 -44($29)
lw $15 -48($29)
lw $16 -52($29)
lw $17 -56($29)
lw $18 -60($29)
lw $19 -64($29)
lw $20 -68($29)
lw $21 -72($29)
lw $22 -76($29)
lw $23 -80($29)
lw $24 -84($29)
lw $25 -88($29)
lw $31 -92($29)
jr $31
nop
# if_end_20:
if_end_20:
# EPILOG;
lw $8 -20($29)
lw $9 -24($29)
lw $10 -28($29)
lw $11 -32($29)
lw $12 -36($29)
lw $13 -40($29)
lw $14 -44($29)
lw $15 -48($29)
lw $16 -52($29)
lw $17 -56($29)
lw $18 -60($29)
lw $19 -64($29)
lw $20 -68($29)
lw $21 -72($29)
lw $22 -76($29)
lw $23 -80($29)
lw $24 -84($29)
lw $25 -88($29)
lw $31 -92($29)
jr $31
nop
# getFactors_21:
getFactors_21:
# PROLOG getFactors;
sw $8 -36($29)
sw $9 -40($29)
sw $10 -44($29)
sw $11 -48($29)
sw $12 -52($29)
sw $13 -56($29)
sw $14 -60($29)
sw $15 -64($29)
sw $16 -68($29)
sw $17 -72($29)
sw $18 -76($29)
sw $19 -80($29)
sw $20 -84($29)
sw $21 -88($29)
sw $22 -92($29)
sw $23 -96($29)
sw $24 -100($29)
sw $25 -104($29)
sw $31 -108($29)
# i = 1;
# fetch i @ $8
addiu $8 $0 1
# save i
sw $8 -28($29)
# GOTO for_block_24;
j for_block_24
nop
# for_condition_22:
for_condition_22:
# %t16 = i <= number;
# fetch %t16 @ $8
# load i
lw $9 -28($29)
# fetch i @ $9
# load number
lw $10 0($28)
# fetch number @ $10
addiu $1 $9 -1
slt $8 $1 $10
# save %t16
sw $8 -8($29)
# if == 0 go to: %t16 for_end_23;
# load %t16
lw $8 -8($29)
# fetch %t16 @ $8
beq $8 $0 for_end_23
nop
# for_block_24:
for_block_24:
# PUSH i;
# load i
lw $8 -28($29)
# fetch i @ $8
sw $8 -116($29)
# CALL check;
addiu $29 $29 -108
jal check_18
nop
addiu $29 $29 108
# GET %t17;
# fetch %t17 @ $9
# load %pass_val
lw $10 -112($29)
# fetch %pass_val @ $10
addiu $9 $10 0
# save %t17
sb $9 -9($29)
# isFactor = %t17;
# fetch isFactor @ $9
# load %t17
lb $10 -9($29)
# fetch %t17 @ $10
addiu $9 $10 0
# save isFactor
sb $9 -29($29)
# if != go to: isFactor 'y' if_false_25;
# load isFactor
lb $9 -29($29)
# fetch isFactor @ $9
addiu $1 $0 121
bne $9 $1 if_false_25
nop
# %t19 = pra;
# fetch %t19 @ $11
# load pra
lw $12 4($28)
# fetch pra @ $12
addiu $11 $12 0
# save %t19
sw $11 -16($29)
# %t20 = i;
# fetch %t20 @ $11
# load i
lw $8 -28($29)
# fetch i @ $8
addiu $11 $8 0
# save %t20
sw $11 -20($29)
# factors[%t19] = %t20;
# load factors
addiu $11 $28 8
# fetch factors @ $11
# load %t20
lw $13 -20($29)
# fetch %t20 @ $13
# load %t19
lw $14 -16($29)
# fetch %t19 @ $14
sll $1 $14 2
addu $1 $1 $11
sw $13 0($1)
# save factors
# %t21 = pra + 1;
# fetch %t21 @ $11
# load pra
lw $12 4($28)
# fetch pra @ $12
addiu $11 $12 1
# save %t21
sw $11 -24($29)
# pra = %t21;
# fetch pra @ $12
# load %t21
lw $11 -24($29)
# fetch %t21 @ $11
addiu $12 $11 0
# save pra
sw $12 4($28)
# GOTO if_end_26;
j if_end_26
nop
# if_false_25:
if_false_25:
# if_end_26:
if_end_26:
# i = i + 1;
# fetch i @ $8
# load i
lw $8 -28($29)
# fetch i @ $8
addiu $8 $8 1
# save i
sw $8 -28($29)
# GOTO for_condition_22;
j for_condition_22
nop
# for_end_23:
for_end_23:
# RET;
lw $8 -36($29)
lw $9 -40($29)
lw $10 -44($29)
lw $11 -48($29)
lw $12 -52($29)
lw $13 -56($29)
lw $14 -60($29)
lw $15 -64($29)
lw $16 -68($29)
lw $17 -72($29)
lw $18 -76($29)
lw $19 -80($29)
lw $20 -84($29)
lw $21 -88($29)
lw $22 -92($29)
lw $23 -96($29)
lw $24 -100($29)
lw $25 -104($29)
lw $31 -108($29)
jr $31
nop
# EPILOG;
lw $8 -36($29)
lw $9 -40($29)
lw $10 -44($29)
lw $11 -48($29)
lw $12 -52($29)
lw $13 -56($29)
lw $14 -60($29)
lw $15 -64($29)
lw $16 -68($29)
lw $17 -72($29)
lw $18 -76($29)
lw $19 -80($29)
lw $20 -84($29)
lw $21 -88($29)
lw $22 -92($29)
lw $23 -96($29)
lw $24 -100($29)
lw $25 -104($29)
lw $31 -108($29)
jr $31
nop
# main_37:
main_37:
# PROLOG main;
sw $8 -36($29)
sw $9 -40($29)
sw $10 -44($29)
sw $11 -48($29)
sw $12 -52($29)
sw $13 -56($29)
sw $14 -60($29)
sw $15 -64($29)
sw $16 -68($29)
sw $17 -72($29)
sw $18 -76($29)
sw $19 -80($29)
sw $20 -84($29)
sw $21 -88($29)
sw $22 -92($29)
sw $23 -96($29)
sw $24 -100($29)
sw $25 -104($29)
sw $31 -108($29)
# CALL init;
addiu $29 $29 -108
jal init_0
nop
addiu $29 $29 108
# CALL getmode;
addiu $29 $29 -108
jal getmode_4
nop
addiu $29 $29 108
# CALL getnumber;
addiu $29 $29 -108
jal getnumber_5
nop
addiu $29 $29 108
# READ_INT result;
addiu $2 $0 5
syscall
# fetch result @ $8
addiu $8 $2 0
# save result
sw $8 -32($29)
# %t27 = number <= 0;
# fetch %t27 @ $8
# load number
lw $9 0($28)
# fetch number @ $9
addiu $1 $0 0
addiu $1 $9 -1
slti $8 $1 0
# save %t27
sw $8 -8($29)
# if == 0 go to: %t27 if_false_38;
# load %t27
lw $8 -8($29)
# fetch %t27 @ $8
beq $8 $0 if_false_38
nop
# PUSH 3;
addiu $1 $0 3
sw $1 -116($29)
# CALL error;
addiu $29 $29 -108
jal error_9
nop
addiu $29 $29 108
# RET;
j __exit__
nop
# GOTO if_end_39;
j if_end_39
nop
# if_false_38:
if_false_38:
# if_end_39:
if_end_39:
# %t29 = mode == 'f';
# fetch %t29 @ $8
# load mode
lb $9 48($28)
# fetch mode @ $9
xori $1 $9 102
sltiu $8 $1 1
# save %t29
sw $8 -12($29)
# if == 0 go to: %t29 case_end_41;
# load %t29
lw $8 -12($29)
# fetch %t29 @ $8
beq $8 $0 case_end_41
nop
# %t30 = number > 32768;
# fetch %t30 @ $10
# load number
lw $11 0($28)
# fetch number @ $11
addiu $1 $0 32768
addiu $1 $0 32768
slt $10 $1 $11
# save %t30
sw $10 -16($29)
# if == 0 go to: %t30 if_false_42;
# load %t30
lw $10 -16($29)
# fetch %t30 @ $10
beq $10 $0 if_false_42
nop
# PUSH 2;
addiu $1 $0 2
sw $1 -116($29)
# CALL error;
addiu $29 $29 -108
jal error_9
nop
addiu $29 $29 108
# RET;
j __exit__
nop
# GOTO if_end_43;
j if_end_43
nop
# if_false_42:
if_false_42:
# CALL getFactors;
addiu $29 $29 -108
jal getFactors_21
nop
addiu $29 $29 108
# if_end_43:
if_end_43:
# GOTO switch_end_40;
j switch_end_40
nop
# case_end_41:
case_end_41:
# %t32 = mode == 's';
# fetch %t32 @ $8
# load mode
lb $9 48($28)
# fetch mode @ $9
xori $1 $9 115
sltiu $8 $1 1
# save %t32
sw $8 -20($29)
# if == 0 go to: %t32 case_end_44;
# load %t32
lw $8 -20($29)
# fetch %t32 @ $8
beq $8 $0 case_end_44
nop
# %t33 = number > 32;
# fetch %t33 @ $10
# load number
lw $11 0($28)
# fetch number @ $11
addiu $1 $0 32
addiu $1 $0 32
slt $10 $1 $11
# save %t33
sw $10 -24($29)
# if == 0 go to: %t33 if_false_45;
# load %t33
lw $10 -24($29)
# fetch %t33 @ $10
beq $10 $0 if_false_45
nop
# PUSH 2;
addiu $1 $0 2
sw $1 -116($29)
# CALL error;
addiu $29 $29 -108
jal error_9
nop
addiu $29 $29 108
# RET;
j __exit__
nop
# GOTO if_end_46;
j if_end_46
nop
# if_false_45:
if_false_45:
# PUSH 1;
addiu $1 $0 1
sw $1 -116($29)
addiu $1 $0 1
sw $1 -120($29)
# CALL getResult;
addiu $29 $29 -108
jal getResult_6
nop
addiu $29 $29 108
# GET %t35;
# fetch %t35 @ $8
# load %pass_val
lw $9 -112($29)
# fetch %pass_val @ $9
addiu $8 $9 0
# save %t35
sw $8 -28($29)
# result = %t35;
# fetch result @ $8
# load %t35
lw $9 -28($29)
# fetch %t35 @ $9
addiu $8 $9 0
# save result
sw $8 -32($29)
# if_end_46:
if_end_46:
# GOTO switch_end_40;
j switch_end_40
nop
# case_end_44:
case_end_44:
# PUSH 1;
addiu $1 $0 1
sw $1 -116($29)
# CALL error;
addiu $29 $29 -108
jal error_9
nop
addiu $29 $29 108
# RET;
j __exit__
nop
# GOTO switch_end_40;
j switch_end_40
nop
# case_end_47:
case_end_47:
# switch_end_40:
switch_end_40:
# PUSH mode;
# load mode
lb $8 48($28)
# fetch mode @ $8
sb $8 -113($29)
# load result
lw $9 -32($29)
# fetch result @ $9
sw $9 -120($29)
# CALL output;
addiu $29 $29 -108
jal output_27
nop
addiu $29 $29 108
# RET;
j __exit__
nop
# EPILOG;
j __exit__
nop
# output_27:
output_27:
# PROLOG output;
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
# PRINT_STR const_str_28;
addiu $2 $0 4
la $4 const_str_28
syscall
# PRINT_CHAR mode;
addiu $2 $0 11
# load mode
lb $8 -5($29)
# fetch mode @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_29;
addiu $2 $0 4
la $4 const_str_29
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t22 = mode == 'f';
# fetch %t22 @ $9
# load mode
lb $8 -5($29)
# fetch mode @ $8
xori $1 $8 102
sltiu $9 $1 1
# save %t22
sw $9 -16($29)
# if == 0 go to: %t22 case_end_31;
# load %t22
lw $9 -16($29)
# fetch %t22 @ $9
beq $9 $0 case_end_31
nop
# i = 0;
# fetch i @ $10
addiu $10 $0 0
# save i
sw $10 -36($29)
# GOTO for_block_34;
j for_block_34
nop
# for_condition_32:
for_condition_32:
# %t23 = i < pra;
# fetch %t23 @ $8
# load i
lw $9 -36($29)
# fetch i @ $9
# load pra
lw $10 4($28)
# fetch pra @ $10
slt $8 $9 $10
# save %t23
sw $8 -20($29)
# if == 0 go to: %t23 for_end_33;
# load %t23
lw $8 -20($29)
# fetch %t23 @ $8
beq $8 $0 for_end_33
nop
# for_block_34:
for_block_34:
# %t24 = i;
# fetch %t24 @ $8
# load i
lw $9 -36($29)
# fetch i @ $9
addiu $8 $9 0
# save %t24
sw $8 -24($29)
# %t25 = factors[%t24];
# load factors
addiu $8 $28 8
# fetch factors @ $8
# fetch %t25 @ $10
# load %t24
lw $11 -24($29)
# fetch %t24 @ $11
sll $1 $11 2
addu $1 $1 $8
lw $10 0($1)
# save %t25
sw $10 -28($29)
# PRINT_INT %t25;
addiu $2 $0 1
# load %t25
lw $10 -28($29)
# fetch %t25 @ $10
addiu $4 $10 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# i = i + 1;
# fetch i @ $9
# load i
lw $9 -36($29)
# fetch i @ $9
addiu $9 $9 1
# save i
sw $9 -36($29)
# GOTO for_condition_32;
j for_condition_32
nop
# for_end_33:
for_end_33:
# GOTO switch_end_30;
j switch_end_30
nop
# case_end_31:
case_end_31:
# %t26 = mode == 's';
# fetch %t26 @ $8
# load mode
lb $9 -5($29)
# fetch mode @ $9
xori $1 $9 115
sltiu $8 $1 1
# save %t26
sw $8 -32($29)
# if == 0 go to: %t26 case_end_35;
# load %t26
lw $8 -32($29)
# fetch %t26 @ $8
beq $8 $0 case_end_35
nop
# PRINT_INT result;
addiu $2 $0 1
# load result
lw $10 -12($29)
# fetch result @ $10
addiu $4 $10 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_30;
j switch_end_30
nop
# case_end_35:
case_end_35:
# GOTO switch_end_30;
j switch_end_30
nop
# case_end_36:
case_end_36:
# switch_end_30:
switch_end_30:
# RET;
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
