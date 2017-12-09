.data
const_str_4: .asciiz "This is supposed to map a:1 b:2 c:3 else:0"
.text
j main_0
nop
# main_0:
main_0:
# PROLOG main;
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
# READ_CHAR c;
addiu $2 $0 12
syscall
# fetch c @ $8
addiu $8 $2 0
# save c
sb $8 -9($29)
# t0 = c == 'a';
# fetch t0 @ $8
# load c
lb $9 -9($29)
# fetch c @ $9
xori $1 $9 97
sltiu $8 $1 1
# save t0
sw $8 -16($29)
# if == 0 go to: t0 case_end_6;
# load t0
lw $8 -16($29)
# fetch t0 @ $8
beq $8 $0 case_end_6
nop
# PRINT_INT 1;
addiu $2 $0 1
addiu $4 $0 1
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_5;
j switch_end_5
nop
# case_end_6:
case_end_6:
# t1 = c == 'b';
# fetch t1 @ $8
# load c
lb $9 -9($29)
# fetch c @ $9
xori $1 $9 98
sltiu $8 $1 1
# save t1
sw $8 -20($29)
# if == 0 go to: t1 case_end_7;
# load t1
lw $8 -20($29)
# fetch t1 @ $8
beq $8 $0 case_end_7
nop
# PRINT_INT 2;
addiu $2 $0 1
addiu $4 $0 2
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_5;
j switch_end_5
nop
# case_end_7:
case_end_7:
# t2 = c == 'c';
# fetch t2 @ $8
# load c
lb $9 -9($29)
# fetch c @ $9
xori $1 $9 99
sltiu $8 $1 1
# save t2
sw $8 -24($29)
# if == 0 go to: t2 case_end_8;
# load t2
lw $8 -24($29)
# fetch t2 @ $8
beq $8 $0 case_end_8
nop
# PRINT_INT 3;
addiu $2 $0 1
addiu $4 $0 3
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_5;
j switch_end_5
nop
# case_end_8:
case_end_8:
# switch_end_5:
switch_end_5:
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
