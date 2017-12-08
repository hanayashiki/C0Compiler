.data
const_str_7: .asciiz "Layer "
const_str_8: .asciiz " : "
const_str_11: .asciiz "Enter your custom chart-making symbol: "
const_str_12: .asciiz "Enter the lmt and the pace: "
const_str_16: .asciiz "BEGIN"
const_str_25: .asciiz "Too small lmt value. The lower_bound is "
const_str_27: .asciiz "Too large lmt value. The upper_bound is "
const_str_29: .asciiz "Illegal pace value. The pace must be a positive integer."
const_str_31: .asciiz "Result : "
const_str_35: .asciiz "END"
.text
j main_10
nop
# trash_func_5:
trash_func_5:
# PROLOG trash_func;
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
# RET '_';
addiu $1 $0 95
sw $1 -1($29)
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
# main_10:
main_10:
# PROLOG main;
sw $8 -60($29)
sw $9 -64($29)
sw $10 -68($29)
sw $11 -72($29)
sw $12 -76($29)
sw $13 -80($29)
sw $14 -84($29)
sw $15 -88($29)
sw $16 -92($29)
sw $17 -96($29)
sw $18 -100($29)
sw $19 -104($29)
sw $20 -108($29)
sw $21 -112($29)
sw $22 -116($29)
sw $23 -120($29)
sw $24 -124($29)
sw $25 -128($29)
sw $31 -132($29)
# PRINT_STR const_str_11;
addiu $2 $0 4
la $4 const_str_11
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# READ_CHAR custom;
addiu $2 $0 12
syscall
# fetch custom @ $8
addiu $8 $2 0
# save custom
sb $8 12($28)
# PRINT_STR const_str_12;
addiu $2 $0 4
la $4 const_str_12
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# READ_INT lmt;
addiu $2 $0 5
syscall
# fetch lmt @ $8
addiu $8 $2 0
# save lmt
sw $8 8($28)
# READ_INT pace;
addiu $2 $0 5
syscall
# fetch pace @ $8
addiu $8 $2 0
# save pace
sw $8 4($28)
# t77 = trashpara + 10086;
# fetch t77 @ $8
# load trashpara
lw $9 -56($29)
# fetch trashpara @ $9
addiu $8 $9 10086
# save t77
sw $8 -24($29)
# PUSH t77;
# load t77
lw $8 -24($29)
# fetch t77 @ $8
sw $8 -140($29)
addiu $1 $0 233333
sw $1 -144($29)
# CALL Read;
addiu $29 $29 -132
jal Read_0
nop
addiu $29 $29 132
# GET t75;
# fetch t75 @ $10
# load %pass_val
lw $10 -136($29)
# save t75
sw $10 -20($29)
# flag = t75;
# fetch flag @ $10
# load t75
lw $11 -20($29)
# fetch t75 @ $11
addiu $10 $11 0
# save flag
sw $10 -8($29)
# i = 0;
# fetch i @ $10
addiu $10 $0 0
# save i
sw $10 -12($29)
# GOTO for_block_15;
j for_block_15
nop
# for_condition_13:
for_condition_13:
# if == go to: i 25 for_end_14;
# load i
lw $8 -12($29)
# fetch i @ $8
addiu $1 $0 25
beq $8 $1 for_end_14
nop
# for_block_15:
for_block_15:
# PRINT_CHAR custom;
addiu $2 $0 11
# load custom
lb $8 12($28)
# fetch custom @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# i = i + 1;
# fetch i @ $9
# load i
lw $9 -12($29)
# fetch i @ $9
addiu $9 $9 1
# save i
sw $9 -12($29)
# GOTO for_condition_13;
j for_condition_13
nop
# for_end_14:
for_end_14:
# PRINT_STR const_str_16;
addiu $2 $0 4
la $4 const_str_16
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# i = 0;
# fetch i @ $8
addiu $8 $0 0
# save i
sw $8 -12($29)
# GOTO for_block_19;
j for_block_19
nop
# for_condition_17:
for_condition_17:
# t79 = i <= 4;
# fetch t79 @ $8
# load i
lw $9 -12($29)
# fetch i @ $9
addiu $1 $0 4
addiu $1 $9 -1
slti $8 $1 4
# save t79
sw $8 -28($29)
# if == 0 go to: t79 for_end_18;
# load t79
lw $8 -28($29)
# fetch t79 @ $8
beq $8 $0 for_end_18
nop
# for_block_19:
for_block_19:
# j = 20;
# fetch j @ $8
addiu $8 $0 20
# save j
sw $8 -16($29)
# GOTO for_block_22;
j for_block_22
nop
# for_condition_20:
for_condition_20:
# t80 = j >= 0;
# fetch t80 @ $8
# load j
lw $9 -16($29)
# fetch j @ $9
addiu $1 $0 0
slti $1 $9 0
xori $8 $1 1
# save t80
sw $8 -32($29)
# if == 0 go to: t80 for_end_21;
# load t80
lw $8 -32($29)
# fetch t80 @ $8
beq $8 $0 for_end_21
nop
# for_block_22:
for_block_22:
# PRINT_CHAR custom;
addiu $2 $0 11
# load custom
lb $8 12($28)
# fetch custom @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# j = j - 5;
# fetch j @ $9
# load j
lw $9 -16($29)
# fetch j @ $9
addiu $1 $0 5
subu $9 $9 $1
# save j
sw $9 -16($29)
# GOTO for_condition_20;
j for_condition_20
nop
# for_end_21:
for_end_21:
# i = i + 1;
# fetch i @ $8
# load i
lw $8 -12($29)
# fetch i @ $8
addiu $8 $8 1
# save i
sw $8 -12($29)
# GOTO for_condition_17;
j for_condition_17
nop
# for_end_18:
for_end_18:
# t81 = flag == 1;
# fetch t81 @ $8
# load flag
lw $9 -8($29)
# fetch flag @ $9
xori $1 $9 1
sltiu $8 $1 1
# save t81
sw $8 -36($29)
# if == 0 go to: t81 case_end_24;
# load t81
lw $8 -36($29)
# fetch t81 @ $8
beq $8 $0 case_end_24
nop
# PRINT_STR const_str_25;
addiu $2 $0 4
la $4 const_str_25
syscall
# PRINT_INT 2;
addiu $2 $0 1
addiu $4 $0 2
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_23;
j switch_end_23
nop
# case_end_24:
case_end_24:
# t82 = flag == 2;
# fetch t82 @ $8
# load flag
lw $9 -8($29)
# fetch flag @ $9
xori $1 $9 2
sltiu $8 $1 1
# save t82
sw $8 -40($29)
# if == 0 go to: t82 case_end_26;
# load t82
lw $8 -40($29)
# fetch t82 @ $8
beq $8 $0 case_end_26
nop
# PRINT_STR const_str_27;
addiu $2 $0 4
la $4 const_str_27
syscall
# PRINT_INT 9;
addiu $2 $0 1
addiu $4 $0 9
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_23;
j switch_end_23
nop
# case_end_26:
case_end_26:
# t83 = flag == 3;
# fetch t83 @ $8
# load flag
lw $9 -8($29)
# fetch flag @ $9
xori $1 $9 3
sltiu $8 $1 1
# save t83
sw $8 -44($29)
# if == 0 go to: t83 case_end_28;
# load t83
lw $8 -44($29)
# fetch t83 @ $8
beq $8 $0 case_end_28
nop
# PRINT_STR const_str_29;
addiu $2 $0 4
la $4 const_str_29
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_23;
j switch_end_23
nop
# case_end_28:
case_end_28:
# PRINT_STR const_str_31;
addiu $2 $0 4
la $4 const_str_31
syscall
# PUSH '0';
addiu $1 $0 48
sb $1 -137($29)
# CALL Count;
addiu $29 $29 -132
jal Count_6
nop
addiu $29 $29 132
# GET t84;
# fetch t84 @ $8
# load %pass_val
lw $8 -136($29)
# save t84
sw $8 -48($29)
# PRINT_INT t84;
addiu $2 $0 1
# load t84
lw $8 -48($29)
# fetch t84 @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_23;
j switch_end_23
nop
# case_end_30:
case_end_30:
# switch_end_23:
switch_end_23:
# i = 0;
# fetch i @ $8
addiu $8 $0 0
# save i
sw $8 -12($29)
# GOTO for_block_34;
j for_block_34
nop
# for_condition_32:
for_condition_32:
# if == go to: i 26 for_end_33;
# load i
lw $8 -12($29)
# fetch i @ $8
addiu $1 $0 26
beq $8 $1 for_end_33
nop
# for_block_34:
for_block_34:
# PRINT_CHAR custom;
addiu $2 $0 11
# load custom
lb $8 12($28)
# fetch custom @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# i = i + 1;
# fetch i @ $9
# load i
lw $9 -12($29)
# fetch i @ $9
addiu $9 $9 1
# save i
sw $9 -12($29)
# GOTO for_condition_32;
j for_condition_32
nop
# for_end_33:
for_end_33:
# PRINT_STR const_str_35;
addiu $2 $0 4
la $4 const_str_35
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# i = 0;
# fetch i @ $8
addiu $8 $0 0
# save i
sw $8 -12($29)
# GOTO for_block_38;
j for_block_38
nop
# for_condition_36:
for_condition_36:
# t86 = i <= 1;
# fetch t86 @ $8
# load i
lw $9 -12($29)
# fetch i @ $9
addiu $1 $0 1
addiu $1 $9 -1
slti $8 $1 1
# save t86
sw $8 -52($29)
# if == 0 go to: t86 for_end_37;
# load t86
lw $8 -52($29)
# fetch t86 @ $8
beq $8 $0 for_end_37
nop
# for_block_38:
for_block_38:
# j = 13;
# fetch j @ $8
addiu $8 $0 13
# save j
sw $8 -16($29)
# GOTO for_block_41;
j for_block_41
nop
# for_condition_39:
for_condition_39:
# if == 0 go to: j for_end_40;
# load j
lw $8 -16($29)
# fetch j @ $8
beq $8 $0 for_end_40
nop
# for_block_41:
for_block_41:
# PRINT_CHAR custom;
addiu $2 $0 11
# load custom
lb $8 12($28)
# fetch custom @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# j = j - 1;
# fetch j @ $9
# load j
lw $9 -16($29)
# fetch j @ $9
addiu $1 $0 1
subu $9 $9 $1
# save j
sw $9 -16($29)
# GOTO for_condition_39;
j for_condition_39
nop
# for_end_40:
for_end_40:
# i = i + 1;
# fetch i @ $8
# load i
lw $8 -12($29)
# fetch i @ $8
addiu $8 $8 1
# save i
sw $8 -12($29)
# GOTO for_condition_36;
j for_condition_36
nop
# for_end_37:
for_end_37:
# RET;
j __exit__
nop
# EPILOG;
j __exit__
nop
# Read_0:
Read_0:
# PROLOG Read;
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
# t0 = lmt < 2;
# fetch t0 @ $8
# load lmt
lw $9 8($28)
# fetch lmt @ $9
addiu $1 $0 2
slti $8 $9 2
# save t0
sw $8 -16($29)
# if == 0 go to: t0 if_false_1;
# load t0
lw $8 -16($29)
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
# if_false_1:
if_false_1:
# t1 = lmt > 9;
# fetch t1 @ $8
# load lmt
lw $9 8($28)
# fetch lmt @ $9
addiu $1 $0 9
addiu $1 $0 9
slt $8 $1 $9
# save t1
sw $8 -20($29)
# if == 0 go to: t1 if_false_2;
# load t1
lw $8 -20($29)
# fetch t1 @ $8
beq $8 $0 if_false_2
nop
# RET 2;
addiu $1 $0 2
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
# if_false_2:
if_false_2:
# t2 = pace <= 0;
# fetch t2 @ $8
# load pace
lw $9 4($28)
# fetch pace @ $9
addiu $1 $0 0
addiu $1 $9 -1
slti $8 $1 0
# save t2
sw $8 -24($29)
# if == 0 go to: t2 if_false_3;
# load t2
lw $8 -24($29)
# fetch t2 @ $8
beq $8 $0 if_false_3
nop
# RET 3;
addiu $1 $0 3
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
# if_false_3:
if_false_3:
# RET 0;
addiu $1 $0 0
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
# square_4:
square_4:
# PROLOG square;
sw $8 -48($29)
sw $9 -52($29)
sw $10 -56($29)
sw $11 -60($29)
sw $12 -64($29)
sw $13 -68($29)
sw $14 -72($29)
sw $15 -76($29)
sw $16 -80($29)
sw $17 -84($29)
sw $18 -88($29)
sw $19 -92($29)
sw $20 -96($29)
sw $21 -100($29)
sw $22 -104($29)
sw $23 -108($29)
sw $24 -112($29)
sw $25 -116($29)
sw $31 -120($29)
# t3 = point + 1;
# fetch t3 @ $8
# load point
lw $9 0($28)
# fetch point @ $9
addiu $8 $9 1
# save t3
sw $8 -16($29)
# point = t3;
# fetch point @ $9
# load t3
lw $8 -16($29)
# fetch t3 @ $8
addiu $9 $8 0
# save point
sw $9 0($28)
# t4 = point;
# fetch t4 @ $9
# load point
lw $10 0($28)
# fetch point @ $10
addiu $9 $10 0
# save t4
sw $9 -20($29)
# t6 = x * x;
# fetch t6 @ $9
# load x
lw $11 -8($29)
# fetch x @ $11
# load x
lw $11 -8($29)
# fetch x @ $11
mul $9 $11 $11
# save t6
sw $9 -28($29)
# t5 = t6;
# fetch t5 @ $9
# load t6
lw $12 -28($29)
# fetch t6 @ $12
addiu $9 $12 0
# save t5
sw $9 -24($29)
# sum[t4] = t5;
# load sum
addiu $9 $28 16
# fetch sum @ $9
# load t5
lw $13 -24($29)
# fetch t5 @ $13
# load t4
lw $14 -20($29)
# fetch t4 @ $14
sll $1 $14 2
addu $1 $1 $9
sw $13 0($1)
# save sum
# EPILOG;
lw $8 -48($29)
lw $9 -52($29)
lw $10 -56($29)
lw $11 -60($29)
lw $12 -64($29)
lw $13 -68($29)
lw $14 -72($29)
lw $15 -76($29)
lw $16 -80($29)
lw $17 -84($29)
lw $18 -88($29)
lw $19 -92($29)
lw $20 -96($29)
lw $21 -100($29)
lw $22 -104($29)
lw $23 -108($29)
lw $24 -112($29)
lw $25 -116($29)
lw $31 -120($29)
jr $31
nop
# Count_6:
Count_6:
# PROLOG Count;
sw $8 -240($29)
sw $9 -244($29)
sw $10 -248($29)
sw $11 -252($29)
sw $12 -256($29)
sw $13 -260($29)
sw $14 -264($29)
sw $15 -268($29)
sw $16 -272($29)
sw $17 -276($29)
sw $18 -280($29)
sw $19 -284($29)
sw $20 -288($29)
sw $21 -292($29)
sw $22 -296($29)
sw $23 -300($29)
sw $24 -304($29)
sw $25 -308($29)
sw $31 -312($29)
# t9 = (int)layer;
# fetch t9 @ $8
# load layer
lb $9 -5($29)
# fetch layer @ $9
addiu $8 $9 0
# save t9
sw $8 -236($29)
# t8 = t9 - 48;
# fetch t8 @ $8
# load t9
lw $10 -236($29)
# fetch t9 @ $10
addiu $1 $0 48
subu $8 $10 $1
# save t8
sw $8 -232($29)
# t11 = t8 + 1;
# fetch t11 @ $8
# load t8
lw $11 -232($29)
# fetch t8 @ $11
addiu $8 $11 1
# save t11
sw $8 -12($29)
# PUSH t11;
# load t11
lw $8 -12($29)
# fetch t11 @ $8
sw $8 -320($29)
# CALL square;
addiu $29 $29 -312
jal square_4
nop
addiu $29 $29 312
# t13 = (int)layer;
# fetch t13 @ $12
# load layer
lb $9 -5($29)
# fetch layer @ $9
addiu $12 $9 0
# save t13
sw $12 -20($29)
# t12 = t13 - 48;
# fetch t12 @ $12
# load t13
lw $13 -20($29)
# fetch t13 @ $13
addiu $1 $0 48
subu $12 $13 $1
# save t12
sw $12 -16($29)
# t15 = t12 / pace;
# fetch t15 @ $12
# load t12
lw $14 -16($29)
# fetch t12 @ $14
# load pace
lw $15 4($28)
# fetch pace @ $15
div $14 $15
mflo $12
# save t15
sw $12 -24($29)
# t16 = t15 + 49;
# fetch t16 @ $12
# save t11
sw $8 -12($29)
# load t15
lw $8 -24($29)
# fetch t15 @ $8
addiu $12 $8 49
# save t16
sw $12 -28($29)
# t18 = (char)t16;
# fetch t18 @ $12
# save t12
sw $14 -16($29)
# load t16
lw $14 -28($29)
# fetch t16 @ $14
addiu $12 $14 0
# save t18
sb $12 -29($29)
# ch = t18;
# fetch ch @ $12
# save t13
sw $13 -20($29)
# load t18
lb $13 -29($29)
# fetch t18 @ $13
addiu $12 $13 0
# save ch
sb $12 -6($29)
# PRINT_STR const_str_7;
addiu $2 $0 4
la $4 const_str_7
syscall
# PRINT_CHAR ch;
addiu $2 $0 11
# load ch
lb $12 -6($29)
# fetch ch @ $12
addiu $4 $12 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_8;
addiu $2 $0 4
la $4 const_str_8
syscall
# t19 = point;
# save ch
sb $12 -6($29)
# fetch t19 @ $12
# save t15
sw $8 -24($29)
# load point
lw $8 0($28)
# fetch point @ $8
addiu $12 $8 0
# save t19
sw $12 -36($29)
# t20 = sum[t19];
# load sum
addiu $12 $28 16
# fetch sum @ $12
# save point
sw $8 0($28)
# fetch t20 @ $8
# save t16
sw $14 -28($29)
# load t19
lw $14 -36($29)
# fetch t19 @ $14
sll $1 $14 2
addu $1 $1 $12
lw $8 0($1)
# save t20
sw $8 -40($29)
# PRINT_INT t20;
addiu $2 $0 1
# load t20
lw $8 -40($29)
# fetch t20 @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# t22 = (int)layer;
# save sum
# fetch t22 @ $12
# load layer
lb $9 -5($29)
# fetch layer @ $9
addiu $12 $9 0
# save t22
sw $12 -48($29)
# t21 = t22 - 48;
# fetch t21 @ $12
# save layer
sb $9 -5($29)
# load t22
lw $9 -48($29)
# fetch t22 @ $9
addiu $1 $0 48
subu $12 $9 $1
# save t21
sw $12 -44($29)
# t24 = lmt - t21;
# fetch t24 @ $12
# save t18
sb $13 -29($29)
# load lmt
lw $13 8($28)
# fetch lmt @ $13
# save t19
sw $14 -36($29)
# load t21
lw $14 -44($29)
# fetch t21 @ $14
subu $12 $13 $14
# save t24
sw $12 -52($29)
# t25 = t24 - pace;
# fetch t25 @ $12
# save lmt
sw $13 8($28)
# load t24
lw $13 -52($29)
# fetch t24 @ $13
# load pace
lw $15 4($28)
# fetch pace @ $15
subu $12 $13 $15
# save t25
sw $12 -56($29)
# t31 = t25 + 117;
# fetch t31 @ $12
# save pace
sw $15 4($28)
# load t25
lw $15 -56($29)
# fetch t25 @ $15
addiu $12 $15 117
# save t31
sw $12 -60($29)
# t32 = t31 - 118;
# fetch t32 @ $12
# save t20
sw $8 -40($29)
# load t31
lw $8 -60($29)
# fetch t31 @ $8
addiu $1 $0 118
subu $12 $8 $1
# save t32
sw $12 -64($29)
# t33 = -t32;
# fetch t33 @ $12
# save t21
sw $14 -44($29)
# load t32
lw $14 -64($29)
# fetch t32 @ $14
xori $1 $14 -1
addiu $12 $1 1
# save t33
sw $12 -68($29)
# t34 = -t33;
# fetch t34 @ $12
# save t22
sw $9 -48($29)
# load t33
lw $9 -68($29)
# fetch t33 @ $9
xori $1 $9 -1
addiu $12 $1 1
# save t34
sw $12 -72($29)
# t35 = t34 >= 0;
# fetch t35 @ $12
# save t24
sw $13 -52($29)
# load t34
lw $13 -72($29)
# fetch t34 @ $13
addiu $1 $0 0
slti $1 $13 0
xori $12 $1 1
# save t35
sw $12 -76($29)
# if == 0 go to: t35 if_false_9;
# load t35
lw $12 -76($29)
# fetch t35 @ $12
beq $12 $0 if_false_9
nop
# t36 = point;
# save t25
sw $15 -56($29)
# fetch t36 @ $15
# save t31
sw $8 -60($29)
# load point
lw $8 0($28)
# fetch point @ $8
addiu $15 $8 0
# save t36
sw $15 -80($29)
# t37 = sum[t36];
# load sum
addiu $15 $28 16
# fetch sum @ $15
# save point
sw $8 0($28)
# fetch t37 @ $8
# save t32
sw $14 -64($29)
# load t36
lw $14 -80($29)
# fetch t36 @ $14
sll $1 $14 2
addu $1 $1 $15
lw $8 0($1)
# save t37
sw $8 -84($29)
# t41 = (int)layer;
# fetch t41 @ $8
# save sum
# load layer
lb $15 -5($29)
# fetch layer @ $15
addiu $8 $15 0
# save t41
sw $8 -96($29)
# t40 = t41 + pace;
# fetch t40 @ $8
# save layer
sb $15 -5($29)
# load t41
lw $15 -96($29)
# fetch t41 @ $15
# save t33
sw $9 -68($29)
# load pace
lw $9 4($28)
# fetch pace @ $9
addu $8 $15 $9
# save t40
sw $8 -92($29)
# t39 = t40;
# fetch t39 @ $8
# save pace
sw $9 4($28)
# load t40
lw $9 -92($29)
# fetch t40 @ $9
addiu $8 $9 0
# save t39
sb $8 0($29)
# PUSH t39;
# load t39
lb $8 0($29)
# fetch t39 @ $8
sb $8 -317($29)
# CALL Count;
addiu $29 $29 -312
jal Count_6
nop
addiu $29 $29 312
# GET t38;
# save t34
sw $13 -72($29)
# fetch t38 @ $13
# load %pass_val
lw $13 -316($29)
# save t38
sw $13 -88($29)
# t42 = t37 + t38;
# fetch t42 @ $13
# save t35
sw $12 -76($29)
# load t37
lw $12 -84($29)
# fetch t37 @ $12
# save t36
sw $14 -80($29)
# load t38
lw $14 -88($29)
# fetch t38 @ $14
addu $13 $12 $14
# save t42
sw $13 -100($29)
# RET t42;
# load t42
lw $13 -100($29)
# fetch t42 @ $13
sw $13 -4($29)
lw $8 -240($29)
lw $9 -244($29)
lw $10 -248($29)
lw $11 -252($29)
lw $12 -256($29)
lw $13 -260($29)
lw $14 -264($29)
lw $15 -268($29)
lw $16 -272($29)
lw $17 -276($29)
lw $18 -280($29)
lw $19 -284($29)
lw $20 -288($29)
lw $21 -292($29)
lw $22 -296($29)
lw $23 -300($29)
lw $24 -304($29)
lw $25 -308($29)
lw $31 -312($29)
jr $31
nop
# if_false_9:
if_false_9:
# t43 = point;
# fetch t43 @ $8
# load point
lw $9 0($28)
# fetch point @ $9
addiu $8 $9 0
# save t43
sw $8 -104($29)
# t44 = sum[t43];
# load sum
addiu $8 $28 16
# fetch sum @ $8
# fetch t44 @ $10
# load t43
lw $11 -104($29)
# fetch t43 @ $11
sll $1 $11 2
addu $1 $1 $8
lw $10 0($1)
# save t44
sw $10 -108($29)
# t45 = 1 - t44;
# fetch t45 @ $10
addiu $1 $0 1
# load t44
lw $12 -108($29)
# fetch t44 @ $12
subu $10 $1 $12
# save t45
sw $10 -112($29)
# t46 = 1 - t45;
# fetch t46 @ $10
addiu $1 $0 1
# load t45
lw $13 -112($29)
# fetch t45 @ $13
subu $10 $1 $13
# save t46
sw $10 -116($29)
# t47 = 1 - t46;
# fetch t47 @ $10
addiu $1 $0 1
# load t46
lw $14 -116($29)
# fetch t46 @ $14
subu $10 $1 $14
# save t47
sw $10 -120($29)
# t48 = 1 - t47;
# fetch t48 @ $10
addiu $1 $0 1
# load t47
lw $15 -120($29)
# fetch t47 @ $15
subu $10 $1 $15
# save t48
sw $10 -124($29)
# t49 = 1 - t48;
# fetch t49 @ $10
addiu $1 $0 1
# save point
sw $9 0($28)
# load t48
lw $9 -124($29)
# fetch t48 @ $9
subu $10 $1 $9
# save t49
sw $10 -128($29)
# t50 = 1 - t49;
# fetch t50 @ $10
addiu $1 $0 1
# save sum
# load t49
lw $8 -128($29)
# fetch t49 @ $8
subu $10 $1 $8
# save t50
sw $10 -132($29)
# t51 = 1 - t50;
# fetch t51 @ $10
addiu $1 $0 1
# save t43
sw $11 -104($29)
# load t50
lw $11 -132($29)
# fetch t50 @ $11
subu $10 $1 $11
# save t51
sw $10 -136($29)
# t52 = 1 - t51;
# fetch t52 @ $10
addiu $1 $0 1
# save t44
sw $12 -108($29)
# load t51
lw $12 -136($29)
# fetch t51 @ $12
subu $10 $1 $12
# save t52
sw $10 -140($29)
# t53 = 1 - t52;
# fetch t53 @ $10
addiu $1 $0 1
# save t45
sw $13 -112($29)
# load t52
lw $13 -140($29)
# fetch t52 @ $13
subu $10 $1 $13
# save t53
sw $10 -144($29)
# t54 = 1 - t53;
# fetch t54 @ $10
addiu $1 $0 1
# save t46
sw $14 -116($29)
# load t53
lw $14 -144($29)
# fetch t53 @ $14
subu $10 $1 $14
# save t54
sw $10 -148($29)
# t55 = 1 - t54;
# fetch t55 @ $10
addiu $1 $0 1
# save t47
sw $15 -120($29)
# load t54
lw $15 -148($29)
# fetch t54 @ $15
subu $10 $1 $15
# save t55
sw $10 -152($29)
# t56 = 1 - t55;
# fetch t56 @ $10
addiu $1 $0 1
# save t48
sw $9 -124($29)
# load t55
lw $9 -152($29)
# fetch t55 @ $9
subu $10 $1 $9
# save t56
sw $10 -156($29)
# t57 = 1 - t56;
# fetch t57 @ $10
addiu $1 $0 1
# save t49
sw $8 -128($29)
# load t56
lw $8 -156($29)
# fetch t56 @ $8
subu $10 $1 $8
# save t57
sw $10 -160($29)
# t58 = 1 - t57;
# fetch t58 @ $10
addiu $1 $0 1
# save t50
sw $11 -132($29)
# load t57
lw $11 -160($29)
# fetch t57 @ $11
subu $10 $1 $11
# save t58
sw $10 -164($29)
# t59 = 1 - t58;
# fetch t59 @ $10
addiu $1 $0 1
# save t51
sw $12 -136($29)
# load t58
lw $12 -164($29)
# fetch t58 @ $12
subu $10 $1 $12
# save t59
sw $10 -168($29)
# t60 = 1 - t59;
# fetch t60 @ $10
addiu $1 $0 1
# save t52
sw $13 -140($29)
# load t59
lw $13 -168($29)
# fetch t59 @ $13
subu $10 $1 $13
# save t60
sw $10 -172($29)
# t61 = 1 - t60;
# fetch t61 @ $10
addiu $1 $0 1
# save t53
sw $14 -144($29)
# load t60
lw $14 -172($29)
# fetch t60 @ $14
subu $10 $1 $14
# save t61
sw $10 -176($29)
# t62 = 1 - t61;
# fetch t62 @ $10
addiu $1 $0 1
# save t54
sw $15 -148($29)
# load t61
lw $15 -176($29)
# fetch t61 @ $15
subu $10 $1 $15
# save t62
sw $10 -180($29)
# t63 = 1 - t62;
# fetch t63 @ $10
addiu $1 $0 1
# save t55
sw $9 -152($29)
# load t62
lw $9 -180($29)
# fetch t62 @ $9
subu $10 $1 $9
# save t63
sw $10 -184($29)
# t64 = 1 - t63;
# fetch t64 @ $10
addiu $1 $0 1
# save t56
sw $8 -156($29)
# load t63
lw $8 -184($29)
# fetch t63 @ $8
subu $10 $1 $8
# save t64
sw $10 -188($29)
# t65 = 1 - t64;
# fetch t65 @ $10
addiu $1 $0 1
# save t57
sw $11 -160($29)
# load t64
lw $11 -188($29)
# fetch t64 @ $11
subu $10 $1 $11
# save t65
sw $10 -192($29)
# t66 = 1 - t65;
# fetch t66 @ $10
addiu $1 $0 1
# save t58
sw $12 -164($29)
# load t65
lw $12 -192($29)
# fetch t65 @ $12
subu $10 $1 $12
# save t66
sw $10 -196($29)
# t67 = 1 - t66;
# fetch t67 @ $10
addiu $1 $0 1
# save t59
sw $13 -168($29)
# load t66
lw $13 -196($29)
# fetch t66 @ $13
subu $10 $1 $13
# save t67
sw $10 -200($29)
# t68 = 1 - t67;
# fetch t68 @ $10
addiu $1 $0 1
# save t60
sw $14 -172($29)
# load t67
lw $14 -200($29)
# fetch t67 @ $14
subu $10 $1 $14
# save t68
sw $10 -204($29)
# t69 = 1 - t68;
# fetch t69 @ $10
addiu $1 $0 1
# save t61
sw $15 -176($29)
# load t68
lw $15 -204($29)
# fetch t68 @ $15
subu $10 $1 $15
# save t69
sw $10 -208($29)
# t70 = 1 - t69;
# fetch t70 @ $10
addiu $1 $0 1
# save t62
sw $9 -180($29)
# load t69
lw $9 -208($29)
# fetch t69 @ $9
subu $10 $1 $9
# save t70
sw $10 -212($29)
# t71 = 1 - t70;
# fetch t71 @ $10
addiu $1 $0 1
# save t63
sw $8 -184($29)
# load t70
lw $8 -212($29)
# fetch t70 @ $8
subu $10 $1 $8
# save t71
sw $10 -216($29)
# t72 = 1 - t71;
# fetch t72 @ $10
addiu $1 $0 1
# save t64
sw $11 -188($29)
# load t71
lw $11 -216($29)
# fetch t71 @ $11
subu $10 $1 $11
# save t72
sw $10 -220($29)
# t73 = 1 - t72;
# fetch t73 @ $10
addiu $1 $0 1
# save t65
sw $12 -192($29)
# load t72
lw $12 -220($29)
# fetch t72 @ $12
subu $10 $1 $12
# save t73
sw $10 -224($29)
# t74 = 1 - t73;
# fetch t74 @ $10
addiu $1 $0 1
# save t66
sw $13 -196($29)
# load t73
lw $13 -224($29)
# fetch t73 @ $13
subu $10 $1 $13
# save t74
sw $10 -228($29)
# RET t74;
# load t74
lw $10 -228($29)
# fetch t74 @ $10
sw $10 -4($29)
lw $8 -240($29)
lw $9 -244($29)
lw $10 -248($29)
lw $11 -252($29)
lw $12 -256($29)
lw $13 -260($29)
lw $14 -264($29)
lw $15 -268($29)
lw $16 -272($29)
lw $17 -276($29)
lw $18 -280($29)
lw $19 -284($29)
lw $20 -288($29)
lw $21 -292($29)
lw $22 -296($29)
lw $23 -300($29)
lw $24 -304($29)
lw $25 -308($29)
lw $31 -312($29)
jr $31
nop
# EPILOG;
lw $8 -240($29)
lw $9 -244($29)
lw $10 -248($29)
lw $11 -252($29)
lw $12 -256($29)
lw $13 -260($29)
lw $14 -264($29)
lw $15 -268($29)
lw $16 -272($29)
lw $17 -276($29)
lw $18 -280($29)
lw $19 -284($29)
lw $20 -288($29)
lw $21 -292($29)
lw $22 -296($29)
lw $23 -300($29)
lw $24 -304($29)
lw $25 -308($29)
lw $31 -312($29)
jr $31
nop
__exit__:
addiu $2 $0 10
syscall
