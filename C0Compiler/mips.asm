.data
const_str_3: .asciiz "c==1?"
const_str_4: .asciiz "ch==1?"
const_str_6: .asciiz "c=0?"
const_str_8: .asciiz "Enter 5 numbers ranging from 0 - 3,"
const_str_9: .asciiz "and this is supposed to find one of the digit that appears more than once."
const_str_15: .asciiz "Number limit exceeded"
const_str_18: .asciiz "Number limit exceeded"
const_str_29: .asciiz "repeated: "
const_str_31: .asciiz "a=%d "
const_str_32: .asciiz "a=%d "
const_str_33: .asciiz "a=%d "
const_str_34: .asciiz "a=%d "
const_str_35: .asciiz "a=%d "
const_str_36: .asciiz "a=%d "
const_str_37: .asciiz "a=%d "
const_str_38: .asciiz "a=%d "
const_str_39: .asciiz "a=%d "
const_str_40: .asciiz "a=33?%d "
const_str_43: .asciiz "Unexpected 1. "
const_str_45: .asciiz "Unexpected 2. "
const_str_47: .asciiz "default pass"
const_str_48: .asciiz "test_char=0?%d"
const_str_51: .asciiz "constant '==' passed"
const_str_52: .asciiz "wrong constant '=='"
const_str_55: .asciiz "Unexpected 3. "
const_str_56: .asciiz "if right const passed"
const_str_59: .asciiz "if left const passed"
const_str_60: .asciiz "Unexpected 4. "
const_str_63: .asciiz "if not equal passed"
const_str_64: .asciiz "Unexpected 5. "
const_str_67: .asciiz "if equal passed"
const_str_68: .asciiz "Unexpected 5. "
const_str_71: .asciiz "if precompute passed"
const_str_72: .asciiz "Unexpected 5. "
const_str_73: .asciiz "a=33, b=2, c=3"
const_str_74: .asciiz "temp=35?"
const_str_75: .asciiz "temp=31?"
const_str_76: .asciiz "temp=11?"
const_str_77: .asciiz "temp=99?"
const_str_78: .asciiz "temp=-33?"
const_str_79: .asciiz "arr[33]=233? "
const_str_80: .asciiz "local_arr[3]=233? "
.text
j main_30
nop
# return_256_1:
return_256_1:
# PROLOG return_256;
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
# RET 256;
addiu $1 $0 256
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
# push_const_test_2:
push_const_test_2:
# PROLOG push_const_test;
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
# PRINT_STR const_str_3;
addiu $2 $0 4
la $4 const_str_3
syscall
# PRINT_INT c;
addiu $2 $0 1
# load c
lw $8 -8($29)
# fetch c @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_4;
addiu $2 $0 4
la $4 const_str_4
syscall
# PRINT_INT c;
addiu $2 $0 1
# load c
lw $8 -8($29)
# fetch c @ $8
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
# write_global_arr_0:
write_global_arr_0:
# PROLOG write_global_arr;
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
# %t0 = idx;
# fetch %t0 @ $8
# load idx
lw $9 -8($29)
# fetch idx @ $9
addiu $8 $9 0
# save %t0
sw $8 -12($29)
# %t1 = 233;
# fetch %t1 @ $8
addiu $8 $0 233
# save %t1
sw $8 -16($29)
# arr[%t0] = %t1;
# load arr
addiu $8 $28 4
# fetch arr @ $8
# load %t1
lw $10 -16($29)
# fetch %t1 @ $10
# load %t0
lw $11 -12($29)
# fetch %t0 @ $11
sll $1 $11 2
addu $1 $1 $8
sw $10 0($1)
# save arr
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
# param_test_256_5:
param_test_256_5:
# PROLOG param_test_256;
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
# PRINT_STR const_str_6;
addiu $2 $0 4
la $4 const_str_6
syscall
# %t3 = (int)c;
# fetch %t3 @ $8
# load c
lb $9 -5($29)
# fetch c @ $9
addiu $8 $9 0
# save %t3
sw $8 -16($29)
# %t2 = %t3 + 0;
# fetch %t2 @ $8
# load %t3
lw $10 -16($29)
# fetch %t3 @ $10
addiu $8 $10 0
# save %t2
sw $8 -12($29)
# PRINT_INT %t2;
addiu $2 $0 1
# load %t2
lw $8 -12($29)
# fetch %t2 @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
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
# find_any_duplicate_7:
find_any_duplicate_7:
# PROLOG find_any_duplicate;
sw $8 -100($29)
sw $9 -104($29)
sw $10 -108($29)
sw $11 -112($29)
sw $12 -116($29)
sw $13 -120($29)
sw $14 -124($29)
sw $15 -128($29)
sw $16 -132($29)
sw $17 -136($29)
sw $18 -140($29)
sw $19 -144($29)
sw $20 -148($29)
sw $21 -152($29)
sw $22 -156($29)
sw $23 -160($29)
sw $24 -164($29)
sw $25 -168($29)
sw $31 -172($29)
# PRINT_STR const_str_8;
addiu $2 $0 4
la $4 const_str_8
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_9;
addiu $2 $0 4
la $4 const_str_9
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# pp = 0;
# fetch pp @ $8
addiu $8 $0 0
# save pp
sw $8 0($28)
# GOTO for_block_12;
j for_block_12
nop
# for_condition_10:
for_condition_10:
# %t4 = pp < 5;
# fetch %t4 @ $8
# load pp
lw $9 0($28)
# fetch pp @ $9
addiu $1 $0 5
slti $8 $9 5
# save %t4
sw $8 -44($29)
# if == 0 go to: %t4 for_end_11;
# load %t4
lw $8 -44($29)
# fetch %t4 @ $8
beq $8 $0 for_end_11
nop
# for_block_12:
for_block_12:
# READ_INT tmp;
addiu $2 $0 5
syscall
# fetch tmp @ $8
addiu $8 $2 0
# save tmp
sw $8 -96($29)
# %t5 = tmp < 0;
# fetch %t5 @ $8
# load tmp
lw $9 -96($29)
# fetch tmp @ $9
addiu $1 $0 0
slti $8 $9 0
# save %t5
sw $8 -48($29)
# if == 0 go to: %t5 if_false_13;
# load %t5
lw $8 -48($29)
# fetch %t5 @ $8
beq $8 $0 if_false_13
nop
# PRINT_STR const_str_15;
addiu $2 $0 4
la $4 const_str_15
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# RET;
lw $8 -100($29)
lw $9 -104($29)
lw $10 -108($29)
lw $11 -112($29)
lw $12 -116($29)
lw $13 -120($29)
lw $14 -124($29)
lw $15 -128($29)
lw $16 -132($29)
lw $17 -136($29)
lw $18 -140($29)
lw $19 -144($29)
lw $20 -148($29)
lw $21 -152($29)
lw $22 -156($29)
lw $23 -160($29)
lw $24 -164($29)
lw $25 -168($29)
lw $31 -172($29)
jr $31
nop
# GOTO if_end_14;
j if_end_14
nop
# if_false_13:
if_false_13:
# if_end_14:
if_end_14:
# %t6 = tmp > 3;
# fetch %t6 @ $8
# load tmp
lw $9 -96($29)
# fetch tmp @ $9
addiu $1 $0 3
addiu $1 $0 3
slt $8 $1 $9
# save %t6
sw $8 -52($29)
# if == 0 go to: %t6 if_false_16;
# load %t6
lw $8 -52($29)
# fetch %t6 @ $8
beq $8 $0 if_false_16
nop
# PRINT_STR const_str_18;
addiu $2 $0 4
la $4 const_str_18
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# RET;
lw $8 -100($29)
lw $9 -104($29)
lw $10 -108($29)
lw $11 -112($29)
lw $12 -116($29)
lw $13 -120($29)
lw $14 -124($29)
lw $15 -128($29)
lw $16 -132($29)
lw $17 -136($29)
lw $18 -140($29)
lw $19 -144($29)
lw $20 -148($29)
lw $21 -152($29)
lw $22 -156($29)
lw $23 -160($29)
lw $24 -164($29)
lw $25 -168($29)
lw $31 -172($29)
jr $31
nop
# GOTO if_end_17;
j if_end_17
nop
# if_false_16:
if_false_16:
# if_end_17:
if_end_17:
# %t7 = pp;
# fetch %t7 @ $8
# load pp
lw $9 0($28)
# fetch pp @ $9
addiu $8 $9 0
# save %t7
sw $8 -56($29)
# %t8 = tmp;
# fetch %t8 @ $8
# load tmp
lw $10 -96($29)
# fetch tmp @ $10
addiu $8 $10 0
# save %t8
sw $8 -60($29)
# arr[%t7] = %t8;
# load arr
addiu $8 $29 -84
# fetch arr @ $8
# load %t8
lw $11 -60($29)
# fetch %t8 @ $11
# load %t7
lw $12 -56($29)
# fetch %t7 @ $12
sll $1 $12 2
addu $1 $1 $8
sw $11 0($1)
# save arr
# pp = pp + 1;
# fetch pp @ $9
# load pp
lw $9 0($28)
# fetch pp @ $9
addiu $9 $9 1
# save pp
sw $9 0($28)
# GOTO for_condition_10;
j for_condition_10
nop
# for_end_11:
for_end_11:
# fast = 4;
# fetch fast @ $8
addiu $8 $0 4
# save fast
sw $8 -88($29)
# slow = 4;
# fetch slow @ $8
addiu $8 $0 4
# save slow
sw $8 -92($29)
# pp = 0;
# fetch pp @ $8
addiu $8 $0 0
# save pp
sw $8 0($28)
# GOTO for_block_21;
j for_block_21
nop
# for_condition_19:
for_condition_19:
# if != go to: pp 0 for_end_20;
# load pp
lw $8 0($28)
# fetch pp @ $8
addiu $1 $0 0
bne $8 $1 for_end_20
nop
# for_block_21:
for_block_21:
# %t10 = fast;
# fetch %t10 @ $8
# load fast
lw $9 -88($29)
# fetch fast @ $9
addiu $8 $9 0
# save %t10
sw $8 -8($29)
# %t11 = arr[%t10];
# load arr
addiu $8 $29 -84
# fetch arr @ $8
# fetch %t11 @ $10
# load %t10
lw $11 -8($29)
# fetch %t10 @ $11
sll $1 $11 2
addu $1 $1 $8
lw $10 0($1)
# save %t11
sw $10 -12($29)
# %t9 = %t11;
# fetch %t9 @ $10
# load %t11
lw $12 -12($29)
# fetch %t11 @ $12
addiu $10 $12 0
# save %t9
sw $10 -64($29)
# %t12 = arr[%t9];
# load arr
addiu $8 $29 -84
# fetch arr @ $8
# fetch %t12 @ $10
# load %t9
lw $13 -64($29)
# fetch %t9 @ $13
sll $1 $13 2
addu $1 $1 $8
lw $10 0($1)
# save %t12
sw $10 -16($29)
# fast = %t12;
# fetch fast @ $9
# load %t12
lw $10 -16($29)
# fetch %t12 @ $10
addiu $9 $10 0
# save fast
sw $9 -88($29)
# %t13 = slow;
# fetch %t13 @ $9
# load slow
lw $14 -92($29)
# fetch slow @ $14
addiu $9 $14 0
# save %t13
sw $9 -20($29)
# %t14 = arr[%t13];
# load arr
addiu $8 $29 -84
# fetch arr @ $8
# fetch %t14 @ $9
# load %t13
lw $15 -20($29)
# fetch %t13 @ $15
sll $1 $15 2
addu $1 $1 $8
lw $9 0($1)
# save %t14
sw $9 -24($29)
# slow = %t14;
# fetch slow @ $14
# load %t14
lw $9 -24($29)
# fetch %t14 @ $9
addiu $14 $9 0
# save slow
sw $14 -92($29)
# pp = -1;
# fetch pp @ $14
addiu $14 $0 -1
# save pp
sw $14 0($28)
# if != go to: fast slow if_false_22;
# load fast
lw $14 -88($29)
# fetch fast @ $14
# save %t10
sw $11 -8($29)
# load slow
lw $11 -92($29)
# fetch slow @ $11
bne $14 $11 if_false_22
nop
# pp = 1;
# save %t11
sw $12 -12($29)
# fetch pp @ $12
addiu $12 $0 1
# save pp
sw $12 0($28)
# GOTO if_end_23;
j if_end_23
nop
# if_false_22:
if_false_22:
# if_end_23:
if_end_23:
# pp = pp + 1;
# fetch pp @ $8
# load pp
lw $8 0($28)
# fetch pp @ $8
addiu $8 $8 1
# save pp
sw $8 0($28)
# GOTO for_condition_19;
j for_condition_19
nop
# for_end_20:
for_end_20:
# slow = 4;
# fetch slow @ $8
addiu $8 $0 4
# save slow
sw $8 -92($29)
# pp = 0;
# fetch pp @ $8
addiu $8 $0 0
# save pp
sw $8 0($28)
# GOTO for_block_26;
j for_block_26
nop
# for_condition_24:
for_condition_24:
# if != go to: pp 0 for_end_25;
# load pp
lw $8 0($28)
# fetch pp @ $8
addiu $1 $0 0
bne $8 $1 for_end_25
nop
# for_block_26:
for_block_26:
# %t16 = fast;
# fetch %t16 @ $8
# load fast
lw $9 -88($29)
# fetch fast @ $9
addiu $8 $9 0
# save %t16
sw $8 -28($29)
# %t17 = arr[%t16];
# load arr
addiu $8 $29 -84
# fetch arr @ $8
# fetch %t17 @ $10
# load %t16
lw $11 -28($29)
# fetch %t16 @ $11
sll $1 $11 2
addu $1 $1 $8
lw $10 0($1)
# save %t17
sw $10 -32($29)
# fast = %t17;
# fetch fast @ $9
# load %t17
lw $10 -32($29)
# fetch %t17 @ $10
addiu $9 $10 0
# save fast
sw $9 -88($29)
# %t18 = slow;
# fetch %t18 @ $9
# load slow
lw $12 -92($29)
# fetch slow @ $12
addiu $9 $12 0
# save %t18
sw $9 -36($29)
# %t19 = arr[%t18];
# load arr
addiu $8 $29 -84
# fetch arr @ $8
# fetch %t19 @ $9
# load %t18
lw $13 -36($29)
# fetch %t18 @ $13
sll $1 $13 2
addu $1 $1 $8
lw $9 0($1)
# save %t19
sw $9 -40($29)
# slow = %t19;
# fetch slow @ $12
# load %t19
lw $9 -40($29)
# fetch %t19 @ $9
addiu $12 $9 0
# save slow
sw $12 -92($29)
# pp = -1;
# fetch pp @ $12
addiu $12 $0 -1
# save pp
sw $12 0($28)
# if != go to: fast slow if_false_27;
# load fast
lw $12 -88($29)
# fetch fast @ $12
# load slow
lw $14 -92($29)
# fetch slow @ $14
bne $12 $14 if_false_27
nop
# pp = 1;
# fetch pp @ $15
addiu $15 $0 1
# save pp
sw $15 0($28)
# GOTO if_end_28;
j if_end_28
nop
# if_false_27:
if_false_27:
# if_end_28:
if_end_28:
# pp = pp + 1;
# fetch pp @ $8
# load pp
lw $8 0($28)
# fetch pp @ $8
addiu $8 $8 1
# save pp
sw $8 0($28)
# GOTO for_condition_24;
j for_condition_24
nop
# for_end_25:
for_end_25:
# PRINT_STR const_str_29;
addiu $2 $0 4
la $4 const_str_29
syscall
# PRINT_INT slow;
addiu $2 $0 1
# load slow
lw $8 -92($29)
# fetch slow @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# EPILOG;
lw $8 -100($29)
lw $9 -104($29)
lw $10 -108($29)
lw $11 -112($29)
lw $12 -116($29)
lw $13 -120($29)
lw $14 -124($29)
lw $15 -128($29)
lw $16 -132($29)
lw $17 -136($29)
lw $18 -140($29)
lw $19 -144($29)
lw $20 -148($29)
lw $21 -152($29)
lw $22 -156($29)
lw $23 -160($29)
lw $24 -164($29)
lw $25 -168($29)
lw $31 -172($29)
jr $31
nop
# main_30:
main_30:
# PROLOG main;
sw $8 -188($29)
sw $9 -192($29)
sw $10 -196($29)
sw $11 -200($29)
sw $12 -204($29)
sw $13 -208($29)
sw $14 -212($29)
sw $15 -216($29)
sw $16 -220($29)
sw $17 -224($29)
sw $18 -228($29)
sw $19 -232($29)
sw $20 -236($29)
sw $21 -240($29)
sw $22 -244($29)
sw $23 -248($29)
sw $24 -252($29)
sw $25 -256($29)
sw $31 -260($29)
# a = 1;
# fetch a @ $8
addiu $8 $0 1
# save a
sw $8 -128($29)
# b = 2;
# fetch b @ $8
addiu $8 $0 2
# save b
sw $8 -132($29)
# c = 3;
# fetch c @ $8
addiu $8 $0 3
# save c
sw $8 -136($29)
# %t21 = 10 * b;
# fetch %t21 @ $8
# load b
lw $9 -132($29)
# fetch b @ $9
addiu $1 $0 10
mul $8 $9 $1
# save %t21
sw $8 -8($29)
# a = %t21;
# fetch a @ $8
# load %t21
lw $10 -8($29)
# fetch %t21 @ $10
addiu $8 $10 0
# save a
sw $8 -128($29)
# PRINT_STR const_str_31;
addiu $2 $0 4
la $4 const_str_31
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -128($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t22 = b * 10;
# fetch %t22 @ $11
# load b
lw $9 -132($29)
# fetch b @ $9
addiu $1 $0 10
mul $11 $9 $1
# save %t22
sw $11 -12($29)
# a = %t22;
# fetch a @ $8
# load %t22
lw $11 -12($29)
# fetch %t22 @ $11
addiu $8 $11 0
# save a
sw $8 -128($29)
# PRINT_STR const_str_32;
addiu $2 $0 4
la $4 const_str_32
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -128($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t23 = b / 2;
# fetch %t23 @ $12
# load b
lw $9 -132($29)
# fetch b @ $9
addiu $1 $0 2
div $9 $1
mflo $12
# save %t23
sw $12 -16($29)
# a = %t23;
# fetch a @ $8
# load %t23
lw $12 -16($29)
# fetch %t23 @ $12
addiu $8 $12 0
# save a
sw $8 -128($29)
# PRINT_STR const_str_33;
addiu $2 $0 4
la $4 const_str_33
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -128($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t24 = 100 / b;
# fetch %t24 @ $13
addiu $1 $0 100
# load b
lw $9 -132($29)
# fetch b @ $9
div $1 $9
mflo $13
# save %t24
sw $13 -20($29)
# a = %t24;
# fetch a @ $8
# load %t24
lw $13 -20($29)
# fetch %t24 @ $13
addiu $8 $13 0
# save a
sw $8 -128($29)
# PRINT_STR const_str_34;
addiu $2 $0 4
la $4 const_str_34
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -128($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t25 = 1 - b;
# fetch %t25 @ $14
addiu $1 $0 1
# load b
lw $9 -132($29)
# fetch b @ $9
subu $14 $1 $9
# save %t25
sw $14 -24($29)
# a = %t25;
# fetch a @ $8
# load %t25
lw $14 -24($29)
# fetch %t25 @ $14
addiu $8 $14 0
# save a
sw $8 -128($29)
# PRINT_STR const_str_35;
addiu $2 $0 4
la $4 const_str_35
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -128($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t26 = 1 + b;
# fetch %t26 @ $15
# load b
lw $9 -132($29)
# fetch b @ $9
addiu $15 $9 1
# save %t26
sw $15 -28($29)
# a = %t26;
# fetch a @ $8
# load %t26
lw $15 -28($29)
# fetch %t26 @ $15
addiu $8 $15 0
# save a
sw $8 -128($29)
# PRINT_STR const_str_36;
addiu $2 $0 4
la $4 const_str_36
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -128($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t27 = 97 + b;
# save %t21
sw $10 -8($29)
# fetch %t27 @ $10
# load b
lw $9 -132($29)
# fetch b @ $9
addiu $10 $9 97
# save %t27
sw $10 -32($29)
# a = %t27;
# fetch a @ $8
# load %t27
lw $10 -32($29)
# fetch %t27 @ $10
addiu $8 $10 0
# save a
sw $8 -128($29)
# PRINT_STR const_str_37;
addiu $2 $0 4
la $4 const_str_37
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -128($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t29 = 97 * b;
# save %t22
sw $11 -12($29)
# fetch %t29 @ $11
# load b
lw $9 -132($29)
# fetch b @ $9
addiu $1 $0 97
mul $11 $9 $1
# save %t29
sw $11 -36($29)
# a = %t29;
# fetch a @ $8
# load %t29
lw $11 -36($29)
# fetch %t29 @ $11
addiu $8 $11 0
# save a
sw $8 -128($29)
# PRINT_STR const_str_38;
addiu $2 $0 4
la $4 const_str_38
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -128($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t31 = 97 / b;
# save %t23
sw $12 -16($29)
# fetch %t31 @ $12
addiu $1 $0 97
# load b
lw $9 -132($29)
# fetch b @ $9
div $1 $9
mflo $12
# save %t31
sw $12 -40($29)
# a = %t31;
# fetch a @ $8
# load %t31
lw $12 -40($29)
# fetch %t31 @ $12
addiu $8 $12 0
# save a
sw $8 -128($29)
# PRINT_STR const_str_39;
addiu $2 $0 4
la $4 const_str_39
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -128($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t33 = 99 / c;
# save %t24
sw $13 -20($29)
# fetch %t33 @ $13
addiu $1 $0 99
# save %t25
sw $14 -24($29)
# load c
lw $14 -136($29)
# fetch c @ $14
div $1 $14
mflo $13
# save %t33
sw $13 -44($29)
# a = %t33;
# fetch a @ $8
# load %t33
lw $13 -44($29)
# fetch %t33 @ $13
addiu $8 $13 0
# save a
sw $8 -128($29)
# PRINT_STR const_str_40;
addiu $2 $0 4
la $4 const_str_40
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -128($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t35 = a == 0;
# save %t26
sw $15 -28($29)
# fetch %t35 @ $15
# load a
lw $8 -128($29)
# fetch a @ $8
xori $1 $8 0
sltiu $15 $1 1
# save %t35
sw $15 -48($29)
# if == 0 go to: %t35 case_end_42;
# load %t35
lw $15 -48($29)
# fetch %t35 @ $15
beq $15 $0 case_end_42
nop
# PRINT_STR const_str_43;
addiu $2 $0 4
la $4 const_str_43
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_41;
j switch_end_41
nop
# case_end_42:
case_end_42:
# %t36 = a == 1;
# fetch %t36 @ $8
# load a
lw $9 -128($29)
# fetch a @ $9
xori $1 $9 1
sltiu $8 $1 1
# save %t36
sw $8 -52($29)
# if == 0 go to: %t36 case_end_44;
# load %t36
lw $8 -52($29)
# fetch %t36 @ $8
beq $8 $0 case_end_44
nop
# PRINT_STR const_str_45;
addiu $2 $0 4
la $4 const_str_45
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_41;
j switch_end_41
nop
# case_end_44:
case_end_44:
# PRINT_STR const_str_47;
addiu $2 $0 4
la $4 const_str_47
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_41;
j switch_end_41
nop
# case_end_46:
case_end_46:
# switch_end_41:
switch_end_41:
# CALL return_256;
addiu $29 $29 -260
jal return_256_1
nop
addiu $29 $29 260
# GET %t37;
# fetch %t37 @ $8
# load %pass_val
lw $9 -264($29)
# fetch %pass_val @ $9
addiu $8 $9 0
# save %t37
sb $8 -53($29)
# %t39 = (int)%t37;
# fetch %t39 @ $8
# load %t37
lb $9 -53($29)
# fetch %t37 @ $9
addiu $8 $9 0
# save %t39
sw $8 -64($29)
# %t38 = %t39 + 48;
# fetch %t38 @ $8
# load %t39
lw $10 -64($29)
# fetch %t39 @ $10
addiu $8 $10 48
# save %t38
sw $8 -60($29)
# %t41 = (char)%t38;
# fetch %t41 @ $8
# load %t38
lw $11 -60($29)
# fetch %t38 @ $11
addiu $8 $11 0
# save %t41
sb $8 -65($29)
# test_char = %t41;
# fetch test_char @ $8
# load %t41
lb $12 -65($29)
# fetch %t41 @ $12
addiu $8 $12 0
# save test_char
sb $8 -181($29)
# PRINT_STR const_str_48;
addiu $2 $0 4
la $4 const_str_48
syscall
# PRINT_CHAR test_char;
addiu $2 $0 11
# load test_char
lb $8 -181($29)
# fetch test_char @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# CALL return_256;
addiu $29 $29 -260
jal return_256_1
nop
addiu $29 $29 260
# GET %t43;
# fetch %t43 @ $13
# load %pass_val
lw $14 -264($29)
# fetch %pass_val @ $14
addiu $13 $14 0
# save %t43
sb $13 -66($29)
# PUSH %t43;
# load %t43
lb $13 -66($29)
# fetch %t43 @ $13
sb $13 -265($29)
# CALL param_test_256;
addiu $29 $29 -260
jal param_test_256_5
nop
addiu $29 $29 260
# PUSH 1;
addiu $1 $0 1
sw $1 -268($29)
# %t45 = 1;
# fetch %t45 @ $14
addiu $14 $0 1
# save %t45
sb $14 0($29)
# PUSH %t45;
# load %t45
lb $14 0($29)
# fetch %t45 @ $14
sb $14 -269($29)
# CALL push_const_test;
addiu $29 $29 -260
jal push_const_test_2
nop
addiu $29 $29 260
# if != go to: 33 33 if_false_49;
# PRINT_STR const_str_51;
addiu $2 $0 4
la $4 const_str_51
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO if_end_50;
j if_end_50
nop
# if_false_49:
if_false_49:
# PRINT_STR const_str_52;
addiu $2 $0 4
la $4 const_str_52
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# if_end_50:
if_end_50:
# %t46 = a > 'a';
# fetch %t46 @ $8
# load a
lw $9 -128($29)
# fetch a @ $9
addiu $1 $0 97
addiu $1 $0 97
slt $8 $1 $9
# save %t46
sw $8 -72($29)
# if == 0 go to: %t46 if_false_53;
# load %t46
lw $8 -72($29)
# fetch %t46 @ $8
beq $8 $0 if_false_53
nop
# PRINT_STR const_str_55;
addiu $2 $0 4
la $4 const_str_55
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO if_end_54;
j if_end_54
nop
# if_false_53:
if_false_53:
# PRINT_STR const_str_56;
addiu $2 $0 4
la $4 const_str_56
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# if_end_54:
if_end_54:
# %t47 = 'a' > a;
# fetch %t47 @ $8
addiu $1 $0 97
# load a
lw $9 -128($29)
# fetch a @ $9
slt $8 $9 $1
# save %t47
sw $8 -76($29)
# if == 0 go to: %t47 if_false_57;
# load %t47
lw $8 -76($29)
# fetch %t47 @ $8
beq $8 $0 if_false_57
nop
# PRINT_STR const_str_59;
addiu $2 $0 4
la $4 const_str_59
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO if_end_58;
j if_end_58
nop
# if_false_57:
if_false_57:
# PRINT_STR const_str_60;
addiu $2 $0 4
la $4 const_str_60
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# if_end_58:
if_end_58:
# if == go to: 'a' a if_false_61;
addiu $1 $0 97
# load a
lw $8 -128($29)
# fetch a @ $8
beq $1 $8 if_false_61
nop
# PRINT_STR const_str_63;
addiu $2 $0 4
la $4 const_str_63
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO if_end_62;
j if_end_62
nop
# if_false_61:
if_false_61:
# PRINT_STR const_str_64;
addiu $2 $0 4
la $4 const_str_64
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# if_end_62:
if_end_62:
# if != go to: 33 a if_false_65;
addiu $1 $0 33
# load a
lw $8 -128($29)
# fetch a @ $8
bne $1 $8 if_false_65
nop
# PRINT_STR const_str_67;
addiu $2 $0 4
la $4 const_str_67
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO if_end_66;
j if_end_66
nop
# if_false_65:
if_false_65:
# PRINT_STR const_str_68;
addiu $2 $0 4
la $4 const_str_68
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# if_end_66:
if_end_66:
# %t49 = 256 > -114514;
# fetch %t49 @ $8
addiu $8 $0 1
# save %t49
sw $8 -80($29)
# if == 0 go to: %t49 if_false_69;
# load %t49
lw $8 -80($29)
# fetch %t49 @ $8
beq $8 $0 if_false_69
nop
# PRINT_STR const_str_71;
addiu $2 $0 4
la $4 const_str_71
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO if_end_70;
j if_end_70
nop
# if_false_69:
if_false_69:
# PRINT_STR const_str_72;
addiu $2 $0 4
la $4 const_str_72
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# if_end_70:
if_end_70:
# PRINT_STR const_str_73;
addiu $2 $0 4
la $4 const_str_73
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t50 = a + b;
# fetch %t50 @ $8
# load a
lw $9 -128($29)
# fetch a @ $9
# load b
lw $10 -132($29)
# fetch b @ $10
addu $8 $9 $10
# save %t50
sw $8 -84($29)
# temp = %t50;
# fetch temp @ $8
# load %t50
lw $11 -84($29)
# fetch %t50 @ $11
addiu $8 $11 0
# save temp
sw $8 -180($29)
# PRINT_STR const_str_74;
addiu $2 $0 4
la $4 const_str_74
syscall
# PRINT_INT temp;
addiu $2 $0 1
# load temp
lw $8 -180($29)
# fetch temp @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t51 = a - b;
# fetch %t51 @ $12
# load a
lw $9 -128($29)
# fetch a @ $9
# load b
lw $10 -132($29)
# fetch b @ $10
subu $12 $9 $10
# save %t51
sw $12 -88($29)
# temp = %t51;
# fetch temp @ $8
# load %t51
lw $12 -88($29)
# fetch %t51 @ $12
addiu $8 $12 0
# save temp
sw $8 -180($29)
# PRINT_STR const_str_75;
addiu $2 $0 4
la $4 const_str_75
syscall
# PRINT_INT temp;
addiu $2 $0 1
# load temp
lw $8 -180($29)
# fetch temp @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t52 = a / c;
# fetch %t52 @ $13
# load a
lw $9 -128($29)
# fetch a @ $9
# load c
lw $14 -136($29)
# fetch c @ $14
div $9 $14
mflo $13
# save %t52
sw $13 -92($29)
# temp = %t52;
# fetch temp @ $8
# load %t52
lw $13 -92($29)
# fetch %t52 @ $13
addiu $8 $13 0
# save temp
sw $8 -180($29)
# PRINT_STR const_str_76;
addiu $2 $0 4
la $4 const_str_76
syscall
# PRINT_INT temp;
addiu $2 $0 1
# load temp
lw $8 -180($29)
# fetch temp @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t53 = a * 3;
# fetch %t53 @ $15
# load a
lw $9 -128($29)
# fetch a @ $9
addiu $1 $0 3
mul $15 $9 $1
# save %t53
sw $15 -96($29)
# temp = %t53;
# fetch temp @ $8
# load %t53
lw $15 -96($29)
# fetch %t53 @ $15
addiu $8 $15 0
# save temp
sw $8 -180($29)
# PRINT_STR const_str_77;
addiu $2 $0 4
la $4 const_str_77
syscall
# PRINT_INT temp;
addiu $2 $0 1
# load temp
lw $8 -180($29)
# fetch temp @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t54 = -a;
# save %t50
sw $11 -84($29)
# fetch %t54 @ $11
# load a
lw $9 -128($29)
# fetch a @ $9
subu $11 $0 $9
# save %t54
sw $11 -100($29)
# temp = %t54;
# fetch temp @ $8
# load %t54
lw $11 -100($29)
# fetch %t54 @ $11
addiu $8 $11 0
# save temp
sw $8 -180($29)
# PRINT_STR const_str_78;
addiu $2 $0 4
la $4 const_str_78
syscall
# PRINT_INT temp;
addiu $2 $0 1
# load temp
lw $8 -180($29)
# fetch temp @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PUSH 33;
addiu $1 $0 33
sw $1 -268($29)
# CALL write_global_arr;
addiu $29 $29 -260
jal write_global_arr_0
nop
addiu $29 $29 260
# PRINT_STR const_str_79;
addiu $2 $0 4
la $4 const_str_79
syscall
# %t56 = 33;
# save %t51
sw $12 -88($29)
# fetch %t56 @ $12
addiu $12 $0 33
# save %t56
sw $12 -104($29)
# %t57 = arr[%t56];
# load arr
addiu $12 $28 4
# fetch arr @ $12
# save %t52
sw $13 -92($29)
# fetch %t57 @ $13
# save %t53
sw $15 -96($29)
# load %t56
lw $15 -104($29)
# fetch %t56 @ $15
sll $1 $15 2
addu $1 $1 $12
lw $13 0($1)
# save %t57
sw $13 -108($29)
# PRINT_INT %t57;
addiu $2 $0 1
# load %t57
lw $13 -108($29)
# fetch %t57 @ $13
addiu $4 $13 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t58 = 3;
# save %t54
sw $11 -100($29)
# fetch %t58 @ $11
addiu $11 $0 3
# save %t58
sw $11 -112($29)
# %t59 = 233;
# fetch %t59 @ $11
addiu $11 $0 233
# save %t59
sw $11 -116($29)
# local_arr[%t58] = %t59;
# load local_arr
addiu $11 $29 -176
# fetch local_arr @ $11
# save %t56
sw $15 -104($29)
# load %t59
lw $15 -116($29)
# fetch %t59 @ $15
# save %t57
sw $13 -108($29)
# load %t58
lw $13 -112($29)
# fetch %t58 @ $13
sll $1 $13 2
addu $1 $1 $11
sw $15 0($1)
# save local_arr
# PRINT_STR const_str_80;
addiu $2 $0 4
la $4 const_str_80
syscall
# %t60 = 3;
# fetch %t60 @ $11
addiu $11 $0 3
# save %t60
sw $11 -120($29)
# %t61 = local_arr[%t60];
# load local_arr
addiu $11 $29 -176
# fetch local_arr @ $11
# save %t58
sw $13 -112($29)
# fetch %t61 @ $13
# save %t59
sw $15 -116($29)
# load %t60
lw $15 -120($29)
# fetch %t60 @ $15
sll $1 $15 2
addu $1 $1 $11
lw $13 0($1)
# save %t61
sw $13 -124($29)
# PRINT_INT %t61;
addiu $2 $0 1
# load %t61
lw $13 -124($29)
# fetch %t61 @ $13
addiu $4 $13 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# CALL find_any_duplicate;
addiu $29 $29 -260
jal find_any_duplicate_7
nop
addiu $29 $29 260
# EPILOG;
j __exit__
nop
__exit__:
addiu $2 $0 10
syscall
