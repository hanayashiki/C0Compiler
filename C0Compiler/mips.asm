# main_0:
main_0:
# PROLOG main;
# i = 0;
addiu $8 $0 0
# GOTO for_block_3;
j for_block_3
# for_condition_1:
for_condition_1:
# if == go to: i 100 for_end_2;
addiu $1 $0 100
beq $8 $1 for_end_2
# for_block_3:
for_block_3:
# t0 = i;
addiu $9 $8 0
# t1 = i;
addiu $10 $8 0
# arr[t0] = t1;
addiu $11 $29 -400
sll $1 $9 2
addu $1 $1 $11
sw $10 0($1)
# t2 = i;
addiu $12 $8 0
# t3 = arr[t2];
sll $1 $12 2
addu $1 $1 $11
lw $13 0($1)
# PRINT_INT t3;
addiu $2 $0 1
addiu $4 $13 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# i = i + 1;
addiu $8 $8 1
# GOTO for_condition_1;
j for_condition_1
# for_end_2:
for_end_2:
