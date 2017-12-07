.data
const_str_3: .asciiz "This fuckin result is: "
.text
j main_2
nop
# fact_0:
fact_0:
# PROLOG fact;
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
sw $31 -96($29)
# if != go to: n 0 if_false_1;
lw $8 -8($29)
addiu $1 $0 0
bne $8 $1 if_false_1
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
lw $31 -96($29)
jr $31
nop
# if_false_1:
if_false_1:
# t2 = n - 1;
addiu $1 $0 1
subu $9 $8 $1
# PUSH t2;
sw $9 -104($29)
addiu $29 $29 -96
# CALL fact;
jal fact_0
nop
addiu $29 $29 96
# GET t0;
lw $10 -100($29)
# t3 = n * t0;
mul $11 $8 $10
# RET t3;
sw $11 -4($29)
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
lw $31 -96($29)
jr $31
nop
# main_2:
main_2:
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
sw $31 -80($29)
# PRINT_STR const_str_3;
addiu $2 $0 4
la $4 const_str_3
syscall
# PUSH 5;
addiu $1 $0 5
sw $1 -88($29)
addiu $29 $29 -80
# CALL fact;
jal fact_0
nop
addiu $29 $29 80
# GET t4;
lw $8 -84($29)
# PRINT_INT t4;
addiu $2 $0 1
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
