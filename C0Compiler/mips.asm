.data
const_str_7: .asciiz "printf_test:start"
const_str_8: .asciiz "a,next line the same print:"
const_str_9: .asciiz "ch,next line the same print:"
const_str_10: .asciiz "a+1:"
const_str_11: .asciiz "t[0]:"
const_str_12: .asciiz "printf_test:finished"
const_str_14: .asciiz "scanf_test:start"
const_str_15: .asciiz "a:"
const_str_16: .asciiz "ch:"
const_str_17: .asciiz "a:"
const_str_18: .asciiz "ch:"
const_str_19: .asciiz "t[0]:"
const_str_20: .asciiz "scanf_test:finished"
const_str_22: .asciiz "same_name_test:start"
const_str_23: .asciiz "_tan local:"
const_str_24: .asciiz "same_name_test:finished"
const_str_26: .asciiz "expression_test:start"
const_str_27: .asciiz "a = 5, b = 3, c = -7 , t[0] = 3"
const_str_28: .asciiz "+a:"
const_str_29: .asciiz "-c:"
const_str_30: .asciiz "+a+b:"
const_str_31: .asciiz "+a+b*c:"
const_str_32: .asciiz "+a+b*(c+gcd(5,3)):"
const_str_33: .asciiz "+a+b*(c+gcd(5,3)*t[0]):"
const_str_34: .asciiz "'c':"
const_str_35: .asciiz "'c'+-1:"
const_str_36: .asciiz "5 - 1 * 2 * 3 + 12 / 2 / 2:"
const_str_37: .asciiz "-'c'*(152+56/(3-2))/2+7:"
const_str_38: .asciiz "expression_test:finished"
const_str_40: .asciiz "fun0 passed"
const_str_42: .asciiz "fun1 passed,with para:"
const_str_44: .asciiz "fun2 passed,with return:"
const_str_46: .asciiz "fun3 passed,with return:"
const_str_48: .asciiz "fun4 passed,with return:"
const_str_50: .asciiz "function_test:start"
const_str_51: .asciiz "a==1:"
const_str_52: .asciiz "b==2:"
const_str_53: .asciiz "c==3:"
const_str_54: .asciiz "function_test:finished"
const_str_56: .asciiz "if_test:start"
const_str_59: .asciiz "if_test1 passed"
const_str_62: .asciiz "if_test2 error"
const_str_63: .asciiz "if_test2 passed"
const_str_66: .asciiz "if_test3 passed"
const_str_69: .asciiz "if_test4 passed"
const_str_74: .asciiz "if_test5 error"
const_str_75: .asciiz "if_test5 passed"
const_str_76: .asciiz "if_test:finished"
const_str_78: .asciiz "for_test:start"
const_str_82: .asciiz "for_test1 passed:"
const_str_86: .asciiz "for_test2 passed:"
const_str_90: .asciiz "for_test3 passed:"
const_str_97: .asciiz "for_test4 passed:"
const_str_98: .asciiz "for_test:finished"
const_str_100: .asciiz "switch_test:start"
const_str_110: .asciiz "greater than 6"
const_str_111: .asciiz "switch_test:finished"
const_str_113: .asciiz "nested_test:start"
const_str_129: .asciiz "greater than 3"
const_str_130: .asciiz "nested_test:finished"
const_str_132: .asciiz "array_test:start"
const_str_136: .asciiz "a[i]:"
const_str_137: .asciiz "ch[0]:"
const_str_138: .asciiz "ch[1]:"
const_str_139: .asciiz "array_test:finished"
const_str_141: .asciiz "empty_test:start"
const_str_142: .asciiz "empty_test:finished"
const_str_144: .asciiz "assign_test:start"
const_str_145: .asciiz "a:"
const_str_146: .asciiz "_t0[0]:"
const_str_147: .asciiz "a:"
const_str_148: .asciiz "assign_test:finished"
const_str_150: .asciiz "gcd_test:start"
const_str_151: .asciiz "gcd is:"
const_str_152: .asciiz "lcm is:"
const_str_153: .asciiz "gcd_test:finished"
.text
j main_154
nop
# for_test_77:
for_test_77:
# PROLOG for_test;
sw $8 -76($29)
sw $9 -80($29)
sw $10 -84($29)
sw $11 -88($29)
sw $12 -92($29)
sw $13 -96($29)
sw $14 -100($29)
sw $15 -104($29)
sw $16 -108($29)
sw $17 -112($29)
sw $18 -116($29)
sw $19 -120($29)
sw $20 -124($29)
sw $21 -128($29)
sw $22 -132($29)
sw $23 -136($29)
sw $24 -140($29)
sw $25 -144($29)
sw $31 -148($29)
# PRINT_STR const_str_78;
addiu $2 $0 4
la $4 const_str_78
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# a = 0;
# fetch a @ $16 global
addiu $16 $0 0
# i = 0;
# fetch i @ $17 global
addiu $17 $0 0
# GOTO for_block_81;
j for_block_81
nop
# for_condition_79:
for_condition_79:
# %t71 = i < 0;
# fetch %t71 @ $18 global
# fetch i @ $17 global
addiu $1 $0 0
slti $18 $17 0
# if == 0 go to: %t71 for_end_80;
# fetch %t71 @ $18 global
beq $18 $0 for_end_80
nop
# for_block_81:
for_block_81:
# a = a + 1;
# fetch a @ $16 global
# fetch a @ $16 global
addiu $16 $16 1
# i = i + 1;
# fetch i @ $17 global
# fetch i @ $17 global
addiu $17 $17 1
# GOTO for_condition_79;
j for_condition_79
nop
# for_end_80:
for_end_80:
# PRINT_STR const_str_82;
addiu $2 $0 4
la $4 const_str_82
syscall
# PRINT_INT a;
addiu $2 $0 1
# fetch a @ $16 global
addiu $4 $16 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# a#1 = 0;
# fetch a#1 @ $16 global
addiu $16 $0 0
# i#1 = 0;
# fetch i#1 @ $17 global
addiu $17 $0 0
# GOTO for_block_85;
j for_block_85
nop
# for_condition_83:
for_condition_83:
# if == 0 go to: 0 for_end_84;
j for_end_84
nop
# for_block_85:
for_block_85:
# a#1 = a#1 + 1;
# fetch a#1 @ $16 global
# fetch a#1 @ $16 global
addiu $16 $16 1
# i#1 = i#1 + 1;
# fetch i#1 @ $17 global
# fetch i#1 @ $17 global
addiu $17 $17 1
# GOTO for_condition_83;
j for_condition_83
nop
# for_end_84:
for_end_84:
# PRINT_STR const_str_86;
addiu $2 $0 4
la $4 const_str_86
syscall
# PRINT_INT a#1;
addiu $2 $0 1
# fetch a#1 @ $16 global
addiu $4 $16 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# a#2 = 0;
# fetch a#2 @ $18 global
addiu $18 $0 0
# i#2 = 0;
# fetch i#2 @ $17 global
addiu $17 $0 0
# GOTO for_block_89;
j for_block_89
nop
# for_condition_87:
for_condition_87:
# %t76 = i#2 < 10;
# fetch %t76 @ $16 global
# fetch i#2 @ $17 global
addiu $1 $0 10
slti $16 $17 10
# if == 0 go to: %t76 for_end_88;
# fetch %t76 @ $16 global
beq $16 $0 for_end_88
nop
# for_block_89:
for_block_89:
# a#2 = a#2 + 1;
# fetch a#2 @ $18 global
# fetch a#2 @ $18 global
addiu $18 $18 1
# i#2 = i#2 + 1;
# fetch i#2 @ $17 global
# fetch i#2 @ $17 global
addiu $17 $17 1
# GOTO for_condition_87;
j for_condition_87
nop
# for_end_88:
for_end_88:
# PRINT_STR const_str_90;
addiu $2 $0 4
la $4 const_str_90
syscall
# PRINT_INT a#2;
addiu $2 $0 1
# fetch a#2 @ $18 global
addiu $4 $18 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# a#3 = 0;
# fetch a#3 @ $19 global
addiu $19 $0 0
# i#3 = 0;
# fetch i#3 @ $17 global
addiu $17 $0 0
# GOTO for_block_93;
j for_block_93
nop
# for_condition_91:
for_condition_91:
# %t78 = i#3 < 5;
# fetch %t78 @ $16 global
# fetch i#3 @ $17 global
addiu $1 $0 5
slti $16 $17 5
# if == 0 go to: %t78 for_end_92;
# fetch %t78 @ $16 global
beq $16 $0 for_end_92
nop
# for_block_93:
for_block_93:
# j = 3;
# fetch j @ $16 global
addiu $16 $0 3
# GOTO for_block_96;
j for_block_96
nop
# for_condition_94:
for_condition_94:
# %t79 = j > 0;
# fetch %t79 @ $18 global
# fetch j @ $16 global
addiu $1 $0 0
addiu $1 $0 0
slt $18 $1 $16
# if == 0 go to: %t79 for_end_95;
# fetch %t79 @ $18 global
beq $18 $0 for_end_95
nop
# for_block_96:
for_block_96:
# a#3 = a#3 + 1;
# fetch a#3 @ $19 global
# fetch a#3 @ $19 global
addiu $19 $19 1
# j = j - 1;
# fetch j @ $16 global
# fetch j @ $16 global
addiu $1 $0 1
subu $16 $16 $1
# GOTO for_condition_94;
j for_condition_94
nop
# for_end_95:
for_end_95:
# i#3 = i#3 + 1;
# fetch i#3 @ $17 global
# fetch i#3 @ $17 global
addiu $17 $17 1
# GOTO for_condition_91;
j for_condition_91
nop
# for_end_92:
for_end_92:
# PRINT_STR const_str_97;
addiu $2 $0 4
la $4 const_str_97
syscall
# PRINT_INT a#3;
addiu $2 $0 1
# fetch a#3 @ $19 global
addiu $4 $19 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_98;
addiu $2 $0 4
la $4 const_str_98
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# EPILOG;
lw $8 -76($29)
lw $9 -80($29)
lw $10 -84($29)
lw $11 -88($29)
lw $12 -92($29)
lw $13 -96($29)
lw $14 -100($29)
lw $15 -104($29)
lw $16 -108($29)
lw $17 -112($29)
lw $18 -116($29)
lw $19 -120($29)
lw $20 -124($29)
lw $21 -128($29)
lw $22 -132($29)
lw $23 -136($29)
lw $24 -140($29)
lw $25 -144($29)
lw $31 -148($29)
jr $31
nop
# printf_test_6:
printf_test_6:
# PROLOG printf_test;
sw $8 -56($29)
sw $9 -60($29)
sw $10 -64($29)
sw $11 -68($29)
sw $12 -72($29)
sw $13 -76($29)
sw $14 -80($29)
sw $15 -84($29)
sw $16 -88($29)
sw $17 -92($29)
sw $18 -96($29)
sw $19 -100($29)
sw $20 -104($29)
sw $21 -108($29)
sw $22 -112($29)
sw $23 -116($29)
sw $24 -120($29)
sw $25 -124($29)
sw $31 -128($29)
# PRINT_STR const_str_7;
addiu $2 $0 4
la $4 const_str_7
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_8;
addiu $2 $0 4
la $4 const_str_8
syscall
# PRINT_INT 1;
addiu $2 $0 1
addiu $4 $0 1
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_INT 1;
addiu $2 $0 1
addiu $4 $0 1
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_9;
addiu $2 $0 4
la $4 const_str_9
syscall
# PRINT_CHAR 't';
addiu $2 $0 11
addiu $4 $0 116
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_CHAR 't';
addiu $2 $0 11
addiu $4 $0 116
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t10 = 1 + 1;
# fetch %t10 @ $17 global
addiu $8 $0 1
# fetch 1 @ $8
addiu $9 $0 1
# fetch 1 @ $9
addiu $17 $9 1
# PRINT_STR const_str_10;
addiu $2 $0 4
la $4 const_str_10
syscall
# PRINT_INT %t10;
addiu $2 $0 1
# fetch %t10 @ $17 global
addiu $4 $17 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# t[0] = 1;
# load t
addiu $10 $29 -52
# fetch t @ $10
addiu $11 $0 1
# fetch 1 @ $11
sw $11 0($10)
# save t
# PRINT_STR const_str_11;
addiu $2 $0 4
la $4 const_str_11
syscall
# %t14 = t[0];
# load t
addiu $10 $29 -52
# fetch t @ $10
# fetch %t14 @ $16 global
lw $16 0($10)
# PRINT_INT %t14;
addiu $2 $0 1
# fetch %t14 @ $16 global
addiu $4 $16 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_12;
addiu $2 $0 4
la $4 const_str_12
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# EPILOG;
lw $8 -56($29)
lw $9 -60($29)
lw $10 -64($29)
lw $11 -68($29)
lw $12 -72($29)
lw $13 -76($29)
lw $14 -80($29)
lw $15 -84($29)
lw $16 -88($29)
lw $17 -92($29)
lw $18 -96($29)
lw $19 -100($29)
lw $20 -104($29)
lw $21 -108($29)
lw $22 -112($29)
lw $23 -116($29)
lw $24 -120($29)
lw $25 -124($29)
lw $31 -128($29)
jr $31
nop
# empty_test_140:
empty_test_140:
# PROLOG empty_test;
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
# PRINT_STR const_str_141;
addiu $2 $0 4
la $4 const_str_141
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_142;
addiu $2 $0 4
la $4 const_str_142
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
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
# gcd_0:
gcd_0:
# PROLOG gcd;
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
# get param global: a
lw $18 -8($29)
# get param global: b
lw $17 -12($29)
# if != go to: b 0 if_false_1;
# fetch b @ $17 global
addiu $1 $0 0
bne $17 $1 if_false_1
nop
# RET a;
# fetch a @ $18 global
sw $18 -4($29)
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
# GOTO if_end_2;
j if_end_2
nop
# if_false_1:
if_false_1:
# if_end_2:
if_end_2:
# %t0 = a < b;
# fetch %t0 @ $16 global
# fetch a @ $18 global
# fetch b @ $17 global
slt $16 $18 $17
# if == 0 go to: %t0 if_false_3;
# fetch %t0 @ $16 global
beq $16 $0 if_false_3
nop
# PUSH b;
# fetch b @ $17 global
sw $17 -112($29)
# fetch a @ $18 global
sw $18 -116($29)
# CALL gcd;
addiu $29 $29 -104
jal gcd_0
nop
addiu $29 $29 104
# GET %t1;
# fetch %t1 @ $16 global
# load %pass_val
lw $8 -108($29)
# fetch %pass_val @ $8
addiu $16 $8 0
# RET %t1;
# fetch %t1 @ $16 global
sw $16 -4($29)
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
# GOTO if_end_4;
j if_end_4
nop
# if_false_3:
if_false_3:
# %t6 = a - b;
# fetch %t6 @ $16 global
# fetch a @ $18 global
# fetch b @ $17 global
subu $16 $18 $17
# PUSH %t6;
# fetch %t6 @ $16 global
sw $16 -112($29)
# fetch b @ $17 global
sw $17 -116($29)
# CALL gcd;
addiu $29 $29 -104
jal gcd_0
nop
addiu $29 $29 104
# GET %t4;
# fetch %t4 @ $16 global
# load %pass_val
lw $8 -108($29)
# fetch %pass_val @ $8
addiu $16 $8 0
# RET %t4;
# fetch %t4 @ $16 global
sw $16 -4($29)
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
# if_end_4:
if_end_4:
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
# function_test_49:
function_test_49:
# PROLOG function_test;
sw $8 -40($29)
sw $9 -44($29)
sw $10 -48($29)
sw $11 -52($29)
sw $12 -56($29)
sw $13 -60($29)
sw $14 -64($29)
sw $15 -68($29)
sw $16 -72($29)
sw $17 -76($29)
sw $18 -80($29)
sw $19 -84($29)
sw $20 -88($29)
sw $21 -92($29)
sw $22 -96($29)
sw $23 -100($29)
sw $24 -104($29)
sw $25 -108($29)
sw $31 -112($29)
# PRINT_STR const_str_50;
addiu $2 $0 4
la $4 const_str_50
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# CALL fun0;
addiu $29 $29 -112
jal fun0_39
nop
addiu $29 $29 112
# PUSH 't';
addiu $1 $0 116
sb $1 -117($29)
# CALL fun1;
addiu $29 $29 -112
jal fun1_41
nop
addiu $29 $29 112
# CALL fun2;
addiu $29 $29 -112
jal fun2_43
nop
addiu $29 $29 112
# GET %t62;
# fetch %t62 @ $17 global
# load %pass_val
lw $8 -116($29)
# fetch %pass_val @ $8
addiu $17 $8 0
# a = (int)%t62;
# fetch a @ $16 global
# fetch %t62 @ $17 global
addiu $16 $17 0
# %t66 = a + 0;
# fetch %t66 @ $18 global
# fetch a @ $16 global
addiu $18 $16 0
# PUSH %t66;
# fetch %t66 @ $18 global
sw $18 -120($29)
# CALL fun3;
addiu $29 $29 -112
jal fun3_45
nop
addiu $29 $29 112
# GET b;
# fetch b @ $17 global
# load %pass_val
lw $8 -116($29)
# fetch %pass_val @ $8
addiu $17 $8 0
# PUSH a;
# fetch a @ $16 global
sw $16 -120($29)
# fetch b @ $17 global
sw $17 -124($29)
# CALL fun4;
addiu $29 $29 -112
jal fun4_47
nop
addiu $29 $29 112
# GET %t67;
# fetch %t67 @ $18 global
# load %pass_val
lw $8 -116($29)
# fetch %pass_val @ $8
addiu $18 $8 0
# PRINT_STR const_str_51;
addiu $2 $0 4
la $4 const_str_51
syscall
# PRINT_INT a;
addiu $2 $0 1
# fetch a @ $16 global
addiu $4 $16 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_52;
addiu $2 $0 4
la $4 const_str_52
syscall
# PRINT_INT b;
addiu $2 $0 1
# fetch b @ $17 global
addiu $4 $17 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_53;
addiu $2 $0 4
la $4 const_str_53
syscall
# PRINT_INT %t67;
addiu $2 $0 1
# fetch %t67 @ $18 global
addiu $4 $18 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_54;
addiu $2 $0 4
la $4 const_str_54
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# EPILOG;
lw $8 -40($29)
lw $9 -44($29)
lw $10 -48($29)
lw $11 -52($29)
lw $12 -56($29)
lw $13 -60($29)
lw $14 -64($29)
lw $15 -68($29)
lw $16 -72($29)
lw $17 -76($29)
lw $18 -80($29)
lw $19 -84($29)
lw $20 -88($29)
lw $21 -92($29)
lw $22 -96($29)
lw $23 -100($29)
lw $24 -104($29)
lw $25 -108($29)
lw $31 -112($29)
jr $31
nop
# if_test_55:
if_test_55:
# PROLOG if_test;
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
# PRINT_STR const_str_56;
addiu $2 $0 4
la $4 const_str_56
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# if == 0 go to: 1 if_false_57;
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
# if_end_58:
if_end_58:
# if == 0 go to: 0 if_false_60;
j if_false_60
nop
# PRINT_STR const_str_62;
addiu $2 $0 4
la $4 const_str_62
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO if_end_61;
j if_end_61
nop
# if_false_60:
if_false_60:
# PRINT_STR const_str_63;
addiu $2 $0 4
la $4 const_str_63
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# if_end_61:
if_end_61:
# a = 1;
# fetch a @ $17 global
addiu $17 $0 1
# if == 0 go to: 1 if_false_64;
# PRINT_STR const_str_66;
addiu $2 $0 4
la $4 const_str_66
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO if_end_65;
j if_end_65
nop
# if_false_64:
if_false_64:
# if_end_65:
if_end_65:
# %t70 = a + 1;
# fetch %t70 @ $16 global
# fetch a @ $17 global
addiu $16 $17 1
# if == 0 go to: %t70 if_false_67;
# fetch %t70 @ $16 global
beq $16 $0 if_false_67
nop
# PRINT_STR const_str_69;
addiu $2 $0 4
la $4 const_str_69
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO if_end_68;
j if_end_68
nop
# if_false_67:
if_false_67:
# if_end_68:
if_end_68:
# if == 0 go to: 1 if_false_70;
# if == 0 go to: 0 if_false_72;
j if_false_72
nop
# PRINT_STR const_str_74;
addiu $2 $0 4
la $4 const_str_74
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO if_end_73;
j if_end_73
nop
# if_false_72:
if_false_72:
# PRINT_STR const_str_75;
addiu $2 $0 4
la $4 const_str_75
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# if_end_73:
if_end_73:
# GOTO if_end_71;
j if_end_71
nop
# if_false_70:
if_false_70:
# if_end_71:
if_end_71:
# PRINT_STR const_str_76;
addiu $2 $0 4
la $4 const_str_76
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
# trans_5:
trans_5:
# PROLOG trans;
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
# %t8 = -t;
# fetch %t8 @ $17 global
# load t
lw $8 12($28)
# fetch t @ $8
subu $17 $0 $8
# %t9 = %t8 + 1;
# fetch %t9 @ $16 global
# fetch %t8 @ $17 global
addiu $16 $17 1
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
# scanf_test_13:
scanf_test_13:
# PROLOG scanf_test;
sw $8 -56($29)
sw $9 -60($29)
sw $10 -64($29)
sw $11 -68($29)
sw $12 -72($29)
sw $13 -76($29)
sw $14 -80($29)
sw $15 -84($29)
sw $16 -88($29)
sw $17 -92($29)
sw $18 -96($29)
sw $19 -100($29)
sw $20 -104($29)
sw $21 -108($29)
sw $22 -112($29)
sw $23 -116($29)
sw $24 -120($29)
sw $25 -124($29)
sw $31 -128($29)
# PRINT_STR const_str_14;
addiu $2 $0 4
la $4 const_str_14
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# READ_INT a;
addiu $2 $0 5
syscall
# fetch a @ $19 global
addiu $19 $2 0
# PRINT_STR const_str_15;
addiu $2 $0 4
la $4 const_str_15
syscall
# PRINT_INT a;
addiu $2 $0 1
# fetch a @ $19 global
addiu $4 $19 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# READ_CHAR ch;
addiu $2 $0 12
syscall
# fetch ch @ $16 global
addiu $16 $2 0
# PRINT_STR const_str_16;
addiu $2 $0 4
la $4 const_str_16
syscall
# PRINT_CHAR ch;
addiu $2 $0 11
# fetch ch @ $16 global
addiu $4 $16 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# READ_INT a#1;
addiu $2 $0 5
syscall
# fetch a#1 @ $18 global
addiu $18 $2 0
# READ_CHAR ch#1;
addiu $2 $0 12
syscall
# fetch ch#1 @ $17 global
addiu $17 $2 0
# PRINT_STR const_str_17;
addiu $2 $0 4
la $4 const_str_17
syscall
# PRINT_INT a#1;
addiu $2 $0 1
# fetch a#1 @ $18 global
addiu $4 $18 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_18;
addiu $2 $0 4
la $4 const_str_18
syscall
# PRINT_CHAR ch#1;
addiu $2 $0 11
# fetch ch#1 @ $17 global
addiu $4 $17 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# t[0] = 2;
# load t
addiu $8 $29 -52
# fetch t @ $8
addiu $9 $0 2
# fetch 2 @ $9
sw $9 0($8)
# save t
# PRINT_STR const_str_19;
addiu $2 $0 4
la $4 const_str_19
syscall
# %t18 = t[0];
# load t
addiu $8 $29 -52
# fetch t @ $8
# fetch %t18 @ $16 global
lw $16 0($8)
# PRINT_INT %t18;
addiu $2 $0 1
# fetch %t18 @ $16 global
addiu $4 $16 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_20;
addiu $2 $0 4
la $4 const_str_20
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# EPILOG;
lw $8 -56($29)
lw $9 -60($29)
lw $10 -64($29)
lw $11 -68($29)
lw $12 -72($29)
lw $13 -76($29)
lw $14 -80($29)
lw $15 -84($29)
lw $16 -88($29)
lw $17 -92($29)
lw $18 -96($29)
lw $19 -100($29)
lw $20 -104($29)
lw $21 -108($29)
lw $22 -112($29)
lw $23 -116($29)
lw $24 -120($29)
lw $25 -124($29)
lw $31 -128($29)
jr $31
nop
# same_name_test_21:
same_name_test_21:
# PROLOG same_name_test;
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
# PRINT_STR const_str_22;
addiu $2 $0 4
la $4 const_str_22
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_23;
addiu $2 $0 4
la $4 const_str_23
syscall
# PRINT_CHAR 'y';
addiu $2 $0 11
addiu $4 $0 121
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_24;
addiu $2 $0 4
la $4 const_str_24
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
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
# expression_test_25:
expression_test_25:
# PROLOG expression_test;
sw $8 -108($29)
sw $9 -112($29)
sw $10 -116($29)
sw $11 -120($29)
sw $12 -124($29)
sw $13 -128($29)
sw $14 -132($29)
sw $15 -136($29)
sw $16 -140($29)
sw $17 -144($29)
sw $18 -148($29)
sw $19 -152($29)
sw $20 -156($29)
sw $21 -160($29)
sw $22 -164($29)
sw $23 -168($29)
sw $24 -172($29)
sw $25 -176($29)
sw $31 -180($29)
# PRINT_STR const_str_26;
addiu $2 $0 4
la $4 const_str_26
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# a = 5;
# fetch a @ $22 global
addiu $22 $0 5
# b = 3;
# fetch b @ $21 global
addiu $21 $0 3
# c = -7;
# fetch c @ $20 global
addiu $20 $0 -7
# t[0] = 3;
# load t
addiu $8 $29 -104
# fetch t @ $8
addiu $9 $0 3
# fetch 3 @ $9
sw $9 0($8)
# save t
# PRINT_STR const_str_27;
addiu $2 $0 4
la $4 const_str_27
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_28;
addiu $2 $0 4
la $4 const_str_28
syscall
# PRINT_INT 5;
addiu $2 $0 1
addiu $4 $0 5
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_29;
addiu $2 $0 4
la $4 const_str_29
syscall
# %t22 = --7;
# fetch %t22 @ $19 global
addiu $8 $0 -7
# fetch %t19 @ $8
subu $19 $0 $8
# PRINT_INT %t22;
addiu $2 $0 1
# fetch %t22 @ $19 global
addiu $4 $19 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_30;
addiu $2 $0 4
la $4 const_str_30
syscall
# %t23 = 5 + 3;
# fetch %t23 @ $16 global
addiu $10 $0 3
# fetch 3 @ $10
addiu $11 $0 5
# fetch 5 @ $11
addiu $16 $11 3
# PRINT_INT %t23;
addiu $2 $0 1
# fetch %t23 @ $16 global
addiu $4 $16 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_31;
addiu $2 $0 4
la $4 const_str_31
syscall
# %t24 = 3 * -7;
# fetch %t24 @ $18 global
addiu $8 $0 -7
# fetch %t19 @ $8
addiu $10 $0 3
# fetch 3 @ $10
addiu $1 $0 -7
mul $18 $10 $1
# %t25 = 5 + %t24;
# fetch %t25 @ $17 global
# fetch %t24 @ $18 global
addiu $17 $18 5
# PRINT_INT %t25;
addiu $2 $0 1
# fetch %t25 @ $17 global
addiu $4 $17 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_32;
addiu $2 $0 4
la $4 const_str_32
syscall
# PUSH 5;
addiu $1 $0 5
sw $1 -188($29)
addiu $1 $0 3
sw $1 -192($29)
# CALL gcd;
addiu $29 $29 -180
jal gcd_0
nop
addiu $29 $29 180
# GET %t26;
# fetch %t26 @ $16 global
# load %pass_val
lw $12 -184($29)
# fetch %pass_val @ $12
addiu $16 $12 0
# %t29 = c + %t26;
# fetch %t29 @ $17 global
# fetch c @ $20 global
# fetch %t26 @ $16 global
addu $17 $20 $16
# %t30 = b * %t29;
# fetch %t30 @ $19 global
# fetch b @ $21 global
# fetch %t29 @ $17 global
mul $19 $21 $17
# %t31 = a + %t30;
# fetch %t31 @ $18 global
# fetch a @ $22 global
# fetch %t30 @ $19 global
addu $18 $22 $19
# PRINT_INT %t31;
addiu $2 $0 1
# fetch %t31 @ $18 global
addiu $4 $18 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_33;
addiu $2 $0 4
la $4 const_str_33
syscall
# PUSH 5;
addiu $1 $0 5
sw $1 -188($29)
addiu $1 $0 3
sw $1 -192($29)
# CALL gcd;
addiu $29 $29 -180
jal gcd_0
nop
addiu $29 $29 180
# GET %t32;
# fetch %t32 @ $17 global
# load %pass_val
lw $12 -184($29)
# fetch %pass_val @ $12
addiu $17 $12 0
# %t36 = t[0];
# load t
addiu $12 $29 -104
# fetch t @ $12
# fetch %t36 @ $16 global
lw $16 0($12)
# %t37 = %t32 * %t36;
# fetch %t37 @ $23 global
# fetch %t32 @ $17 global
# fetch %t36 @ $16 global
mul $23 $17 $16
# %t38 = c + %t37;
# fetch %t38 @ $18 global
# fetch c @ $20 global
# fetch %t37 @ $23 global
addu $18 $20 $23
# %t39 = b * %t38;
# fetch %t39 @ $13
# fetch b @ $21 global
# fetch %t38 @ $18 global
mul $13 $21 $18
# save %t39
sw $13 -68($29)
# %t40 = a + %t39;
# fetch %t40 @ $19 global
# fetch a @ $22 global
# load %t39
lw $13 -68($29)
# fetch %t39 @ $13
addu $19 $22 $13
# PRINT_INT %t40;
addiu $2 $0 1
# fetch %t40 @ $19 global
addiu $4 $19 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_34;
addiu $2 $0 4
la $4 const_str_34
syscall
# PRINT_CHAR 'c';
addiu $2 $0 11
addiu $4 $0 99
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_35;
addiu $2 $0 4
la $4 const_str_35
syscall
# PRINT_INT 98;
addiu $2 $0 1
addiu $4 $0 98
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_36;
addiu $2 $0 4
la $4 const_str_36
syscall
# PRINT_INT 2;
addiu $2 $0 1
addiu $4 $0 2
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_37;
addiu $2 $0 4
la $4 const_str_37
syscall
# PRINT_INT -10289;
addiu $2 $0 1
addiu $4 $0 -10289
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_38;
addiu $2 $0 4
la $4 const_str_38
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# EPILOG;
lw $8 -108($29)
lw $9 -112($29)
lw $10 -116($29)
lw $11 -120($29)
lw $12 -124($29)
lw $13 -128($29)
lw $14 -132($29)
lw $15 -136($29)
lw $16 -140($29)
lw $17 -144($29)
lw $18 -148($29)
lw $19 -152($29)
lw $20 -156($29)
lw $21 -160($29)
lw $22 -164($29)
lw $23 -168($29)
lw $24 -172($29)
lw $25 -176($29)
lw $31 -180($29)
jr $31
nop
# fun0_39:
fun0_39:
# PROLOG fun0;
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
# PRINT_STR const_str_40;
addiu $2 $0 4
la $4 const_str_40
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
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
# fun1_41:
fun1_41:
# PROLOG fun1;
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
lb $16 -5($29)
# PRINT_STR const_str_42;
addiu $2 $0 4
la $4 const_str_42
syscall
# PRINT_CHAR a;
addiu $2 $0 11
# fetch a @ $16 global
addiu $4 $16 0
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
# fun2_43:
fun2_43:
# PROLOG fun2;
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
# PRINT_STR const_str_44;
addiu $2 $0 4
la $4 const_str_44
syscall
# PRINT_CHAR 'a';
addiu $2 $0 11
addiu $4 $0 97
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
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
# fun3_45:
fun3_45:
# PROLOG fun3;
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
# get param global: a
lw $16 -8($29)
# PRINT_STR const_str_46;
addiu $2 $0 4
la $4 const_str_46
syscall
# %t57 = a + 1;
# fetch %t57 @ $17 global
# fetch a @ $16 global
addiu $17 $16 1
# PRINT_INT %t57;
addiu $2 $0 1
# fetch %t57 @ $17 global
addiu $4 $17 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# a#1 = a#1 + 1;
# fetch a#1 @ $16 global
# fetch a#1 @ $16 global
addiu $16 $16 1
# RET a#1;
# fetch a#1 @ $16 global
sw $16 -4($29)
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
# fun4_47:
fun4_47:
# PROLOG fun4;
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
# get param global: a
lw $18 -8($29)
# get param global: b
lw $17 -12($29)
# PRINT_STR const_str_48;
addiu $2 $0 4
la $4 const_str_48
syscall
# %t59 = a + b;
# fetch %t59 @ $16 global
# fetch a @ $18 global
# fetch b @ $17 global
addu $16 $18 $17
# PRINT_INT %t59;
addiu $2 $0 1
# fetch %t59 @ $16 global
addiu $4 $16 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# RET %t59;
# fetch %t59 @ $16 global
sw $16 -4($29)
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
# switch_test_99:
switch_test_99:
# PROLOG switch_test;
sw $8 -40($29)
sw $9 -44($29)
sw $10 -48($29)
sw $11 -52($29)
sw $12 -56($29)
sw $13 -60($29)
sw $14 -64($29)
sw $15 -68($29)
sw $16 -72($29)
sw $17 -76($29)
sw $18 -80($29)
sw $19 -84($29)
sw $20 -88($29)
sw $21 -92($29)
sw $22 -96($29)
sw $23 -100($29)
sw $24 -104($29)
sw $25 -108($29)
sw $31 -112($29)
# PRINT_STR const_str_100;
addiu $2 $0 4
la $4 const_str_100
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# c = 4;
# fetch c @ $17 global
addiu $17 $0 4
# %t81 = 4 == 0;
# fetch %t81 @ $16 global
addiu $8 $0 0
# fetch 0 @ $8
addiu $9 $0 4
# fetch 4 @ $9
xori $1 $9 0
sltiu $16 $1 1
# if == 0 go to: %t81 case_end_102;
# fetch %t81 @ $16 global
beq $16 $0 case_end_102
nop
# PRINT_INT 0;
addiu $2 $0 1
addiu $4 $0 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_101;
j switch_end_101
nop
# case_end_102:
case_end_102:
# %t82 = c == 1;
# fetch %t82 @ $16 global
# fetch c @ $17 global
xori $1 $17 1
sltiu $16 $1 1
# if == 0 go to: %t82 case_end_103;
# fetch %t82 @ $16 global
beq $16 $0 case_end_103
nop
# PRINT_INT 1;
addiu $2 $0 1
addiu $4 $0 1
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_101;
j switch_end_101
nop
# case_end_103:
case_end_103:
# %t83 = c == 2;
# fetch %t83 @ $16 global
# fetch c @ $17 global
xori $1 $17 2
sltiu $16 $1 1
# if == 0 go to: %t83 case_end_104;
# fetch %t83 @ $16 global
beq $16 $0 case_end_104
nop
# PRINT_INT 2;
addiu $2 $0 1
addiu $4 $0 2
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_101;
j switch_end_101
nop
# case_end_104:
case_end_104:
# %t84 = c == 3;
# fetch %t84 @ $16 global
# fetch c @ $17 global
xori $1 $17 3
sltiu $16 $1 1
# if == 0 go to: %t84 case_end_105;
# fetch %t84 @ $16 global
beq $16 $0 case_end_105
nop
# PRINT_INT 3;
addiu $2 $0 1
addiu $4 $0 3
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_101;
j switch_end_101
nop
# case_end_105:
case_end_105:
# %t85 = c == 4;
# fetch %t85 @ $16 global
# fetch c @ $17 global
xori $1 $17 4
sltiu $16 $1 1
# if == 0 go to: %t85 case_end_106;
# fetch %t85 @ $16 global
beq $16 $0 case_end_106
nop
# PRINT_INT 4;
addiu $2 $0 1
addiu $4 $0 4
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_101;
j switch_end_101
nop
# case_end_106:
case_end_106:
# %t86 = c == 5;
# fetch %t86 @ $16 global
# fetch c @ $17 global
xori $1 $17 5
sltiu $16 $1 1
# if == 0 go to: %t86 case_end_107;
# fetch %t86 @ $16 global
beq $16 $0 case_end_107
nop
# PRINT_INT 5;
addiu $2 $0 1
addiu $4 $0 5
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_101;
j switch_end_101
nop
# case_end_107:
case_end_107:
# %t87 = c == 6;
# fetch %t87 @ $16 global
# fetch c @ $17 global
xori $1 $17 6
sltiu $16 $1 1
# if == 0 go to: %t87 case_end_108;
# fetch %t87 @ $16 global
beq $16 $0 case_end_108
nop
# PRINT_INT 6;
addiu $2 $0 1
addiu $4 $0 6
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_101;
j switch_end_101
nop
# case_end_108:
case_end_108:
# PRINT_STR const_str_110;
addiu $2 $0 4
la $4 const_str_110
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_101;
j switch_end_101
nop
# case_end_109:
case_end_109:
# switch_end_101:
switch_end_101:
# PRINT_STR const_str_111;
addiu $2 $0 4
la $4 const_str_111
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# EPILOG;
lw $8 -40($29)
lw $9 -44($29)
lw $10 -48($29)
lw $11 -52($29)
lw $12 -56($29)
lw $13 -60($29)
lw $14 -64($29)
lw $15 -68($29)
lw $16 -72($29)
lw $17 -76($29)
lw $18 -80($29)
lw $19 -84($29)
lw $20 -88($29)
lw $21 -92($29)
lw $22 -96($29)
lw $23 -100($29)
lw $24 -104($29)
lw $25 -108($29)
lw $31 -112($29)
jr $31
nop
# nested_test_112:
nested_test_112:
# PROLOG nested_test;
sw $8 -44($29)
sw $9 -48($29)
sw $10 -52($29)
sw $11 -56($29)
sw $12 -60($29)
sw $13 -64($29)
sw $14 -68($29)
sw $15 -72($29)
sw $16 -76($29)
sw $17 -80($29)
sw $18 -84($29)
sw $19 -88($29)
sw $20 -92($29)
sw $21 -96($29)
sw $22 -100($29)
sw $23 -104($29)
sw $24 -108($29)
sw $25 -112($29)
sw $31 -116($29)
# PRINT_STR const_str_113;
addiu $2 $0 4
la $4 const_str_113
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# num = -1;
# fetch num @ $17 global
addiu $17 $0 -1
# GOTO for_block_116;
j for_block_116
nop
# for_condition_114:
for_condition_114:
# %t89 = num < 5;
# fetch %t89 @ $16 global
# fetch num @ $17 global
addiu $1 $0 5
slti $16 $17 5
# if == 0 go to: %t89 for_end_115;
# fetch %t89 @ $16 global
beq $16 $0 for_end_115
nop
# for_block_116:
for_block_116:
# %t90 = num == -1;
# fetch %t90 @ $16 global
# fetch num @ $17 global
xori $1 $17 -1
sltiu $16 $1 1
# if == 0 go to: %t90 case_end_118;
# fetch %t90 @ $16 global
beq $16 $0 case_end_118
nop
# PRINT_INT -1;
addiu $2 $0 1
addiu $4 $0 -1
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_117;
j switch_end_117
nop
# case_end_118:
case_end_118:
# %t92 = num == 0;
# fetch %t92 @ $16 global
# fetch num @ $17 global
xori $1 $17 0
sltiu $16 $1 1
# if == 0 go to: %t92 case_end_119;
# fetch %t92 @ $16 global
beq $16 $0 case_end_119
nop
# PRINT_INT 0;
addiu $2 $0 1
addiu $4 $0 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_117;
j switch_end_117
nop
# case_end_119:
case_end_119:
# %t93 = num == 1;
# fetch %t93 @ $16 global
# fetch num @ $17 global
xori $1 $17 1
sltiu $16 $1 1
# if == 0 go to: %t93 case_end_120;
# fetch %t93 @ $16 global
beq $16 $0 case_end_120
nop
# i = 0;
# fetch i @ $18 global
addiu $18 $0 0
# GOTO for_block_123;
j for_block_123
nop
# for_condition_121:
for_condition_121:
# %t94 = i < 2;
# fetch %t94 @ $16 global
# fetch i @ $18 global
addiu $1 $0 2
slti $16 $18 2
# if == 0 go to: %t94 for_end_122;
# fetch %t94 @ $16 global
beq $16 $0 for_end_122
nop
# for_block_123:
for_block_123:
# PRINT_INT 1;
addiu $2 $0 1
addiu $4 $0 1
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# i = i + 1;
# fetch i @ $18 global
# fetch i @ $18 global
addiu $18 $18 1
# GOTO for_condition_121;
j for_condition_121
nop
# for_end_122:
for_end_122:
# GOTO switch_end_117;
j switch_end_117
nop
# case_end_120:
case_end_120:
# %t95 = num == 2;
# fetch %t95 @ $16 global
# fetch num @ $17 global
xori $1 $17 2
sltiu $16 $1 1
# if == 0 go to: %t95 case_end_124;
# fetch %t95 @ $16 global
beq $16 $0 case_end_124
nop
# if == 0 go to: 1 if_false_125;
# PRINT_INT 2;
addiu $2 $0 1
addiu $4 $0 2
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO if_end_126;
j if_end_126
nop
# if_false_125:
if_false_125:
# if_end_126:
if_end_126:
# GOTO switch_end_117;
j switch_end_117
nop
# case_end_124:
case_end_124:
# %t96 = num == 3;
# fetch %t96 @ $16 global
# fetch num @ $17 global
xori $1 $17 3
sltiu $16 $1 1
# if == 0 go to: %t96 case_end_127;
# fetch %t96 @ $16 global
beq $16 $0 case_end_127
nop
# PRINT_INT 3;
addiu $2 $0 1
addiu $4 $0 3
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_117;
j switch_end_117
nop
# case_end_127:
case_end_127:
# PRINT_STR const_str_129;
addiu $2 $0 4
la $4 const_str_129
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# GOTO switch_end_117;
j switch_end_117
nop
# case_end_128:
case_end_128:
# switch_end_117:
switch_end_117:
# num = num + 1;
# fetch num @ $17 global
# fetch num @ $17 global
addiu $17 $17 1
# GOTO for_condition_114;
j for_condition_114
nop
# for_end_115:
for_end_115:
# PRINT_STR const_str_130;
addiu $2 $0 4
la $4 const_str_130
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# EPILOG;
lw $8 -44($29)
lw $9 -48($29)
lw $10 -52($29)
lw $11 -56($29)
lw $12 -60($29)
lw $13 -64($29)
lw $14 -68($29)
lw $15 -72($29)
lw $16 -76($29)
lw $17 -80($29)
lw $18 -84($29)
lw $19 -88($29)
lw $20 -92($29)
lw $21 -96($29)
lw $22 -100($29)
lw $23 -104($29)
lw $24 -108($29)
lw $25 -112($29)
lw $31 -116($29)
jr $31
nop
# array_test_131:
array_test_131:
# PROLOG array_test;
sw $8 -88($29)
sw $9 -92($29)
sw $10 -96($29)
sw $11 -100($29)
sw $12 -104($29)
sw $13 -108($29)
sw $14 -112($29)
sw $15 -116($29)
sw $16 -120($29)
sw $17 -124($29)
sw $18 -128($29)
sw $19 -132($29)
sw $20 -136($29)
sw $21 -140($29)
sw $22 -144($29)
sw $23 -148($29)
sw $24 -152($29)
sw $25 -156($29)
sw $31 -160($29)
# PRINT_STR const_str_132;
addiu $2 $0 4
la $4 const_str_132
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# i = 0;
# fetch i @ $19 global
addiu $19 $0 0
# GOTO for_block_135;
j for_block_135
nop
# for_condition_133:
for_condition_133:
# %t97 = i < 5;
# fetch %t97 @ $16 global
# fetch i @ $19 global
addiu $1 $0 5
slti $16 $19 5
# if == 0 go to: %t97 for_end_134;
# fetch %t97 @ $16 global
beq $16 $0 for_end_134
nop
# for_block_135:
for_block_135:
# a[i] = i;
# load a
addiu $8 $29 -76
# fetch a @ $8
# fetch i @ $19 global
# fetch i @ $19 global
sll $1 $19 2
addu $1 $1 $8
sw $19 0($1)
# save a
# PRINT_STR const_str_136;
addiu $2 $0 4
la $4 const_str_136
syscall
# %t101 = a[i];
# load a
addiu $8 $29 -76
# fetch a @ $8
# fetch %t101 @ $16 global
# fetch i @ $19 global
sll $1 $19 2
addu $1 $1 $8
lw $16 0($1)
# PRINT_INT %t101;
addiu $2 $0 1
# fetch %t101 @ $16 global
addiu $4 $16 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# i = i + 1;
# fetch i @ $19 global
# fetch i @ $19 global
addiu $19 $19 1
# GOTO for_condition_133;
j for_condition_133
nop
# for_end_134:
for_end_134:
# ch[0] = 'a';
# load ch
addiu $8 $29 -78
# fetch ch @ $8
addiu $9 $0 97
# fetch 'a' @ $9
sb $9 0($8)
# save ch
# PRINT_STR const_str_137;
addiu $2 $0 4
la $4 const_str_137
syscall
# %t105 = ch[0];
# load ch
addiu $8 $29 -78
# fetch ch @ $8
# fetch %t105 @ $16 global
lb $16 0($8)
# PRINT_CHAR %t105;
addiu $2 $0 11
# fetch %t105 @ $16 global
addiu $4 $16 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t107 = (char)98;
# fetch %t107 @ $18 global
addiu $18 $0 98
# ch[1] = %t107;
# load ch
addiu $8 $29 -78
# fetch ch @ $8
# fetch %t107 @ $18 global
sb $18 1($8)
# save ch
# PRINT_STR const_str_138;
addiu $2 $0 4
la $4 const_str_138
syscall
# %t110 = ch[1];
# load ch
addiu $8 $29 -78
# fetch ch @ $8
# fetch %t110 @ $17 global
lb $17 1($8)
# PRINT_CHAR %t110;
addiu $2 $0 11
# fetch %t110 @ $17 global
addiu $4 $17 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_139;
addiu $2 $0 4
la $4 const_str_139
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# EPILOG;
lw $8 -88($29)
lw $9 -92($29)
lw $10 -96($29)
lw $11 -100($29)
lw $12 -104($29)
lw $13 -108($29)
lw $14 -112($29)
lw $15 -116($29)
lw $16 -120($29)
lw $17 -124($29)
lw $18 -128($29)
lw $19 -132($29)
lw $20 -136($29)
lw $21 -140($29)
lw $22 -144($29)
lw $23 -148($29)
lw $24 -152($29)
lw $25 -156($29)
lw $31 -160($29)
jr $31
nop
# assign_test_143:
assign_test_143:
# PROLOG assign_test;
sw $8 -64($29)
sw $9 -68($29)
sw $10 -72($29)
sw $11 -76($29)
sw $12 -80($29)
sw $13 -84($29)
sw $14 -88($29)
sw $15 -92($29)
sw $16 -96($29)
sw $17 -100($29)
sw $18 -104($29)
sw $19 -108($29)
sw $20 -112($29)
sw $21 -116($29)
sw $22 -120($29)
sw $23 -124($29)
sw $24 -128($29)
sw $25 -132($29)
sw $31 -136($29)
# PRINT_STR const_str_144;
addiu $2 $0 4
la $4 const_str_144
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_145;
addiu $2 $0 4
la $4 const_str_145
syscall
# PRINT_INT 1;
addiu $2 $0 1
addiu $4 $0 1
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t112 = 1 + 1;
# fetch %t112 @ $18 global
addiu $8 $0 1
# fetch 1 @ $8
addiu $9 $0 1
# fetch 1 @ $9
addiu $18 $9 1
# _t0[0] = %t112;
# load _t0
addiu $10 $29 -56
# fetch _t0 @ $10
# fetch %t112 @ $18 global
sw $18 0($10)
# save _t0
# PRINT_STR const_str_146;
addiu $2 $0 4
la $4 const_str_146
syscall
# %t115 = _t0[0];
# load _t0
addiu $10 $29 -56
# fetch _t0 @ $10
# fetch %t115 @ $16 global
lw $16 0($10)
# PRINT_INT %t115;
addiu $2 $0 1
# fetch %t115 @ $16 global
addiu $4 $16 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t117 = _t0[0];
# load _t0
addiu $10 $29 -56
# fetch _t0 @ $10
# fetch %t117 @ $17 global
lw $17 0($10)
# a = %t117 + 1;
# fetch a @ $19 global
# fetch %t117 @ $17 global
addiu $19 $17 1
# PRINT_STR const_str_147;
addiu $2 $0 4
la $4 const_str_147
syscall
# PRINT_INT a;
addiu $2 $0 1
# fetch a @ $19 global
addiu $4 $19 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_148;
addiu $2 $0 4
la $4 const_str_148
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# EPILOG;
lw $8 -64($29)
lw $9 -68($29)
lw $10 -72($29)
lw $11 -76($29)
lw $12 -80($29)
lw $13 -84($29)
lw $14 -88($29)
lw $15 -92($29)
lw $16 -96($29)
lw $17 -100($29)
lw $18 -104($29)
lw $19 -108($29)
lw $20 -112($29)
lw $21 -116($29)
lw $22 -120($29)
lw $23 -124($29)
lw $24 -128($29)
lw $25 -132($29)
lw $31 -136($29)
jr $31
nop
# gcd_test_149:
gcd_test_149:
# PROLOG gcd_test;
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
# get param global: a
lw $17 -8($29)
# get param global: b
lw $16 -12($29)
# PRINT_STR const_str_150;
addiu $2 $0 4
la $4 const_str_150
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PUSH a;
# fetch a @ $17 global
sw $17 -116($29)
# fetch b @ $16 global
sw $16 -120($29)
# CALL gcd;
addiu $29 $29 -108
jal gcd_0
nop
addiu $29 $29 108
# GET %t119;
# fetch %t119 @ $20 global
# load %pass_val
lw $8 -112($29)
# fetch %pass_val @ $8
addiu $20 $8 0
# %t122 = a * b;
# fetch %t122 @ $19 global
# fetch a @ $17 global
# fetch b @ $16 global
mul $19 $17 $16
# %t123 = %t122 / %t119;
# fetch %t123 @ $18 global
# fetch %t122 @ $19 global
# fetch %t119 @ $20 global
div $19 $20
mflo $18
# PRINT_STR const_str_151;
addiu $2 $0 4
la $4 const_str_151
syscall
# PRINT_INT %t119;
addiu $2 $0 1
# fetch %t119 @ $20 global
addiu $4 $20 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_152;
addiu $2 $0 4
la $4 const_str_152
syscall
# PRINT_INT %t123;
addiu $2 $0 1
# fetch %t123 @ $18 global
addiu $4 $18 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_153;
addiu $2 $0 4
la $4 const_str_153
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# EPILOG;
lw $8 -36($29)
lw $9 -40($29)
lw $10 -44($29)
lw $11 -48($29)
lw $12 -52($29)
lw $13 -56($29)
lw $14 -60($29)
lw $15 -64($29)
lw $16 -68($29)
lw $17 -72($29)
lw $18 -76($29)
lw $19 -80($29)
lw $20 -84($29)
lw $21 -88($29)
lw $22 -92($29)
lw $23 -96($29)
lw $24 -100($29)
lw $25 -104($29)
lw $31 -108($29)
jr $31
nop
# main_154:
main_154:
# PROLOG main;
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
# CALL printf_test;
addiu $29 $29 -80
jal printf_test_6
nop
addiu $29 $29 80
# CALL scanf_test;
addiu $29 $29 -80
jal scanf_test_13
nop
addiu $29 $29 80
# CALL same_name_test;
addiu $29 $29 -80
jal same_name_test_21
nop
addiu $29 $29 80
# CALL expression_test;
addiu $29 $29 -80
jal expression_test_25
nop
addiu $29 $29 80
# CALL function_test;
addiu $29 $29 -80
jal function_test_49
nop
addiu $29 $29 80
# CALL if_test;
addiu $29 $29 -80
jal if_test_55
nop
addiu $29 $29 80
# CALL for_test;
addiu $29 $29 -80
jal for_test_77
nop
addiu $29 $29 80
# CALL switch_test;
addiu $29 $29 -80
jal switch_test_99
nop
addiu $29 $29 80
# CALL nested_test;
addiu $29 $29 -80
jal nested_test_112
nop
addiu $29 $29 80
# CALL array_test;
addiu $29 $29 -80
jal array_test_131
nop
addiu $29 $29 80
# CALL empty_test;
addiu $29 $29 -80
jal empty_test_140
nop
addiu $29 $29 80
# CALL assign_test;
addiu $29 $29 -80
jal assign_test_143
nop
addiu $29 $29 80
# PUSH 30;
addiu $1 $0 30
sw $1 -88($29)
addiu $1 $0 75
sw $1 -92($29)
# CALL gcd_test;
addiu $29 $29 -80
jal gcd_test_149
nop
addiu $29 $29 80
# EPILOG;
j __exit__
nop
__exit__:
addiu $2 $0 10
syscall
