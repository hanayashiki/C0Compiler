.data
const_str_4: .asciiz "This is supposed to convert your capital letter into lowercase letter. "
.text
j main_0
nop
# main_0:
main_0:
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
# _ = 0;
# fetch _ @ $8
addiu $8 $0 0
# save _
sw $8 -8($29)
# GOTO for_block_3;
j for_block_3
nop
# for_condition_1:
for_condition_1:
# if == 0 go to: 1 for_end_2;
# for_block_3:
for_block_3:
# PRINT_STR const_str_4;
addiu $2 $0 4
la $4 const_str_4
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# READ_CHAR input_char;
addiu $2 $0 12
syscall
# fetch input_char @ $8
addiu $8 $2 0
# save input_char
sb $8 -9($29)
# t0 = input_char >= 'A';
# fetch t0 @ $8
# load input_char
lb $9 -9($29)
# fetch input_char @ $9
addiu $1 $0 -842150451
slti $1 $9 65
xori $8 $1 1
# save t0
sw $8 -16($29)
# if == 0 go to: t0 if_false_5;
# load t0
lw $8 -16($29)
# fetch t0 @ $8
beq $8 $0 if_false_5
nop
# t1 = input_char <= 'Z';
# fetch t1 @ $10
# load input_char
lb $9 -9($29)
# fetch input_char @ $9
addiu $1 $0 -842150451
addiu $1 $9 -1
slti $10 $1 90
# save t1
sw $10 -20($29)
# if == 0 go to: t1 if_false_7;
# load t1
lw $10 -20($29)
# fetch t1 @ $10
beq $10 $0 if_false_7
nop
# t6 = (int)input_char;
# fetch t6 @ $11
# load input_char
lb $9 -9($29)
# fetch input_char @ $9
addiu $11 $9 0
# save t6
sw $11 -28($29)
# t5 = t6 - -32;
# fetch t5 @ $11
# load t6
lw $12 -28($29)
# fetch t6 @ $12
addiu $1 $0 -32
subu $11 $12 $1
# save t5
sw $11 -24($29)
# t7 = (char)t5;
# fetch t7 @ $11
# load t5
lw $13 -24($29)
# fetch t5 @ $13
addiu $11 $13 0
# save t7
sb $11 -29($29)
# output_char = t7;
# fetch output_char @ $11
# load t7
lb $14 -29($29)
# fetch t7 @ $14
addiu $11 $14 0
# save output_char
sb $11 -10($29)
# PRINT_CHAR output_char;
addiu $2 $0 11
# load output_char
lb $11 -10($29)
# fetch output_char @ $11
addiu $4 $11 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO if_end_8;
j if_end_8
nop
# if_false_7:
if_false_7:
# PRINT_CHAR input_char;
addiu $2 $0 11
# load input_char
lb $8 -9($29)
# fetch input_char @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# if_end_8:
if_end_8:
# GOTO if_end_6;
j if_end_6
nop
# if_false_5:
if_false_5:
# if_end_6:
if_end_6:
# _ = _ + 1;
# fetch _ @ $8
# load _
lw $8 -8($29)
# fetch _ @ $8
addiu $8 $8 1
# save _
sw $8 -8($29)
# GOTO for_condition_1;
j for_condition_1
nop
# for_end_2:
for_end_2:
# EPILOG;
j __exit__
nop
__exit__:
addiu $2 $0 10
syscall
