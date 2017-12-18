.data
const_str_6: .asciiz "m is too big. "
const_str_8: .asciiz "m is too small"
const_str_10: .asciiz "n is too big. "
const_str_12: .asciiz "n is too small. "
const_str_14: .asciiz "n should be no greater than m."
const_str_16: .asciiz "no errors seem found. "
const_str_25: .asciiz "Expression test failed! "
const_str_38: .asciiz "m! = "
const_str_39: .asciiz "repeat m! : "
const_str_40: .asciiz "n! = "
const_str_41: .asciiz "repeat n! : "
const_str_42: .asciiz "C(m, n) = "
.text
j main_22
nop
# factorial_0:
factorial_0:
# PROLOG factorial;
sw $8 -28($29)
sw $9 -32($29)
sw $10 -36($29)
sw $11 -40($29)
sw $12 -44($29)
sw $13 -48($29)
sw $14 -52($29)
sw $15 -56($29)
sw $16 -60($29)
sw $17 -64($29)
sw $18 -68($29)
sw $19 -72($29)
sw $20 -76($29)
sw $21 -80($29)
sw $22 -84($29)
sw $23 -88($29)
sw $24 -92($29)
sw $25 -96($29)
sw $31 -100($29)
# t0 = f <= 1;
# fetch t0 @ $8
# load f
lw $9 -8($29)
# fetch f @ $9
addiu $1 $0 1
addiu $1 $9 -1
slti $8 $1 1
# save t0
sw $8 -12($29)
# if == 0 go to: t0 if_false_1;
# load t0
lw $8 -12($29)
# fetch t0 @ $8
beq $8 $0 if_false_1
nop
# RET 1;
addiu $1 $0 1
sw $1 -4($29)
lw $8 -28($29)
lw $9 -32($29)
lw $10 -36($29)
lw $11 -40($29)
lw $12 -44($29)
lw $13 -48($29)
lw $14 -52($29)
lw $15 -56($29)
lw $16 -60($29)
lw $17 -64($29)
lw $18 -68($29)
lw $19 -72($29)
lw $20 -76($29)
lw $21 -80($29)
lw $22 -84($29)
lw $23 -88($29)
lw $24 -92($29)
lw $25 -96($29)
lw $31 -100($29)
jr $31
nop
# GOTO if_end_2;
j if_end_2
nop
# if_false_1:
if_false_1:
# t3 = f - 1;
# fetch t3 @ $8
# load f
lw $9 -8($29)
# fetch f @ $9
addiu $1 $0 1
subu $8 $9 $1
# save t3
sw $8 -20($29)
# PUSH t3;
# load t3
lw $8 -20($29)
# fetch t3 @ $8
sw $8 -108($29)
# CALL factorial;
addiu $29 $29 -100
jal factorial_0
nop
addiu $29 $29 100
# GET t1;
# fetch t1 @ $10
# load %pass_val
lw $10 -104($29)
# save t1
sw $10 -16($29)
# t4 = f * t1;
# fetch t4 @ $10
# load f
lw $9 -8($29)
# fetch f @ $9
# load t1
lw $11 -16($29)
# fetch t1 @ $11
mul $10 $9 $11
# save t4
sw $10 -24($29)
# RET t4;
# load t4
lw $10 -24($29)
# fetch t4 @ $10
sw $10 -4($29)
lw $8 -28($29)
lw $9 -32($29)
lw $10 -36($29)
lw $11 -40($29)
lw $12 -44($29)
lw $13 -48($29)
lw $14 -52($29)
lw $15 -56($29)
lw $16 -60($29)
lw $17 -64($29)
lw $18 -68($29)
lw $19 -72($29)
lw $20 -76($29)
lw $21 -80($29)
lw $22 -84($29)
lw $23 -88($29)
lw $24 -92($29)
lw $25 -96($29)
lw $31 -100($29)
jr $31
nop
# if_end_2:
if_end_2:
# EPILOG;
lw $8 -28($29)
lw $9 -32($29)
lw $10 -36($29)
lw $11 -40($29)
lw $12 -44($29)
lw $13 -48($29)
lw $14 -52($29)
lw $15 -56($29)
lw $16 -60($29)
lw $17 -64($29)
lw $18 -68($29)
lw $19 -72($29)
lw $20 -76($29)
lw $21 -80($29)
lw $22 -84($29)
lw $23 -88($29)
lw $24 -92($29)
lw $25 -96($29)
lw $31 -100($29)
jr $31
nop
# display_error_3:
display_error_3:
# PROLOG display_error;
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
# t5 = error_code == 1;
# fetch t5 @ $8
# load error_code
lw $9 -8($29)
# fetch error_code @ $9
xori $1 $9 1
sltiu $8 $1 1
# save t5
sw $8 -12($29)
# if == 0 go to: t5 case_end_5;
# load t5
lw $8 -12($29)
# fetch t5 @ $8
beq $8 $0 case_end_5
nop
# PRINT_STR const_str_6;
addiu $2 $0 4
la $4 const_str_6
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_4;
j switch_end_4
nop
# case_end_5:
case_end_5:
# t6 = error_code == 2;
# fetch t6 @ $8
# load error_code
lw $9 -8($29)
# fetch error_code @ $9
xori $1 $9 2
sltiu $8 $1 1
# save t6
sw $8 -16($29)
# if == 0 go to: t6 case_end_7;
# load t6
lw $8 -16($29)
# fetch t6 @ $8
beq $8 $0 case_end_7
nop
# PRINT_STR const_str_8;
addiu $2 $0 4
la $4 const_str_8
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_4;
j switch_end_4
nop
# case_end_7:
case_end_7:
# t7 = error_code == 3;
# fetch t7 @ $8
# load error_code
lw $9 -8($29)
# fetch error_code @ $9
xori $1 $9 3
sltiu $8 $1 1
# save t7
sw $8 -20($29)
# if == 0 go to: t7 case_end_9;
# load t7
lw $8 -20($29)
# fetch t7 @ $8
beq $8 $0 case_end_9
nop
# PRINT_STR const_str_10;
addiu $2 $0 4
la $4 const_str_10
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_4;
j switch_end_4
nop
# case_end_9:
case_end_9:
# t8 = error_code == 4;
# fetch t8 @ $8
# load error_code
lw $9 -8($29)
# fetch error_code @ $9
xori $1 $9 4
sltiu $8 $1 1
# save t8
sw $8 -24($29)
# if == 0 go to: t8 case_end_11;
# load t8
lw $8 -24($29)
# fetch t8 @ $8
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
# GOTO switch_end_4;
j switch_end_4
nop
# case_end_11:
case_end_11:
# t9 = error_code == 5;
# fetch t9 @ $8
# load error_code
lw $9 -8($29)
# fetch error_code @ $9
xori $1 $9 5
sltiu $8 $1 1
# save t9
sw $8 -28($29)
# if == 0 go to: t9 case_end_13;
# load t9
lw $8 -28($29)
# fetch t9 @ $8
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
# GOTO switch_end_4;
j switch_end_4
nop
# case_end_13:
case_end_13:
# PRINT_STR const_str_16;
addiu $2 $0 4
la $4 const_str_16
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_4;
j switch_end_4
nop
# case_end_15:
case_end_15:
# switch_end_4:
switch_end_4:
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
# expression_test_17:
expression_test_17:
# PROLOG expression_test;
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
# this_is_1 = 1;
# fetch this_is_1 @ $8
addiu $8 $0 1
# save this_is_1
sw $8 -8($29)
# RET this_is_1;
# load this_is_1
lw $8 -8($29)
# fetch this_is_1 @ $8
sw $8 -4($29)
lw $8 -12($29)
lw $9 -16($29)
lw $10 -20($29)
lw $11 -24($29)
lw $12 -28($29)
lw $13 -32($29)
lw $14 -36($29)
lw $15 -40($29)
lw $16 -44($29)
lw $17 -48($29)
lw $18 -52($29)
lw $19 -56($29)
lw $20 -60($29)
lw $21 -64($29)
lw $22 -68($29)
lw $23 -72($29)
lw $24 -76($29)
lw $25 -80($29)
lw $31 -84($29)
jr $31
nop
# EPILOG;
lw $8 -12($29)
lw $9 -16($29)
lw $10 -20($29)
lw $11 -24($29)
lw $12 -28($29)
lw $13 -32($29)
lw $14 -36($29)
lw $15 -40($29)
lw $16 -44($29)
lw $17 -48($29)
lw $18 -52($29)
lw $19 -56($29)
lw $20 -60($29)
lw $21 -64($29)
lw $22 -68($29)
lw $23 -72($29)
lw $24 -76($29)
lw $25 -80($29)
lw $31 -84($29)
jr $31
nop
# for_factorial_18:
for_factorial_18:
# PROLOG for_factorial;
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
# f = m;
# fetch f @ $8
# load m
lw $9 -8($29)
# fetch m @ $9
addiu $8 $9 0
# save f
sw $8 -12($29)
# t28 = m - 1;
# fetch t28 @ $8
# load m
lw $9 -8($29)
# fetch m @ $9
addiu $1 $0 1
subu $8 $9 $1
# save t28
sw $8 -16($29)
# m = t28;
# fetch m @ $9
# load t28
lw $8 -16($29)
# fetch t28 @ $8
addiu $9 $8 0
# save m
sw $9 -8($29)
# GOTO for_block_21;
j for_block_21
nop
# for_condition_19:
for_condition_19:
# if == 0 go to: m for_end_20;
# load m
lw $8 -8($29)
# fetch m @ $8
beq $8 $0 for_end_20
nop
# for_block_21:
for_block_21:
# t29 = f * m;
# fetch t29 @ $8
# load f
lw $9 -12($29)
# fetch f @ $9
# load m
lw $10 -8($29)
# fetch m @ $10
mul $8 $9 $10
# save t29
sw $8 -20($29)
# f = t29;
# fetch f @ $9
# load t29
lw $8 -20($29)
# fetch t29 @ $8
addiu $9 $8 0
# save f
sw $9 -12($29)
# m = m - 1;
# fetch m @ $10
# load m
lw $10 -8($29)
# fetch m @ $10
addiu $1 $0 1
subu $10 $10 $1
# save m
sw $10 -8($29)
# GOTO for_condition_19;
j for_condition_19
nop
# for_end_20:
for_end_20:
# RET f;
# load f
lw $8 -12($29)
# fetch f @ $8
sw $8 -4($29)
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
# main_22:
main_22:
# PROLOG main;
sw $8 -84($29)
sw $9 -88($29)
sw $10 -92($29)
sw $11 -96($29)
sw $12 -100($29)
sw $13 -104($29)
sw $14 -108($29)
sw $15 -112($29)
sw $16 -116($29)
sw $17 -120($29)
sw $18 -124($29)
sw $19 -128($29)
sw $20 -132($29)
sw $21 -136($29)
sw $22 -140($29)
sw $23 -144($29)
sw $24 -148($29)
sw $25 -152($29)
sw $31 -156($29)
# error_code = 0;
# fetch error_code @ $8
addiu $8 $0 0
# save error_code
sw $8 -8($29)
# READ_INT m;
addiu $2 $0 5
syscall
# fetch m @ $8
addiu $8 $2 0
# save m
sw $8 0($28)
# READ_INT n;
addiu $2 $0 5
syscall
# fetch n @ $8
addiu $8 $2 0
# save n
sw $8 4($28)
# CALL expression_test;
addiu $29 $29 -156
jal expression_test_17
nop
addiu $29 $29 156
# GET t30;
# fetch t30 @ $8
# load %pass_val
lw $8 -160($29)
# save t30
sw $8 -24($29)
# if == go to: t30 1 if_false_23;
# load t30
lw $8 -24($29)
# fetch t30 @ $8
addiu $1 $0 1
beq $8 $1 if_false_23
nop
# PRINT_STR const_str_25;
addiu $2 $0 4
la $4 const_str_25
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO if_end_24;
j if_end_24
nop
# if_false_23:
if_false_23:
# if_end_24:
if_end_24:
# t31 = m > 10;
# fetch t31 @ $8
# load m
lw $9 0($28)
# fetch m @ $9
addiu $1 $0 10
addiu $1 $0 10
slt $8 $1 $9
# save t31
sw $8 -28($29)
# if == 0 go to: t31 if_false_26;
# load t31
lw $8 -28($29)
# fetch t31 @ $8
beq $8 $0 if_false_26
nop
# error_code = 1;
# fetch error_code @ $10
addiu $10 $0 1
# save error_code
sw $10 -8($29)
# GOTO if_end_27;
j if_end_27
nop
# if_false_26:
if_false_26:
# if_end_27:
if_end_27:
# t32 = m < 0;
# fetch t32 @ $8
# load m
lw $9 0($28)
# fetch m @ $9
addiu $1 $0 0
slti $8 $9 0
# save t32
sw $8 -32($29)
# if == 0 go to: t32 if_false_28;
# load t32
lw $8 -32($29)
# fetch t32 @ $8
beq $8 $0 if_false_28
nop
# error_code = 2;
# fetch error_code @ $10
addiu $10 $0 2
# save error_code
sw $10 -8($29)
# GOTO if_end_29;
j if_end_29
nop
# if_false_28:
if_false_28:
# if_end_29:
if_end_29:
# t33 = n > 10;
# fetch t33 @ $8
# load n
lw $9 4($28)
# fetch n @ $9
addiu $1 $0 10
addiu $1 $0 10
slt $8 $1 $9
# save t33
sw $8 -36($29)
# if == 0 go to: t33 if_false_30;
# load t33
lw $8 -36($29)
# fetch t33 @ $8
beq $8 $0 if_false_30
nop
# error_code = 3;
# fetch error_code @ $10
addiu $10 $0 3
# save error_code
sw $10 -8($29)
# GOTO if_end_31;
j if_end_31
nop
# if_false_30:
if_false_30:
# if_end_31:
if_end_31:
# t34 = n < 0;
# fetch t34 @ $8
# load n
lw $9 4($28)
# fetch n @ $9
addiu $1 $0 0
slti $8 $9 0
# save t34
sw $8 -40($29)
# if == 0 go to: t34 if_false_32;
# load t34
lw $8 -40($29)
# fetch t34 @ $8
beq $8 $0 if_false_32
nop
# error_code = 4;
# fetch error_code @ $10
addiu $10 $0 4
# save error_code
sw $10 -8($29)
# GOTO if_end_33;
j if_end_33
nop
# if_false_32:
if_false_32:
# if_end_33:
if_end_33:
# t35 = m - n;
# fetch t35 @ $8
# load m
lw $9 0($28)
# fetch m @ $9
# load n
lw $10 4($28)
# fetch n @ $10
subu $8 $9 $10
# save t35
sw $8 -44($29)
# t36 = t35 < 0;
# fetch t36 @ $8
# load t35
lw $11 -44($29)
# fetch t35 @ $11
addiu $1 $0 0
slti $8 $11 0
# save t36
sw $8 -48($29)
# if == 0 go to: t36 if_false_34;
# load t36
lw $8 -48($29)
# fetch t36 @ $8
beq $8 $0 if_false_34
nop
# error_code = 5;
# fetch error_code @ $12
addiu $12 $0 5
# save error_code
sw $12 -8($29)
# GOTO if_end_35;
j if_end_35
nop
# if_false_34:
if_false_34:
# if_end_35:
if_end_35:
# PUSH error_code;
# load error_code
lw $8 -8($29)
# fetch error_code @ $8
sw $8 -164($29)
# CALL display_error;
addiu $29 $29 -156
jal display_error_3
nop
addiu $29 $29 156
# if != go to: error_code 0 if_false_36;
# load error_code
lw $8 -8($29)
# fetch error_code @ $8
addiu $1 $0 0
bne $8 $1 if_false_36
nop
# PUSH m;
# load m
lw $9 0($28)
# fetch m @ $9
sw $9 -164($29)
# CALL factorial;
addiu $29 $29 -156
jal factorial_0
nop
addiu $29 $29 156
# GET t38;
# fetch t38 @ $10
# load %pass_val
lw $10 -160($29)
# save t38
sw $10 -52($29)
# fact_m = t38;
# fetch fact_m @ $10
# load t38
lw $11 -52($29)
# fetch t38 @ $11
addiu $10 $11 0
# save fact_m
sw $10 -12($29)
# PUSH n;
# load n
lw $10 4($28)
# fetch n @ $10
sw $10 -164($29)
# CALL factorial;
addiu $29 $29 -156
jal factorial_0
nop
addiu $29 $29 156
# GET t40;
# fetch t40 @ $12
# load %pass_val
lw $12 -160($29)
# save t40
sw $12 -56($29)
# fact_n = t40;
# fetch fact_n @ $12
# load t40
lw $13 -56($29)
# fetch t40 @ $13
addiu $12 $13 0
# save fact_n
sw $12 -20($29)
# t44 = m - n;
# fetch t44 @ $12
# load m
lw $9 0($28)
# fetch m @ $9
# load n
lw $10 4($28)
# fetch n @ $10
subu $12 $9 $10
# save t44
sw $12 -64($29)
# PUSH t44;
# load t44
lw $12 -64($29)
# fetch t44 @ $12
sw $12 -164($29)
# CALL factorial;
addiu $29 $29 -156
jal factorial_0
nop
addiu $29 $29 156
# GET t42;
# fetch t42 @ $14
# load %pass_val
lw $14 -160($29)
# save t42
sw $14 -60($29)
# fact_m_sub_n = t42;
# fetch fact_m_sub_n @ $14
# load t42
lw $15 -60($29)
# fetch t42 @ $15
addiu $14 $15 0
# save fact_m_sub_n
sw $14 -16($29)
# PRINT_STR const_str_38;
addiu $2 $0 4
la $4 const_str_38
syscall
# PRINT_INT fact_m;
addiu $2 $0 1
# load fact_m
lw $14 -12($29)
# fetch fact_m @ $14
addiu $4 $14 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_39;
addiu $2 $0 4
la $4 const_str_39
syscall
# PUSH m;
# load m
lw $9 0($28)
# fetch m @ $9
sw $9 -164($29)
# CALL for_factorial;
addiu $29 $29 -156
jal for_factorial_18
nop
addiu $29 $29 156
# GET t45;
# save error_code
sw $8 -8($29)
# fetch t45 @ $8
# load %pass_val
lw $8 -160($29)
# save t45
sw $8 -68($29)
# PRINT_INT t45;
addiu $2 $0 1
# load t45
lw $8 -68($29)
# fetch t45 @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_40;
addiu $2 $0 4
la $4 const_str_40
syscall
# PRINT_INT fact_n;
addiu $2 $0 1
# save fact_m
sw $14 -12($29)
# load fact_n
lw $14 -20($29)
# fetch fact_n @ $14
addiu $4 $14 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_41;
addiu $2 $0 4
la $4 const_str_41
syscall
# PUSH n;
# load n
lw $10 4($28)
# fetch n @ $10
sw $10 -164($29)
# CALL for_factorial;
addiu $29 $29 -156
jal for_factorial_18
nop
addiu $29 $29 156
# GET t47;
# save m
sw $9 0($28)
# fetch t47 @ $9
# load %pass_val
lw $9 -160($29)
# save t47
sw $9 -72($29)
# PRINT_INT t47;
addiu $2 $0 1
# load t47
lw $9 -72($29)
# fetch t47 @ $9
addiu $4 $9 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_42;
addiu $2 $0 4
la $4 const_str_42
syscall
# t49 = fact_m / fact_n;
# save n
sw $10 4($28)
# fetch t49 @ $10
# save t38
sw $11 -52($29)
# load fact_m
lw $11 -12($29)
# fetch fact_m @ $11
# load fact_n
lw $14 -20($29)
# fetch fact_n @ $14
div $11 $14
mflo $10
# save t49
sw $10 -76($29)
# t50 = t49 / fact_m_sub_n;
# fetch t50 @ $10
# save fact_m
sw $11 -12($29)
# load t49
lw $11 -76($29)
# fetch t49 @ $11
# save fact_n
sw $14 -20($29)
# load fact_m_sub_n
lw $14 -16($29)
# fetch fact_m_sub_n @ $14
div $11 $14
mflo $10
# save t50
sw $10 -80($29)
# PRINT_INT t50;
addiu $2 $0 1
# load t50
lw $10 -80($29)
# fetch t50 @ $10
addiu $4 $10 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO if_end_37;
j if_end_37
nop
# if_false_36:
if_false_36:
# if_end_37:
if_end_37:
# EPILOG;
j __exit__
nop
__exit__:
addiu $2 $0 10
syscall
