.data
const_str_26: .asciiz " "
.text
j main_22
nop
# quick_sort_0:
quick_sort_0:
# PROLOG quick_sort;
sw $8 -204($29)
sw $9 -208($29)
sw $10 -212($29)
sw $11 -216($29)
sw $12 -220($29)
sw $13 -224($29)
sw $14 -228($29)
sw $15 -232($29)
sw $16 -236($29)
sw $17 -240($29)
sw $18 -244($29)
sw $19 -248($29)
sw $20 -252($29)
sw $21 -256($29)
sw $22 -260($29)
sw $23 -264($29)
sw $24 -268($29)
sw $25 -272($29)
sw $31 -276($29)
# get param global: array_end
lw $23 -12($29)
# %t0 = array_head >= array_end;
# fetch %t0 @ $16 global
# load array_head
lw $8 -8($29)
# fetch array_head @ $8
# fetch array_end @ $23 global
slt $1 $8 $23
xori $16 $1 1
# if == 0 go to: %t0 if_false_1;
# fetch %t0 @ $16 global
beq $16 $0 if_false_1
nop
# RET;
lw $8 -204($29)
lw $9 -208($29)
lw $10 -212($29)
lw $11 -216($29)
lw $12 -220($29)
lw $13 -224($29)
lw $14 -228($29)
lw $15 -232($29)
lw $16 -236($29)
lw $17 -240($29)
lw $18 -244($29)
lw $19 -248($29)
lw $20 -252($29)
lw $21 -256($29)
lw $22 -260($29)
lw $23 -264($29)
lw $24 -268($29)
lw $25 -272($29)
lw $31 -276($29)
jr $31
nop
# GOTO if_end_2;
j if_end_2
nop
# if_false_1:
if_false_1:
# if_end_2:
if_end_2:
# flag = 0;
# fetch flag @ $20 global
addiu $20 $0 0
# j = array_end;
# fetch j @ $19 global
# fetch array_end @ $23 global
addiu $19 $23 0
# GOTO for_block_5;
j for_block_5
nop
# for_condition_3:
for_condition_3:
# if != go to: flag 0 for_end_4;
# fetch flag @ $20 global
addiu $1 $0 0
bne $20 $1 for_end_4
nop
# for_block_5:
for_block_5:
# %t2 = global_array[j];
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
# fetch %t2 @ $17 global
# fetch j @ $19 global
sll $1 $19 2
addu $1 $1 $8
lw $17 0($1)
# %t4 = global_array[array_head];
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
# fetch %t4 @ $18 global
# load array_head
lw $9 -8($29)
# fetch array_head @ $9
sll $1 $9 2
addu $1 $1 $8
lw $18 0($1)
# %t5 = %t2 < %t4;
# fetch %t5 @ $16 global
# fetch %t2 @ $17 global
# fetch %t4 @ $18 global
slt $16 $17 $18
# if == 0 go to: %t5 if_false_6;
# fetch %t5 @ $16 global
beq $16 $0 if_false_6
nop
# flag = 1;
# fetch flag @ $20 global
addiu $20 $0 1
# GOTO if_end_7;
j if_end_7
nop
# if_false_6:
if_false_6:
# if_end_7:
if_end_7:
# %t6 = j <= array_head;
# fetch %t6 @ $16 global
# fetch j @ $19 global
# load array_head
lw $8 -8($29)
# fetch array_head @ $8
addiu $1 $19 -1
slt $16 $1 $8
# if == 0 go to: %t6 if_false_8;
# fetch %t6 @ $16 global
beq $16 $0 if_false_8
nop
# flag = 1;
# fetch flag @ $20 global
addiu $20 $0 1
# GOTO if_end_9;
j if_end_9
nop
# if_false_8:
if_false_8:
# if_end_9:
if_end_9:
# j = j - 1;
# fetch j @ $19 global
# fetch j @ $19 global
addiu $1 $0 1
subu $19 $19 $1
# GOTO for_condition_3;
j for_condition_3
nop
# for_end_4:
for_end_4:
# j = j + 1;
# fetch j @ $19 global
# fetch j @ $19 global
addiu $19 $19 1
# i = array_head + 1;
# fetch i @ $18 global
# load array_head
lw $8 -8($29)
# fetch array_head @ $8
addiu $18 $8 1
# GOTO for_block_12;
j for_block_12
nop
# for_condition_10:
for_condition_10:
# %t9 = i <= j;
# fetch %t9 @ $16 global
# fetch i @ $18 global
# fetch j @ $19 global
addiu $1 $18 -1
slt $16 $1 $19
# if == 0 go to: %t9 for_end_11;
# fetch %t9 @ $16 global
beq $16 $0 for_end_11
nop
# for_block_12:
for_block_12:
# %t11 = global_array[i];
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
# fetch %t11 @ $16 global
# fetch i @ $18 global
sll $1 $18 2
addu $1 $1 $8
lw $16 0($1)
# %t13 = global_array[array_head];
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
# fetch %t13 @ $17 global
# load array_head
lw $9 -8($29)
# fetch array_head @ $9
sll $1 $9 2
addu $1 $1 $8
lw $17 0($1)
# %t14 = %t11 > %t13;
# fetch %t14 @ $20 global
# fetch %t11 @ $16 global
# fetch %t13 @ $17 global
slt $20 $17 $16
# if == 0 go to: %t14 if_false_13;
# fetch %t14 @ $20 global
beq $20 $0 if_false_13
nop
# %t22 = global_array[i];
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
# fetch %t22 @ $20 global
# fetch i @ $18 global
sll $1 $18 2
addu $1 $1 $8
lw $20 0($1)
# %t18 = global_array[j];
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
# fetch %t18 @ $17 global
# fetch j @ $19 global
sll $1 $19 2
addu $1 $1 $8
lw $17 0($1)
# global_array[i] = %t18;
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
# fetch %t18 @ $17 global
# fetch i @ $18 global
sll $1 $18 2
addu $1 $1 $8
sw $17 0($1)
# save global_array
# global_array[j] = %t22;
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
# fetch %t22 @ $20 global
# fetch j @ $19 global
sll $1 $19 2
addu $1 $1 $8
sw $20 0($1)
# save global_array
# flag#1 = 0;
# fetch flag#1 @ $16 global
addiu $16 $0 0
# j = array_end;
# fetch j @ $19 global
# fetch array_end @ $23 global
addiu $19 $23 0
# GOTO for_block_17;
j for_block_17
nop
# for_condition_15:
for_condition_15:
# if != go to: flag#1 0 for_end_16;
# fetch flag#1 @ $16 global
addiu $1 $0 0
bne $16 $1 for_end_16
nop
# for_block_17:
for_block_17:
# %t24 = global_array[j];
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
# fetch %t24 @ $17 global
# fetch j @ $19 global
sll $1 $19 2
addu $1 $1 $8
lw $17 0($1)
# %t26 = global_array[array_head];
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
# fetch %t26 @ $21 global
# load array_head
lw $9 -8($29)
# fetch array_head @ $9
sll $1 $9 2
addu $1 $1 $8
lw $21 0($1)
# %t27 = %t24 < %t26;
# fetch %t27 @ $20 global
# fetch %t24 @ $17 global
# fetch %t26 @ $21 global
slt $20 $17 $21
# if == 0 go to: %t27 if_false_18;
# fetch %t27 @ $20 global
beq $20 $0 if_false_18
nop
# flag#1 = 1;
# fetch flag#1 @ $16 global
addiu $16 $0 1
# GOTO if_end_19;
j if_end_19
nop
# if_false_18:
if_false_18:
# if_end_19:
if_end_19:
# %t28 = j <= array_head;
# fetch %t28 @ $17 global
# fetch j @ $19 global
# load array_head
lw $8 -8($29)
# fetch array_head @ $8
addiu $1 $19 -1
slt $17 $1 $8
# if == 0 go to: %t28 if_false_20;
# fetch %t28 @ $17 global
beq $17 $0 if_false_20
nop
# flag#1 = 1;
# fetch flag#1 @ $16 global
addiu $16 $0 1
# GOTO if_end_21;
j if_end_21
nop
# if_false_20:
if_false_20:
# if_end_21:
if_end_21:
# j = j - 1;
# fetch j @ $19 global
# fetch j @ $19 global
addiu $1 $0 1
subu $19 $19 $1
# GOTO for_condition_15;
j for_condition_15
nop
# for_end_16:
for_end_16:
# j = j + 1;
# fetch j @ $19 global
# fetch j @ $19 global
addiu $19 $19 1
# GOTO if_end_14;
j if_end_14
nop
# if_false_13:
if_false_13:
# if_end_14:
if_end_14:
# i = i + 1;
# fetch i @ $18 global
# fetch i @ $18 global
addiu $18 $18 1
# GOTO for_condition_10;
j for_condition_10
nop
# for_end_11:
for_end_11:
# %t31 = global_array[array_head];
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
# fetch %t31 @ $22 global
# load array_head
lw $9 -8($29)
# fetch array_head @ $9
sll $1 $9 2
addu $1 $1 $8
lw $22 0($1)
# %t33 = global_array[j];
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
# fetch %t33 @ $20 global
# fetch j @ $19 global
sll $1 $19 2
addu $1 $1 $8
lw $20 0($1)
# global_array[array_head] = %t33;
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
# fetch %t33 @ $20 global
# load array_head
lw $9 -8($29)
# fetch array_head @ $9
sll $1 $9 2
addu $1 $1 $8
sw $20 0($1)
# save global_array
# global_array[j] = %t31;
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
# fetch %t31 @ $22 global
# fetch j @ $19 global
sll $1 $19 2
addu $1 $1 $8
sw $22 0($1)
# save global_array
# PRINT_INT array_head;
addiu $2 $0 1
# load array_head
lw $9 -8($29)
# fetch array_head @ $9
addiu $4 $9 0
syscall
# %t38 = j - 1;
# fetch %t38 @ $21 global
# fetch j @ $19 global
addiu $1 $0 1
subu $21 $19 $1
# PRINT_INT %t38;
addiu $2 $0 1
# fetch %t38 @ $21 global
addiu $4 $21 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t39 = j + 1;
# fetch %t39 @ $17 global
# fetch j @ $19 global
addiu $17 $19 1
# PRINT_INT %t39;
addiu $2 $0 1
# fetch %t39 @ $17 global
addiu $4 $17 0
syscall
# PRINT_INT array_end;
addiu $2 $0 1
# fetch array_end @ $23 global
addiu $4 $23 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t42 = j - 1;
# fetch %t42 @ $16 global
# fetch j @ $19 global
addiu $1 $0 1
subu $16 $19 $1
# PUSH array_head;
# load array_head
lw $9 -8($29)
# fetch array_head @ $9
sw $9 -284($29)
# fetch %t42 @ $16 global
sw $16 -288($29)
# CALL quick_sort;
addiu $29 $29 -276
jal quick_sort_0
nop
addiu $29 $29 276
# %t44 = j + 1;
# fetch %t44 @ $16 global
# fetch j @ $19 global
addiu $16 $19 1
# PUSH %t44;
# fetch %t44 @ $16 global
sw $16 -284($29)
# fetch array_end @ $23 global
sw $23 -288($29)
# CALL quick_sort;
addiu $29 $29 -276
jal quick_sort_0
nop
addiu $29 $29 276
# EPILOG;
lw $8 -204($29)
lw $9 -208($29)
lw $10 -212($29)
lw $11 -216($29)
lw $12 -220($29)
lw $13 -224($29)
lw $14 -228($29)
lw $15 -232($29)
lw $16 -236($29)
lw $17 -240($29)
lw $18 -244($29)
lw $19 -248($29)
lw $20 -252($29)
lw $21 -256($29)
lw $22 -260($29)
lw $23 -264($29)
lw $24 -268($29)
lw $25 -272($29)
lw $31 -276($29)
jr $31
nop
# main_22:
main_22:
# PROLOG main;
sw $8 -104($29)
sw $9 -108($29)
sw $10 -112($29)
sw $11 -116($29)
sw $12 -120($29)
sw $13 -124($29)
sw $14 -128($29)
sw $15 -132($29)
sw $16 -136($29)
sw $17 -140($29)
sw $18 -144($29)
sw $19 -148($29)
sw $20 -152($29)
sw $21 -156($29)
sw $22 -160($29)
sw $23 -164($29)
sw $24 -168($29)
sw $25 -172($29)
sw $31 -176($29)
# global_array[0] = 6;
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
addiu $9 $0 6
# fetch 6 @ $9
sw $9 0($8)
# save global_array
# global_array[1] = 5;
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
addiu $10 $0 5
# fetch 5 @ $10
sw $10 4($8)
# save global_array
# global_array[2] = 4;
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
addiu $11 $0 4
# fetch 4 @ $11
sw $11 8($8)
# save global_array
# global_array[3] = 3;
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
addiu $12 $0 3
# fetch 3 @ $12
sw $12 12($8)
# save global_array
# global_array[4] = 2;
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
addiu $13 $0 2
# fetch 2 @ $13
sw $13 16($8)
# save global_array
# global_array[5] = 1;
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
addiu $14 $0 1
# fetch 1 @ $14
sw $14 20($8)
# save global_array
# global_array[6] = 6;
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
addiu $15 $0 6
# fetch 6 @ $15
sw $15 24($8)
# save global_array
# global_array[7] = 5;
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
addiu $14 $0 5
# fetch 5 @ $14
sw $14 28($8)
# save global_array
# global_array[8] = 4;
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
addiu $13 $0 4
# fetch 4 @ $13
sw $13 32($8)
# save global_array
# global_array[9] = 3;
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
addiu $11 $0 3
# fetch 3 @ $11
sw $11 36($8)
# save global_array
# PUSH 0;
addiu $1 $0 0
sw $1 -184($29)
addiu $1 $0 9
sw $1 -188($29)
# CALL quick_sort;
addiu $29 $29 -176
jal quick_sort_0
nop
addiu $29 $29 176
# i = 0;
# fetch i @ $16 global
addiu $16 $0 0
# GOTO for_block_25;
j for_block_25
nop
# for_condition_23:
for_condition_23:
# %t68 = i < 10;
# fetch %t68 @ $17 global
# fetch i @ $16 global
addiu $1 $0 10
slti $17 $16 10
# if == 0 go to: %t68 for_end_24;
# fetch %t68 @ $17 global
beq $17 $0 for_end_24
nop
# for_block_25:
for_block_25:
# %t70 = global_array[i];
# load global_array
addiu $8 $28 0
# fetch global_array @ $8
# fetch %t70 @ $17 global
# fetch i @ $16 global
sll $1 $16 2
addu $1 $1 $8
lw $17 0($1)
# PRINT_INT %t70;
addiu $2 $0 1
# fetch %t70 @ $17 global
addiu $4 $17 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_26;
addiu $2 $0 4
la $4 const_str_26
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# i = i + 1;
# fetch i @ $16 global
# fetch i @ $16 global
addiu $16 $16 1
# GOTO for_condition_23;
j for_condition_23
nop
# for_end_24:
for_end_24:
# EPILOG;
j __exit__
nop
__exit__:
addiu $2 $0 10
syscall
