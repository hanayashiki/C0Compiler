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
# get param global: f
lw $18 -8($29)
# %t0 = f <= 1;
# fetch %t0 @ $16 global
# fetch f @ $18 global
addiu $1 $0 1
addiu $1 $18 -1
slti $16 $1 1
# if == 0 go to: %t0 if_false_1;
# fetch %t0 @ $16 global
beq $16 $0 if_false_1
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
# %t3 = f - 1;
# fetch %t3 @ $16 global
# fetch f @ $18 global
addiu $1 $0 1
subu $16 $18 $1
# PUSH %t3;
# fetch %t3 @ $16 global
sw $16 -108($29)
# CALL factorial;
addiu $29 $29 -100
jal factorial_0
nop
addiu $29 $29 100
# GET %t1;
# fetch %t1 @ $17 global
# load %pass_val
lw $8 -104($29)
# fetch %pass_val @ $8
addiu $17 $8 0
# %t4 = f * %t1;
# fetch %t4 @ $16 global
# fetch f @ $18 global
# fetch %t1 @ $17 global
mul $16 $18 $17
# RET %t4;
# fetch %t4 @ $16 global
sw $16 -4($29)
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
# get param global: error_code
lw $17 -8($29)
# %t5 = error_code == 1;
# fetch %t5 @ $16 global
# fetch error_code @ $17 global
xori $1 $17 1
sltiu $16 $1 1
# if == 0 go to: %t5 case_end_5;
# fetch %t5 @ $16 global
beq $16 $0 case_end_5
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
# %t6 = error_code == 2;
# fetch %t6 @ $16 global
# fetch error_code @ $17 global
xori $1 $17 2
sltiu $16 $1 1
# if == 0 go to: %t6 case_end_7;
# fetch %t6 @ $16 global
beq $16 $0 case_end_7
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
# %t7 = error_code == 3;
# fetch %t7 @ $16 global
# fetch error_code @ $17 global
xori $1 $17 3
sltiu $16 $1 1
# if == 0 go to: %t7 case_end_9;
# fetch %t7 @ $16 global
beq $16 $0 case_end_9
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
# %t8 = error_code == 4;
# fetch %t8 @ $16 global
# fetch error_code @ $17 global
xori $1 $17 4
sltiu $16 $1 1
# if == 0 go to: %t8 case_end_11;
# fetch %t8 @ $16 global
beq $16 $0 case_end_11
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
# %t9 = error_code == 5;
# fetch %t9 @ $16 global
# fetch error_code @ $17 global
xori $1 $17 5
sltiu $16 $1 1
# if == 0 go to: %t9 case_end_13;
# fetch %t9 @ $16 global
beq $16 $0 case_end_13
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
# RET 1;
addiu $1 $0 1
sw $1 -4($29)
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
# get param global: m
lw $16 -8($29)
# f = m;
# fetch f @ $17 global
# fetch m @ $16 global
addiu $17 $16 0
# m = m - 1;
# fetch m @ $16 global
# fetch m @ $16 global
addiu $1 $0 1
subu $16 $16 $1
# GOTO for_block_21;
j for_block_21
nop
# for_condition_19:
for_condition_19:
# if == 0 go to: m for_end_20;
# fetch m @ $16 global
beq $16 $0 for_end_20
nop
# for_block_21:
for_block_21:
# f = f * m;
# fetch f @ $17 global
# fetch f @ $17 global
# fetch m @ $16 global
mul $17 $17 $16
# m = m - 1;
# fetch m @ $16 global
# fetch m @ $16 global
addiu $1 $0 1
subu $16 $16 $1
# GOTO for_condition_19;
j for_condition_19
nop
# for_end_20:
for_end_20:
# RET f;
# fetch f @ $17 global
sw $17 -4($29)
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
# fetch error_code @ $18 global
addiu $18 $0 0
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
# GET %t30;
# fetch %t30 @ $16 global
# load %pass_val
lw $8 -160($29)
# fetch %pass_val @ $8
addiu $16 $8 0
# if == go to: %t30 1 if_false_23;
# fetch %t30 @ $16 global
addiu $1 $0 1
beq $16 $1 if_false_23
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
# %t31 = m > 10;
# fetch %t31 @ $16 global
# load m
lw $8 0($28)
# fetch m @ $8
addiu $1 $0 10
addiu $1 $0 10
slt $16 $1 $8
# if == 0 go to: %t31 if_false_26;
# fetch %t31 @ $16 global
beq $16 $0 if_false_26
nop
# error_code = 1;
# fetch error_code @ $18 global
addiu $18 $0 1
# GOTO if_end_27;
j if_end_27
nop
# if_false_26:
if_false_26:
# if_end_27:
if_end_27:
# %t32 = m < 0;
# fetch %t32 @ $16 global
# load m
lw $8 0($28)
# fetch m @ $8
addiu $1 $0 0
slti $16 $8 0
# if == 0 go to: %t32 if_false_28;
# fetch %t32 @ $16 global
beq $16 $0 if_false_28
nop
# error_code = 2;
# fetch error_code @ $18 global
addiu $18 $0 2
# GOTO if_end_29;
j if_end_29
nop
# if_false_28:
if_false_28:
# if_end_29:
if_end_29:
# %t33 = n > 10;
# fetch %t33 @ $16 global
# load n
lw $8 4($28)
# fetch n @ $8
addiu $1 $0 10
addiu $1 $0 10
slt $16 $1 $8
# if == 0 go to: %t33 if_false_30;
# fetch %t33 @ $16 global
beq $16 $0 if_false_30
nop
# error_code = 3;
# fetch error_code @ $18 global
addiu $18 $0 3
# GOTO if_end_31;
j if_end_31
nop
# if_false_30:
if_false_30:
# if_end_31:
if_end_31:
# %t34 = n < 0;
# fetch %t34 @ $16 global
# load n
lw $8 4($28)
# fetch n @ $8
addiu $1 $0 0
slti $16 $8 0
# if == 0 go to: %t34 if_false_32;
# fetch %t34 @ $16 global
beq $16 $0 if_false_32
nop
# error_code = 4;
# fetch error_code @ $18 global
addiu $18 $0 4
# GOTO if_end_33;
j if_end_33
nop
# if_false_32:
if_false_32:
# if_end_33:
if_end_33:
# %t35 = m - n;
# fetch %t35 @ $17 global
# load m
lw $8 0($28)
# fetch m @ $8
# load n
lw $9 4($28)
# fetch n @ $9
subu $17 $8 $9
# %t36 = %t35 < 0;
# fetch %t36 @ $16 global
# fetch %t35 @ $17 global
addiu $1 $0 0
slti $16 $17 0
# if == 0 go to: %t36 if_false_34;
# fetch %t36 @ $16 global
beq $16 $0 if_false_34
nop
# error_code = 5;
# fetch error_code @ $18 global
addiu $18 $0 5
# GOTO if_end_35;
j if_end_35
nop
# if_false_34:
if_false_34:
# if_end_35:
if_end_35:
# PUSH error_code;
# fetch error_code @ $18 global
sw $18 -164($29)
# CALL display_error;
addiu $29 $29 -156
jal display_error_3
nop
addiu $29 $29 156
# if != go to: error_code 0 if_false_36;
# fetch error_code @ $18 global
addiu $1 $0 0
bne $18 $1 if_false_36
nop
# PUSH m;
# load m
lw $8 0($28)
# fetch m @ $8
sw $8 -164($29)
# CALL factorial;
addiu $29 $29 -156
jal factorial_0
nop
addiu $29 $29 156
# GET fact_m;
# fetch fact_m @ $21 global
# load %pass_val
lw $9 -160($29)
# fetch %pass_val @ $9
addiu $21 $9 0
# PUSH n;
# load n
lw $9 4($28)
# fetch n @ $9
sw $9 -164($29)
# CALL factorial;
addiu $29 $29 -156
jal factorial_0
nop
addiu $29 $29 156
# GET fact_n;
# fetch fact_n @ $19 global
# load %pass_val
lw $10 -160($29)
# fetch %pass_val @ $10
addiu $19 $10 0
# %t44 = m - n;
# fetch %t44 @ $16 global
# load m
lw $8 0($28)
# fetch m @ $8
# load n
lw $9 4($28)
# fetch n @ $9
subu $16 $8 $9
# PUSH %t44;
# fetch %t44 @ $16 global
sw $16 -164($29)
# CALL factorial;
addiu $29 $29 -156
jal factorial_0
nop
addiu $29 $29 156
# GET fact_m_sub_n;
# fetch fact_m_sub_n @ $20 global
# load %pass_val
lw $10 -160($29)
# fetch %pass_val @ $10
addiu $20 $10 0
# PRINT_STR const_str_38;
addiu $2 $0 4
la $4 const_str_38
syscall
# PRINT_INT fact_m;
addiu $2 $0 1
# fetch fact_m @ $21 global
addiu $4 $21 0
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
lw $8 0($28)
# fetch m @ $8
sw $8 -164($29)
# CALL for_factorial;
addiu $29 $29 -156
jal for_factorial_18
nop
addiu $29 $29 156
# GET %t45;
# fetch %t45 @ $16 global
# load %pass_val
lw $10 -160($29)
# fetch %pass_val @ $10
addiu $16 $10 0
# PRINT_INT %t45;
addiu $2 $0 1
# fetch %t45 @ $16 global
addiu $4 $16 0
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
# fetch fact_n @ $19 global
addiu $4 $19 0
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
lw $9 4($28)
# fetch n @ $9
sw $9 -164($29)
# CALL for_factorial;
addiu $29 $29 -156
jal for_factorial_18
nop
addiu $29 $29 156
# GET %t47;
# fetch %t47 @ $16 global
# load %pass_val
lw $10 -160($29)
# fetch %pass_val @ $10
addiu $16 $10 0
# PRINT_INT %t47;
addiu $2 $0 1
# fetch %t47 @ $16 global
addiu $4 $16 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_42;
addiu $2 $0 4
la $4 const_str_42
syscall
# %t49 = fact_m / fact_n;
# fetch %t49 @ $18 global
# fetch fact_m @ $21 global
# fetch fact_n @ $19 global
div $21 $19
mflo $18
# %t50 = %t49 / fact_m_sub_n;
# fetch %t50 @ $17 global
# fetch %t49 @ $18 global
# fetch fact_m_sub_n @ $20 global
div $18 $20
mflo $17
# PRINT_INT %t50;
addiu $2 $0 1
# fetch %t50 @ $17 global
addiu $4 $17 0
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
