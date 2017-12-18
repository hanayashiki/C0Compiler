.data
const_str_7: .asciiz "this is supposed to get 6 a's. "
.text
j main_6
nop
# get_a_4_3:
get_a_4_3:
# PROLOG get_a_4;
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
# RET 'a';
addiu $1 $0 97
sw $1 -4($29)
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
# get_a_3_2:
get_a_3_2:
# PROLOG get_a_3;
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
# RET 97;
addiu $1 $0 97
sw $1 -4($29)
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
# pass_a_1_4:
pass_a_1_4:
# PROLOG pass_a_1;
sw $8 -16($29)
sw $9 -20($29)
sw $10 -24($29)
sw $11 -28($29)
sw $12 -32($29)
sw $13 -36($29)
sw $14 -40($29)
sw $15 -44($29)
sw $16 -48($29)
sw $17 -52($29)
sw $18 -56($29)
sw $19 -60($29)
sw $20 -64($29)
sw $21 -68($29)
sw $22 -72($29)
sw $23 -76($29)
sw $24 -80($29)
sw $25 -84($29)
sw $31 -88($29)
# t0 = (char)a;
# fetch t0 @ $8
# load a
lw $9 -8($29)
# fetch a @ $9
addiu $8 $9 0
# save t0
sb $8 -10($29)
# cast_char = t0;
# fetch cast_char @ $8
# load t0
lb $10 -10($29)
# fetch t0 @ $10
addiu $8 $10 0
# save cast_char
sb $8 -9($29)
# PRINT_CHAR cast_char;
addiu $2 $0 11
# load cast_char
lb $8 -9($29)
# fetch cast_char @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# EPILOG;
lw $8 -16($29)
lw $9 -20($29)
lw $10 -24($29)
lw $11 -28($29)
lw $12 -32($29)
lw $13 -36($29)
lw $14 -40($29)
lw $15 -44($29)
lw $16 -48($29)
lw $17 -52($29)
lw $18 -56($29)
lw $19 -60($29)
lw $20 -64($29)
lw $21 -68($29)
lw $22 -72($29)
lw $23 -76($29)
lw $24 -80($29)
lw $25 -84($29)
lw $31 -88($29)
jr $31
nop
# get_a_2_1:
get_a_2_1:
# PROLOG get_a_2;
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
# RET 97;
addiu $1 $0 97
sw $1 -4($29)
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
# get_a_1_0:
get_a_1_0:
# PROLOG get_a_1;
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
# RET 'a';
addiu $1 $0 97
sw $1 -4($29)
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
# pass_a_2_5:
pass_a_2_5:
# PROLOG pass_a_2;
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
# PRINT_CHAR a;
addiu $2 $0 11
# load a
lb $8 -5($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
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
# main_6:
main_6:
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
# PRINT_STR const_str_7;
addiu $2 $0 4
la $4 const_str_7
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# CALL get_a_1;
addiu $29 $29 -100
jal get_a_1_0
nop
addiu $29 $29 100
# GET t1;
# fetch t1 @ $8
# load %pass_val
lw $9 -104($29)
# fetch %pass_val @ $9
addiu $8 $9 0
# save t1
sb $8 -6($29)
# PRINT_CHAR t1;
addiu $2 $0 11
# load t1
lb $8 -6($29)
# fetch t1 @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# CALL get_a_2;
addiu $29 $29 -100
jal get_a_2_1
nop
addiu $29 $29 100
# GET t2;
# fetch t2 @ $9
# load %pass_val
lw $10 -104($29)
# fetch %pass_val @ $10
addiu $9 $10 0
# save t2
sb $9 -7($29)
# PRINT_CHAR t2;
addiu $2 $0 11
# load t2
lb $9 -7($29)
# fetch t2 @ $9
addiu $4 $9 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# CALL get_a_3;
addiu $29 $29 -100
jal get_a_3_2
nop
addiu $29 $29 100
# GET t3;
# fetch t3 @ $10
# load %pass_val
lw $11 -104($29)
# fetch %pass_val @ $11
addiu $10 $11 0
# save t3
sw $10 -12($29)
# t4 = (char)t3;
# fetch t4 @ $10
# load t3
lw $11 -12($29)
# fetch t3 @ $11
addiu $10 $11 0
# save t4
sb $10 -13($29)
# ch = t4;
# fetch ch @ $10
# load t4
lb $12 -13($29)
# fetch t4 @ $12
addiu $10 $12 0
# save ch
sb $10 -5($29)
# PRINT_CHAR ch;
addiu $2 $0 11
# load ch
lb $10 -5($29)
# fetch ch @ $10
addiu $4 $10 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# CALL get_a_4;
addiu $29 $29 -100
jal get_a_4_3
nop
addiu $29 $29 100
# GET t5;
# fetch t5 @ $13
# load %pass_val
lw $14 -104($29)
# fetch %pass_val @ $14
addiu $13 $14 0
# save t5
sw $13 -20($29)
# t6 = (char)t5;
# fetch t6 @ $13
# load t5
lw $14 -20($29)
# fetch t5 @ $14
addiu $13 $14 0
# save t6
sb $13 -21($29)
# ch = t6;
# fetch ch @ $10
# load t6
lb $13 -21($29)
# fetch t6 @ $13
addiu $10 $13 0
# save ch
sb $10 -5($29)
# PRINT_CHAR ch;
addiu $2 $0 11
# load ch
lb $10 -5($29)
# fetch ch @ $10
addiu $4 $10 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PUSH 97;
addiu $1 $0 97
sw $1 -108($29)
# CALL pass_a_1;
addiu $29 $29 -100
jal pass_a_1_4
nop
addiu $29 $29 100
# t8 = 'a';
# fetch t8 @ $15
addiu $15 $0 97
# save t8
sw $15 0($29)
# PUSH t8;
# load t8
lw $15 0($29)
# fetch t8 @ $15
sw $15 -108($29)
# CALL pass_a_1;
addiu $29 $29 -100
jal pass_a_1_4
nop
addiu $29 $29 100
# PUSH ch;
# load ch
lb $10 -5($29)
# fetch ch @ $10
sb $10 -105($29)
# CALL pass_a_2;
addiu $29 $29 -100
jal pass_a_2_5
nop
addiu $29 $29 100
# EPILOG;
j __exit__
nop
__exit__:
addiu $2 $0 10
syscall
