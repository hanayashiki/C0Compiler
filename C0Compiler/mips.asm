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
sw $8 -52($29)
sw $9 -56($29)
sw $10 -60($29)
sw $11 -64($29)
sw $12 -68($29)
sw $13 -72($29)
sw $14 -76($29)
sw $15 -80($29)
sw $16 -84($29)
sw $17 -88($29)
sw $18 -92($29)
sw $19 -96($29)
sw $20 -100($29)
sw $21 -104($29)
sw $22 -108($29)
sw $23 -112($29)
sw $24 -116($29)
sw $25 -120($29)
sw $31 -124($29)
# PRINT_STR const_str_78;
addiu $2 $0 4
la $4 const_str_78
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# a = 0;
# fetch a @ $8
addiu $8 $0 0
# save a
sw $8 -40($29)
# i = 0;
# fetch i @ $8
addiu $8 $0 0
# save i
sw $8 -44($29)
# GOTO for_block_81;
j for_block_81
nop
# for_condition_79:
for_condition_79:
# %t71 = i < 0;
# fetch %t71 @ $8
# load i
lw $9 -44($29)
# fetch i @ $9
addiu $1 $0 0
slti $8 $9 0
# save %t71
sw $8 -8($29)
# if == 0 go to: %t71 for_end_80;
# load %t71
lw $8 -8($29)
# fetch %t71 @ $8
beq $8 $0 for_end_80
nop
# for_block_81:
for_block_81:
# %t72 = a + 1;
# fetch %t72 @ $8
# load a
lw $9 -40($29)
# fetch a @ $9
addiu $8 $9 1
# save %t72
sw $8 -12($29)
# a = %t72;
# fetch a @ $9
# load %t72
lw $8 -12($29)
# fetch %t72 @ $8
addiu $9 $8 0
# save a
sw $9 -40($29)
# i = i + 1;
# fetch i @ $9
# load i
lw $9 -44($29)
# fetch i @ $9
addiu $9 $9 1
# save i
sw $9 -44($29)
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
# load a
lw $8 -40($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# a = 0;
# fetch a @ $8
addiu $8 $0 0
# save a
sw $8 -40($29)
# i = 0;
# fetch i @ $8
addiu $8 $0 0
# save i
sw $8 -44($29)
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
# %t75 = a + 1;
# fetch %t75 @ $8
# load a
lw $9 -40($29)
# fetch a @ $9
addiu $8 $9 1
# save %t75
sw $8 -16($29)
# a = %t75;
# fetch a @ $9
# load %t75
lw $8 -16($29)
# fetch %t75 @ $8
addiu $9 $8 0
# save a
sw $9 -40($29)
# i = i + 1;
# fetch i @ $9
# load i
lw $9 -44($29)
# fetch i @ $9
addiu $9 $9 1
# save i
sw $9 -44($29)
# GOTO for_condition_83;
j for_condition_83
nop
# for_end_84:
for_end_84:
# PRINT_STR const_str_86;
addiu $2 $0 4
la $4 const_str_86
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -40($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# a = 0;
# fetch a @ $8
addiu $8 $0 0
# save a
sw $8 -40($29)
# i = 0;
# fetch i @ $8
addiu $8 $0 0
# save i
sw $8 -44($29)
# GOTO for_block_89;
j for_block_89
nop
# for_condition_87:
for_condition_87:
# %t76 = i < 10;
# fetch %t76 @ $8
# load i
lw $9 -44($29)
# fetch i @ $9
addiu $1 $0 10
slti $8 $9 10
# save %t76
sw $8 -20($29)
# if == 0 go to: %t76 for_end_88;
# load %t76
lw $8 -20($29)
# fetch %t76 @ $8
beq $8 $0 for_end_88
nop
# for_block_89:
for_block_89:
# %t77 = a + 1;
# fetch %t77 @ $8
# load a
lw $9 -40($29)
# fetch a @ $9
addiu $8 $9 1
# save %t77
sw $8 -24($29)
# a = %t77;
# fetch a @ $9
# load %t77
lw $8 -24($29)
# fetch %t77 @ $8
addiu $9 $8 0
# save a
sw $9 -40($29)
# i = i + 1;
# fetch i @ $9
# load i
lw $9 -44($29)
# fetch i @ $9
addiu $9 $9 1
# save i
sw $9 -44($29)
# GOTO for_condition_87;
j for_condition_87
nop
# for_end_88:
for_end_88:
# PRINT_STR const_str_90;
addiu $2 $0 4
la $4 const_str_90
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -40($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# a = 0;
# fetch a @ $8
addiu $8 $0 0
# save a
sw $8 -40($29)
# i = 0;
# fetch i @ $8
addiu $8 $0 0
# save i
sw $8 -44($29)
# GOTO for_block_93;
j for_block_93
nop
# for_condition_91:
for_condition_91:
# %t78 = i < 5;
# fetch %t78 @ $8
# load i
lw $9 -44($29)
# fetch i @ $9
addiu $1 $0 5
slti $8 $9 5
# save %t78
sw $8 -28($29)
# if == 0 go to: %t78 for_end_92;
# load %t78
lw $8 -28($29)
# fetch %t78 @ $8
beq $8 $0 for_end_92
nop
# for_block_93:
for_block_93:
# j = 3;
# fetch j @ $8
addiu $8 $0 3
# save j
sw $8 -48($29)
# GOTO for_block_96;
j for_block_96
nop
# for_condition_94:
for_condition_94:
# %t79 = j > 0;
# fetch %t79 @ $8
# load j
lw $9 -48($29)
# fetch j @ $9
addiu $1 $0 0
addiu $1 $0 0
slt $8 $1 $9
# save %t79
sw $8 -32($29)
# if == 0 go to: %t79 for_end_95;
# load %t79
lw $8 -32($29)
# fetch %t79 @ $8
beq $8 $0 for_end_95
nop
# for_block_96:
for_block_96:
# %t80 = a + 1;
# fetch %t80 @ $8
# load a
lw $9 -40($29)
# fetch a @ $9
addiu $8 $9 1
# save %t80
sw $8 -36($29)
# a = %t80;
# fetch a @ $9
# load %t80
lw $8 -36($29)
# fetch %t80 @ $8
addiu $9 $8 0
# save a
sw $9 -40($29)
# j = j - 1;
# fetch j @ $9
# load j
lw $9 -48($29)
# fetch j @ $9
addiu $1 $0 1
subu $9 $9 $1
# save j
sw $9 -48($29)
# GOTO for_condition_94;
j for_condition_94
nop
# for_end_95:
for_end_95:
# i = i + 1;
# fetch i @ $8
# load i
lw $8 -44($29)
# fetch i @ $8
addiu $8 $8 1
# save i
sw $8 -44($29)
# GOTO for_condition_91;
j for_condition_91
nop
# for_end_92:
for_end_92:
# PRINT_STR const_str_97;
addiu $2 $0 4
la $4 const_str_97
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -40($29)
# fetch a @ $8
addiu $4 $8 0
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
lw $8 -52($29)
lw $9 -56($29)
lw $10 -60($29)
lw $11 -64($29)
lw $12 -68($29)
lw $13 -72($29)
lw $14 -76($29)
lw $15 -80($29)
lw $16 -84($29)
lw $17 -88($29)
lw $18 -92($29)
lw $19 -96($29)
lw $20 -100($29)
lw $21 -104($29)
lw $22 -108($29)
lw $23 -112($29)
lw $24 -116($29)
lw $25 -120($29)
lw $31 -124($29)
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
# a = 1;
# fetch a @ $8
addiu $8 $0 1
# save a
sw $8 -28($29)
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
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -28($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -28($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# ch = 't';
# fetch ch @ $9
addiu $9 $0 116
# save ch
sb $9 -29($29)
# PRINT_STR const_str_9;
addiu $2 $0 4
la $4 const_str_9
syscall
# PRINT_CHAR ch;
addiu $2 $0 11
# load ch
lb $9 -29($29)
# fetch ch @ $9
addiu $4 $9 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_CHAR ch;
addiu $2 $0 11
# load ch
lb $9 -29($29)
# fetch ch @ $9
addiu $4 $9 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t10 = a + 1;
# fetch %t10 @ $10
# load a
lw $8 -28($29)
# fetch a @ $8
addiu $10 $8 1
# save %t10
sw $10 -8($29)
# a = %t10;
# fetch a @ $8
# load %t10
lw $10 -8($29)
# fetch %t10 @ $10
addiu $8 $10 0
# save a
sw $8 -28($29)
# PRINT_STR const_str_10;
addiu $2 $0 4
la $4 const_str_10
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -28($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t11 = 0;
# fetch %t11 @ $11
addiu $11 $0 0
# save %t11
sw $11 -12($29)
# %t12 = 1;
# fetch %t12 @ $11
addiu $11 $0 1
# save %t12
sw $11 -16($29)
# t[%t11] = %t12;
# load t
addiu $11 $29 -52
# fetch t @ $11
# load %t12
lw $12 -16($29)
# fetch %t12 @ $12
# load %t11
lw $13 -12($29)
# fetch %t11 @ $13
sll $1 $13 2
addu $1 $1 $11
sw $12 0($1)
# save t
# PRINT_STR const_str_11;
addiu $2 $0 4
la $4 const_str_11
syscall
# %t13 = 0;
# fetch %t13 @ $11
addiu $11 $0 0
# save %t13
sw $11 -20($29)
# %t14 = t[%t13];
# load t
addiu $11 $29 -52
# fetch t @ $11
# fetch %t14 @ $14
# load %t13
lw $15 -20($29)
# fetch %t13 @ $15
sll $1 $15 2
addu $1 $1 $11
lw $14 0($1)
# save %t14
sw $14 -24($29)
# PRINT_INT %t14;
addiu $2 $0 1
# load %t14
lw $14 -24($29)
# fetch %t14 @ $14
addiu $4 $14 0
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
# if != go to: b 0 if_false_1;
# load b
lw $8 -12($29)
# fetch b @ $8
addiu $1 $0 0
bne $8 $1 if_false_1
nop
# RET a;
# load a
lw $9 -8($29)
# fetch a @ $9
sw $9 -4($29)
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
# fetch %t0 @ $8
# load a
lw $9 -8($29)
# fetch a @ $9
# load b
lw $10 -12($29)
# fetch b @ $10
slt $8 $9 $10
# save %t0
sw $8 -16($29)
# if == 0 go to: %t0 if_false_3;
# load %t0
lw $8 -16($29)
# fetch %t0 @ $8
beq $8 $0 if_false_3
nop
# PUSH b;
# load b
lw $10 -12($29)
# fetch b @ $10
sw $10 -112($29)
# load a
lw $9 -8($29)
# fetch a @ $9
sw $9 -116($29)
# CALL gcd;
addiu $29 $29 -104
jal gcd_0
nop
addiu $29 $29 104
# GET %t1;
# fetch %t1 @ $11
# load %pass_val
lw $12 -108($29)
# fetch %pass_val @ $12
addiu $11 $12 0
# save %t1
sw $11 -20($29)
# RET %t1;
# load %t1
lw $11 -20($29)
# fetch %t1 @ $11
sw $11 -4($29)
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
# fetch %t6 @ $8
# load a
lw $9 -8($29)
# fetch a @ $9
# load b
lw $10 -12($29)
# fetch b @ $10
subu $8 $9 $10
# save %t6
sw $8 -28($29)
# PUSH %t6;
# load %t6
lw $8 -28($29)
# fetch %t6 @ $8
sw $8 -112($29)
# load b
lw $10 -12($29)
# fetch b @ $10
sw $10 -116($29)
# CALL gcd;
addiu $29 $29 -104
jal gcd_0
nop
addiu $29 $29 104
# GET %t4;
# fetch %t4 @ $11
# load %pass_val
lw $12 -108($29)
# fetch %pass_val @ $12
addiu $11 $12 0
# save %t4
sw $11 -24($29)
# RET %t4;
# load %t4
lw $11 -24($29)
# fetch %t4 @ $11
sw $11 -4($29)
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
# fetch %t62 @ $8
# load %pass_val
lw $9 -116($29)
# fetch %pass_val @ $9
addiu $8 $9 0
# save %t62
sb $8 -5($29)
# %t63 = (int)%t62;
# fetch %t63 @ $8
# load %t62
lb $9 -5($29)
# fetch %t62 @ $9
addiu $8 $9 0
# save %t63
sw $8 -12($29)
# a = %t63;
# fetch a @ $8
# load %t63
lw $10 -12($29)
# fetch %t63 @ $10
addiu $8 $10 0
# save a
sw $8 -28($29)
# %t66 = a + 0;
# fetch %t66 @ $8
# load a
lw $11 -28($29)
# fetch a @ $11
addiu $8 $11 0
# save %t66
sw $8 -20($29)
# PUSH %t66;
# load %t66
lw $8 -20($29)
# fetch %t66 @ $8
sw $8 -120($29)
# CALL fun3;
addiu $29 $29 -112
jal fun3_45
nop
addiu $29 $29 112
# GET %t64;
# fetch %t64 @ $12
# load %pass_val
lw $13 -116($29)
# fetch %pass_val @ $13
addiu $12 $13 0
# save %t64
sw $12 -16($29)
# b = %t64;
# fetch b @ $12
# load %t64
lw $13 -16($29)
# fetch %t64 @ $13
addiu $12 $13 0
# save b
sw $12 -32($29)
# PUSH a;
# load a
lw $11 -28($29)
# fetch a @ $11
sw $11 -120($29)
# load b
lw $12 -32($29)
# fetch b @ $12
sw $12 -124($29)
# CALL fun4;
addiu $29 $29 -112
jal fun4_47
nop
addiu $29 $29 112
# GET %t67;
# fetch %t67 @ $14
# load %pass_val
lw $15 -116($29)
# fetch %pass_val @ $15
addiu $14 $15 0
# save %t67
sw $14 -24($29)
# c = %t67;
# fetch c @ $14
# load %t67
lw $15 -24($29)
# fetch %t67 @ $15
addiu $14 $15 0
# save c
sw $14 -36($29)
# PRINT_STR const_str_51;
addiu $2 $0 4
la $4 const_str_51
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $11 -28($29)
# fetch a @ $11
addiu $4 $11 0
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
# load b
lw $12 -32($29)
# fetch b @ $12
addiu $4 $12 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_53;
addiu $2 $0 4
la $4 const_str_53
syscall
# PRINT_INT c;
addiu $2 $0 1
# load c
lw $14 -36($29)
# fetch c @ $14
addiu $4 $14 0
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
# fetch a @ $8
addiu $8 $0 1
# save a
sw $8 -12($29)
# if == 0 go to: a if_false_64;
# load a
lw $8 -12($29)
# fetch a @ $8
beq $8 $0 if_false_64
nop
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
# fetch %t70 @ $8
# load a
lw $9 -12($29)
# fetch a @ $9
addiu $8 $9 1
# save %t70
sw $8 -8($29)
# if == 0 go to: %t70 if_false_67;
# load %t70
lw $8 -8($29)
# fetch %t70 @ $8
beq $8 $0 if_false_67
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
# fetch %t8 @ $8
# load t
lw $9 12($28)
# fetch t @ $9
subu $8 $0 $9
# save %t8
sw $8 -8($29)
# %t9 = %t8 + 1;
# fetch %t9 @ $8
# load %t8
lw $10 -8($29)
# fetch %t8 @ $10
addiu $8 $10 1
# save %t9
sw $8 -12($29)
# t = %t9;
# fetch t @ $9
# load %t9
lw $8 -12($29)
# fetch %t9 @ $8
addiu $9 $8 0
# save t
sw $9 12($28)
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
sw $8 -52($29)
sw $9 -56($29)
sw $10 -60($29)
sw $11 -64($29)
sw $12 -68($29)
sw $13 -72($29)
sw $14 -76($29)
sw $15 -80($29)
sw $16 -84($29)
sw $17 -88($29)
sw $18 -92($29)
sw $19 -96($29)
sw $20 -100($29)
sw $21 -104($29)
sw $22 -108($29)
sw $23 -112($29)
sw $24 -116($29)
sw $25 -120($29)
sw $31 -124($29)
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
# fetch a @ $8
addiu $8 $2 0
# save a
sw $8 -24($29)
# PRINT_STR const_str_15;
addiu $2 $0 4
la $4 const_str_15
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -24($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# READ_CHAR ch;
addiu $2 $0 12
syscall
# fetch ch @ $9
addiu $9 $2 0
# save ch
sb $9 -25($29)
# PRINT_STR const_str_16;
addiu $2 $0 4
la $4 const_str_16
syscall
# PRINT_CHAR ch;
addiu $2 $0 11
# load ch
lb $9 -25($29)
# fetch ch @ $9
addiu $4 $9 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# READ_INT a;
addiu $2 $0 5
syscall
# fetch a @ $8
addiu $8 $2 0
# save a
sw $8 -24($29)
# READ_CHAR ch;
addiu $2 $0 12
syscall
# fetch ch @ $9
addiu $9 $2 0
# save ch
sb $9 -25($29)
# PRINT_STR const_str_17;
addiu $2 $0 4
la $4 const_str_17
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -24($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_18;
addiu $2 $0 4
la $4 const_str_18
syscall
# PRINT_CHAR ch;
addiu $2 $0 11
# load ch
lb $9 -25($29)
# fetch ch @ $9
addiu $4 $9 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t15 = 0;
# fetch %t15 @ $10
addiu $10 $0 0
# save %t15
sw $10 -8($29)
# %t16 = 2;
# fetch %t16 @ $10
addiu $10 $0 2
# save %t16
sw $10 -12($29)
# t[%t15] = %t16;
# load t
addiu $10 $29 -48
# fetch t @ $10
# load %t16
lw $11 -12($29)
# fetch %t16 @ $11
# load %t15
lw $12 -8($29)
# fetch %t15 @ $12
sll $1 $12 2
addu $1 $1 $10
sw $11 0($1)
# save t
# PRINT_STR const_str_19;
addiu $2 $0 4
la $4 const_str_19
syscall
# %t17 = 0;
# fetch %t17 @ $10
addiu $10 $0 0
# save %t17
sw $10 -16($29)
# %t18 = t[%t17];
# load t
addiu $10 $29 -48
# fetch t @ $10
# fetch %t18 @ $13
# load %t17
lw $14 -16($29)
# fetch %t17 @ $14
sll $1 $14 2
addu $1 $1 $10
lw $13 0($1)
# save %t18
sw $13 -20($29)
# PRINT_INT %t18;
addiu $2 $0 1
# load %t18
lw $13 -20($29)
# fetch %t18 @ $13
addiu $4 $13 0
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
lw $8 -52($29)
lw $9 -56($29)
lw $10 -60($29)
lw $11 -64($29)
lw $12 -68($29)
lw $13 -72($29)
lw $14 -76($29)
lw $15 -80($29)
lw $16 -84($29)
lw $17 -88($29)
lw $18 -92($29)
lw $19 -96($29)
lw $20 -100($29)
lw $21 -104($29)
lw $22 -108($29)
lw $23 -112($29)
lw $24 -116($29)
lw $25 -120($29)
lw $31 -124($29)
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
# fetch a @ $8
addiu $8 $0 5
# save a
sw $8 -76($29)
# b = 3;
# fetch b @ $8
addiu $8 $0 3
# save b
sw $8 -80($29)
# c = -7;
# fetch c @ $8
addiu $8 $0 -7
# save c
sw $8 -84($29)
# %t20 = 0;
# fetch %t20 @ $8
addiu $8 $0 0
# save %t20
sw $8 -8($29)
# %t21 = 3;
# fetch %t21 @ $8
addiu $8 $0 3
# save %t21
sw $8 -12($29)
# t[%t20] = %t21;
# load t
addiu $8 $29 -104
# fetch t @ $8
# load %t21
lw $9 -12($29)
# fetch %t21 @ $9
# load %t20
lw $10 -8($29)
# fetch %t20 @ $10
sll $1 $10 2
addu $1 $1 $8
sw $9 0($1)
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
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -76($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_29;
addiu $2 $0 4
la $4 const_str_29
syscall
# %t22 = -c;
# fetch %t22 @ $11
# load c
lw $12 -84($29)
# fetch c @ $12
subu $11 $0 $12
# save %t22
sw $11 -16($29)
# PRINT_INT %t22;
addiu $2 $0 1
# load %t22
lw $11 -16($29)
# fetch %t22 @ $11
addiu $4 $11 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_30;
addiu $2 $0 4
la $4 const_str_30
syscall
# %t23 = a + b;
# fetch %t23 @ $13
# load a
lw $8 -76($29)
# fetch a @ $8
# load b
lw $14 -80($29)
# fetch b @ $14
addu $13 $8 $14
# save %t23
sw $13 -20($29)
# PRINT_INT %t23;
addiu $2 $0 1
# load %t23
lw $13 -20($29)
# fetch %t23 @ $13
addiu $4 $13 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_31;
addiu $2 $0 4
la $4 const_str_31
syscall
# %t24 = b * c;
# fetch %t24 @ $15
# load b
lw $14 -80($29)
# fetch b @ $14
# load c
lw $12 -84($29)
# fetch c @ $12
mul $15 $14 $12
# save %t24
sw $15 -24($29)
# %t25 = a + %t24;
# fetch %t25 @ $15
# load a
lw $8 -76($29)
# fetch a @ $8
# save %t20
sw $10 -8($29)
# load %t24
lw $10 -24($29)
# fetch %t24 @ $10
addu $15 $8 $10
# save %t25
sw $15 -28($29)
# PRINT_INT %t25;
addiu $2 $0 1
# load %t25
lw $15 -28($29)
# fetch %t25 @ $15
addiu $4 $15 0
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
# save %t21
sw $9 -12($29)
# fetch %t26 @ $9
# save %t22
sw $11 -16($29)
# load %pass_val
lw $11 -184($29)
# fetch %pass_val @ $11
addiu $9 $11 0
# save %t26
sw $9 -32($29)
# %t29 = c + %t26;
# fetch %t29 @ $9
# load c
lw $12 -84($29)
# fetch c @ $12
# load %t26
lw $11 -32($29)
# fetch %t26 @ $11
addu $9 $12 $11
# save %t29
sw $9 -36($29)
# %t30 = b * %t29;
# fetch %t30 @ $9
# load b
lw $14 -80($29)
# fetch b @ $14
# save %t23
sw $13 -20($29)
# load %t29
lw $13 -36($29)
# fetch %t29 @ $13
mul $9 $14 $13
# save %t30
sw $9 -40($29)
# %t31 = a + %t30;
# fetch %t31 @ $9
# load a
lw $8 -76($29)
# fetch a @ $8
# save %t24
sw $10 -24($29)
# load %t30
lw $10 -40($29)
# fetch %t30 @ $10
addu $9 $8 $10
# save %t31
sw $9 -44($29)
# PRINT_INT %t31;
addiu $2 $0 1
# load %t31
lw $9 -44($29)
# fetch %t31 @ $9
addiu $4 $9 0
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
# save %t25
sw $15 -28($29)
# fetch %t32 @ $15
# save %t26
sw $11 -32($29)
# load %pass_val
lw $11 -184($29)
# fetch %pass_val @ $11
addiu $15 $11 0
# save %t32
sw $15 -48($29)
# %t35 = 0;
# fetch %t35 @ $11
addiu $11 $0 0
# save %t35
sw $11 -52($29)
# %t36 = t[%t35];
# load t
addiu $11 $29 -104
# fetch t @ $11
# fetch %t36 @ $15
# save %t29
sw $13 -36($29)
# load %t35
lw $13 -52($29)
# fetch %t35 @ $13
sll $1 $13 2
addu $1 $1 $11
lw $15 0($1)
# save %t36
sw $15 -56($29)
# %t37 = %t32 * %t36;
# fetch %t37 @ $15
# save %t30
sw $10 -40($29)
# load %t32
lw $10 -48($29)
# fetch %t32 @ $10
# save %t31
sw $9 -44($29)
# load %t36
lw $9 -56($29)
# fetch %t36 @ $9
mul $15 $10 $9
# save %t37
sw $15 -60($29)
# %t38 = c + %t37;
# fetch %t38 @ $15
# load c
lw $12 -84($29)
# fetch c @ $12
# save %t32
sw $10 -48($29)
# load %t37
lw $10 -60($29)
# fetch %t37 @ $10
addu $15 $12 $10
# save %t38
sw $15 -64($29)
# %t39 = b * %t38;
# fetch %t39 @ $15
# load b
lw $14 -80($29)
# fetch b @ $14
# save %t35
sw $13 -52($29)
# load %t38
lw $13 -64($29)
# fetch %t38 @ $13
mul $15 $14 $13
# save %t39
sw $15 -68($29)
# %t40 = a + %t39;
# fetch %t40 @ $15
# load a
lw $8 -76($29)
# fetch a @ $8
# save %t36
sw $9 -56($29)
# load %t39
lw $9 -68($29)
# fetch %t39 @ $9
addu $15 $8 $9
# save %t40
sw $15 -72($29)
# PRINT_INT %t40;
addiu $2 $0 1
# load %t40
lw $15 -72($29)
# fetch %t40 @ $15
addiu $4 $15 0
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
# PRINT_STR const_str_42;
addiu $2 $0 4
la $4 const_str_42
syscall
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
# PRINT_STR const_str_46;
addiu $2 $0 4
la $4 const_str_46
syscall
# %t57 = a + 1;
# fetch %t57 @ $8
# load a
lw $9 -8($29)
# fetch a @ $9
addiu $8 $9 1
# save %t57
sw $8 -12($29)
# PRINT_INT %t57;
addiu $2 $0 1
# load %t57
lw $8 -12($29)
# fetch %t57 @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t58 = a + 1;
# fetch %t58 @ $10
# load a
lw $9 -8($29)
# fetch a @ $9
addiu $10 $9 1
# save %t58
sw $10 -16($29)
# a = %t58;
# fetch a @ $9
# load %t58
lw $10 -16($29)
# fetch %t58 @ $10
addiu $9 $10 0
# save a
sw $9 -8($29)
# RET a;
# load a
lw $9 -8($29)
# fetch a @ $9
sw $9 -4($29)
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
# PRINT_STR const_str_48;
addiu $2 $0 4
la $4 const_str_48
syscall
# %t59 = a + b;
# fetch %t59 @ $8
# load a
lw $9 -8($29)
# fetch a @ $9
# load b
lw $10 -12($29)
# fetch b @ $10
addu $8 $9 $10
# save %t59
sw $8 -16($29)
# PRINT_INT %t59;
addiu $2 $0 1
# load %t59
lw $8 -16($29)
# fetch %t59 @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t60 = a + b;
# fetch %t60 @ $11
# load a
lw $9 -8($29)
# fetch a @ $9
# load b
lw $10 -12($29)
# fetch b @ $10
addu $11 $9 $10
# save %t60
sw $11 -20($29)
# RET %t60;
# load %t60
lw $11 -20($29)
# fetch %t60 @ $11
sw $11 -4($29)
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
# fetch c @ $8
addiu $8 $0 4
# save c
sw $8 -36($29)
# %t81 = c == 0;
# fetch %t81 @ $8
# load c
lw $9 -36($29)
# fetch c @ $9
xori $1 $9 0
sltiu $8 $1 1
# save %t81
sw $8 -8($29)
# if == 0 go to: %t81 case_end_102;
# load %t81
lw $8 -8($29)
# fetch %t81 @ $8
beq $8 $0 case_end_102
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
# fetch %t82 @ $8
# load c
lw $9 -36($29)
# fetch c @ $9
xori $1 $9 1
sltiu $8 $1 1
# save %t82
sw $8 -12($29)
# if == 0 go to: %t82 case_end_103;
# load %t82
lw $8 -12($29)
# fetch %t82 @ $8
beq $8 $0 case_end_103
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
# fetch %t83 @ $8
# load c
lw $9 -36($29)
# fetch c @ $9
xori $1 $9 2
sltiu $8 $1 1
# save %t83
sw $8 -16($29)
# if == 0 go to: %t83 case_end_104;
# load %t83
lw $8 -16($29)
# fetch %t83 @ $8
beq $8 $0 case_end_104
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
# fetch %t84 @ $8
# load c
lw $9 -36($29)
# fetch c @ $9
xori $1 $9 3
sltiu $8 $1 1
# save %t84
sw $8 -20($29)
# if == 0 go to: %t84 case_end_105;
# load %t84
lw $8 -20($29)
# fetch %t84 @ $8
beq $8 $0 case_end_105
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
# fetch %t85 @ $8
# load c
lw $9 -36($29)
# fetch c @ $9
xori $1 $9 4
sltiu $8 $1 1
# save %t85
sw $8 -24($29)
# if == 0 go to: %t85 case_end_106;
# load %t85
lw $8 -24($29)
# fetch %t85 @ $8
beq $8 $0 case_end_106
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
# fetch %t86 @ $8
# load c
lw $9 -36($29)
# fetch c @ $9
xori $1 $9 5
sltiu $8 $1 1
# save %t86
sw $8 -28($29)
# if == 0 go to: %t86 case_end_107;
# load %t86
lw $8 -28($29)
# fetch %t86 @ $8
beq $8 $0 case_end_107
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
# fetch %t87 @ $8
# load c
lw $9 -36($29)
# fetch c @ $9
xori $1 $9 6
sltiu $8 $1 1
# save %t87
sw $8 -32($29)
# if == 0 go to: %t87 case_end_108;
# load %t87
lw $8 -32($29)
# fetch %t87 @ $8
beq $8 $0 case_end_108
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
# fetch num @ $8
addiu $8 $0 -1
# save num
sw $8 -40($29)
# GOTO for_block_116;
j for_block_116
nop
# for_condition_114:
for_condition_114:
# %t89 = num < 5;
# fetch %t89 @ $8
# load num
lw $9 -40($29)
# fetch num @ $9
addiu $1 $0 5
slti $8 $9 5
# save %t89
sw $8 -8($29)
# if == 0 go to: %t89 for_end_115;
# load %t89
lw $8 -8($29)
# fetch %t89 @ $8
beq $8 $0 for_end_115
nop
# for_block_116:
for_block_116:
# %t90 = num == -1;
# fetch %t90 @ $8
# load num
lw $9 -40($29)
# fetch num @ $9
xori $1 $9 -1
sltiu $8 $1 1
# save %t90
sw $8 -12($29)
# if == 0 go to: %t90 case_end_118;
# load %t90
lw $8 -12($29)
# fetch %t90 @ $8
beq $8 $0 case_end_118
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
# fetch %t92 @ $8
# load num
lw $9 -40($29)
# fetch num @ $9
xori $1 $9 0
sltiu $8 $1 1
# save %t92
sw $8 -16($29)
# if == 0 go to: %t92 case_end_119;
# load %t92
lw $8 -16($29)
# fetch %t92 @ $8
beq $8 $0 case_end_119
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
# fetch %t93 @ $8
# load num
lw $9 -40($29)
# fetch num @ $9
xori $1 $9 1
sltiu $8 $1 1
# save %t93
sw $8 -20($29)
# if == 0 go to: %t93 case_end_120;
# load %t93
lw $8 -20($29)
# fetch %t93 @ $8
beq $8 $0 case_end_120
nop
# i = 0;
# fetch i @ $10
addiu $10 $0 0
# save i
sw $10 -36($29)
# GOTO for_block_123;
j for_block_123
nop
# for_condition_121:
for_condition_121:
# %t94 = i < 2;
# fetch %t94 @ $8
# load i
lw $9 -36($29)
# fetch i @ $9
addiu $1 $0 2
slti $8 $9 2
# save %t94
sw $8 -24($29)
# if == 0 go to: %t94 for_end_122;
# load %t94
lw $8 -24($29)
# fetch %t94 @ $8
beq $8 $0 for_end_122
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
# fetch i @ $8
# load i
lw $8 -36($29)
# fetch i @ $8
addiu $8 $8 1
# save i
sw $8 -36($29)
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
# fetch %t95 @ $8
# load num
lw $9 -40($29)
# fetch num @ $9
xori $1 $9 2
sltiu $8 $1 1
# save %t95
sw $8 -28($29)
# if == 0 go to: %t95 case_end_124;
# load %t95
lw $8 -28($29)
# fetch %t95 @ $8
beq $8 $0 case_end_124
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
# fetch %t96 @ $8
# load num
lw $9 -40($29)
# fetch num @ $9
xori $1 $9 3
sltiu $8 $1 1
# save %t96
sw $8 -32($29)
# if == 0 go to: %t96 case_end_127;
# load %t96
lw $8 -32($29)
# fetch %t96 @ $8
beq $8 $0 case_end_127
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
# fetch num @ $8
# load num
lw $8 -40($29)
# fetch num @ $8
addiu $8 $8 1
# save num
sw $8 -40($29)
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
# fetch i @ $8
addiu $8 $0 0
# save i
sw $8 -84($29)
# GOTO for_block_135;
j for_block_135
nop
# for_condition_133:
for_condition_133:
# %t97 = i < 5;
# fetch %t97 @ $8
# load i
lw $9 -84($29)
# fetch i @ $9
addiu $1 $0 5
slti $8 $9 5
# save %t97
sw $8 -48($29)
# if == 0 go to: %t97 for_end_134;
# load %t97
lw $8 -48($29)
# fetch %t97 @ $8
beq $8 $0 for_end_134
nop
# for_block_135:
for_block_135:
# %t98 = i;
# fetch %t98 @ $8
# load i
lw $9 -84($29)
# fetch i @ $9
addiu $8 $9 0
# save %t98
sw $8 -52($29)
# %t99 = i;
# fetch %t99 @ $8
# load i
lw $9 -84($29)
# fetch i @ $9
addiu $8 $9 0
# save %t99
sw $8 -56($29)
# a[%t98] = %t99;
# load a
addiu $8 $29 -76
# fetch a @ $8
# load %t99
lw $10 -56($29)
# fetch %t99 @ $10
# load %t98
lw $11 -52($29)
# fetch %t98 @ $11
sll $1 $11 2
addu $1 $1 $8
sw $10 0($1)
# save a
# PRINT_STR const_str_136;
addiu $2 $0 4
la $4 const_str_136
syscall
# %t100 = i;
# fetch %t100 @ $8
# load i
lw $9 -84($29)
# fetch i @ $9
addiu $8 $9 0
# save %t100
sw $8 -8($29)
# %t101 = a[%t100];
# load a
addiu $8 $29 -76
# fetch a @ $8
# fetch %t101 @ $12
# load %t100
lw $13 -8($29)
# fetch %t100 @ $13
sll $1 $13 2
addu $1 $1 $8
lw $12 0($1)
# save %t101
sw $12 -12($29)
# PRINT_INT %t101;
addiu $2 $0 1
# load %t101
lw $12 -12($29)
# fetch %t101 @ $12
addiu $4 $12 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# i = i + 1;
# fetch i @ $9
# load i
lw $9 -84($29)
# fetch i @ $9
addiu $9 $9 1
# save i
sw $9 -84($29)
# GOTO for_condition_133;
j for_condition_133
nop
# for_end_134:
for_end_134:
# %t102 = 0;
# fetch %t102 @ $8
addiu $8 $0 0
# save %t102
sw $8 -16($29)
# %t103 = 'a';
# fetch %t103 @ $8
addiu $8 $0 97
# save %t103
sb $8 -17($29)
# ch[%t102] = %t103;
# load ch
addiu $8 $29 -78
# fetch ch @ $8
# load %t103
lb $9 -17($29)
# fetch %t103 @ $9
# load %t102
lw $10 -16($29)
# fetch %t102 @ $10
addu $1 $8 $10
sb $9 0($1)
# save ch
# PRINT_STR const_str_137;
addiu $2 $0 4
la $4 const_str_137
syscall
# %t104 = 0;
# fetch %t104 @ $8
addiu $8 $0 0
# save %t104
sw $8 -24($29)
# %t105 = ch[%t104];
# load ch
addiu $8 $29 -78
# fetch ch @ $8
# fetch %t105 @ $11
# load %t104
lw $12 -24($29)
# fetch %t104 @ $12
addu $1 $8 $12
lb $11 0($1)
# save %t105
sb $11 -25($29)
# PRINT_CHAR %t105;
addiu $2 $0 11
# load %t105
lb $11 -25($29)
# fetch %t105 @ $11
addiu $4 $11 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t106 = 1;
# fetch %t106 @ $13
addiu $13 $0 1
# save %t106
sw $13 -32($29)
# %t108 = (char)98;
# fetch %t108 @ $13
addiu $13 $0 98
# save %t108
sb $13 -34($29)
# %t107 = %t108;
# fetch %t107 @ $13
# load %t108
lb $14 -34($29)
# fetch %t108 @ $14
addiu $13 $14 0
# save %t107
sb $13 -33($29)
# ch[%t106] = %t107;
# load ch
addiu $8 $29 -78
# fetch ch @ $8
# load %t107
lb $13 -33($29)
# fetch %t107 @ $13
# load %t106
lw $15 -32($29)
# fetch %t106 @ $15
addu $1 $8 $15
sb $13 0($1)
# save ch
# PRINT_STR const_str_138;
addiu $2 $0 4
la $4 const_str_138
syscall
# %t109 = 1;
# fetch %t109 @ $8
addiu $8 $0 1
# save %t109
sw $8 -40($29)
# %t110 = ch[%t109];
# load ch
addiu $8 $29 -78
# fetch ch @ $8
# save %t102
sw $10 -16($29)
# fetch %t110 @ $10
# save %t103
sb $9 -17($29)
# load %t109
lw $9 -40($29)
# fetch %t109 @ $9
addu $1 $8 $9
lb $10 0($1)
# save %t110
sb $10 -41($29)
# PRINT_CHAR %t110;
addiu $2 $0 11
# load %t110
lb $10 -41($29)
# fetch %t110 @ $10
addiu $4 $10 0
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
# a = 1;
# fetch a @ $8
addiu $8 $0 1
# save a
sw $8 -60($29)
# PRINT_STR const_str_145;
addiu $2 $0 4
la $4 const_str_145
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -60($29)
# fetch a @ $8
addiu $4 $8 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t111 = 0;
# fetch %t111 @ $9
addiu $9 $0 0
# save %t111
sw $9 -8($29)
# %t113 = a + 1;
# fetch %t113 @ $9
# load a
lw $8 -60($29)
# fetch a @ $8
addiu $9 $8 1
# save %t113
sw $9 -16($29)
# %t112 = %t113;
# fetch %t112 @ $9
# load %t113
lw $10 -16($29)
# fetch %t113 @ $10
addiu $9 $10 0
# save %t112
sw $9 -12($29)
# _t0[%t111] = %t112;
# load _t0
addiu $9 $29 -56
# fetch _t0 @ $9
# load %t112
lw $11 -12($29)
# fetch %t112 @ $11
# load %t111
lw $12 -8($29)
# fetch %t111 @ $12
sll $1 $12 2
addu $1 $1 $9
sw $11 0($1)
# save _t0
# PRINT_STR const_str_146;
addiu $2 $0 4
la $4 const_str_146
syscall
# %t114 = 0;
# fetch %t114 @ $9
addiu $9 $0 0
# save %t114
sw $9 -20($29)
# %t115 = _t0[%t114];
# load _t0
addiu $9 $29 -56
# fetch _t0 @ $9
# fetch %t115 @ $13
# load %t114
lw $14 -20($29)
# fetch %t114 @ $14
sll $1 $14 2
addu $1 $1 $9
lw $13 0($1)
# save %t115
sw $13 -24($29)
# PRINT_INT %t115;
addiu $2 $0 1
# load %t115
lw $13 -24($29)
# fetch %t115 @ $13
addiu $4 $13 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# %t116 = 0;
# fetch %t116 @ $15
addiu $15 $0 0
# save %t116
sw $15 -28($29)
# %t117 = _t0[%t116];
# load _t0
addiu $9 $29 -56
# fetch _t0 @ $9
# fetch %t117 @ $15
# save %t111
sw $12 -8($29)
# load %t116
lw $12 -28($29)
# fetch %t116 @ $12
sll $1 $12 2
addu $1 $1 $9
lw $15 0($1)
# save %t117
sw $15 -32($29)
# %t118 = %t117 + 1;
# fetch %t118 @ $15
# save %t112
sw $11 -12($29)
# load %t117
lw $11 -32($29)
# fetch %t117 @ $11
addiu $15 $11 1
# save %t118
sw $15 -36($29)
# a = %t118;
# fetch a @ $8
# load %t118
lw $15 -36($29)
# fetch %t118 @ $15
addiu $8 $15 0
# save a
sw $8 -60($29)
# PRINT_STR const_str_147;
addiu $2 $0 4
la $4 const_str_147
syscall
# PRINT_INT a;
addiu $2 $0 1
# load a
lw $8 -60($29)
# fetch a @ $8
addiu $4 $8 0
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
# PRINT_STR const_str_150;
addiu $2 $0 4
la $4 const_str_150
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PUSH a;
# load a
lw $8 -8($29)
# fetch a @ $8
sw $8 -116($29)
# load b
lw $9 -12($29)
# fetch b @ $9
sw $9 -120($29)
# CALL gcd;
addiu $29 $29 -108
jal gcd_0
nop
addiu $29 $29 108
# GET %t119;
# fetch %t119 @ $10
# load %pass_val
lw $11 -112($29)
# fetch %pass_val @ $11
addiu $10 $11 0
# save %t119
sw $10 -16($29)
# c = %t119;
# fetch c @ $10
# load %t119
lw $11 -16($29)
# fetch %t119 @ $11
addiu $10 $11 0
# save c
sw $10 -28($29)
# %t122 = a * b;
# fetch %t122 @ $10
# load a
lw $8 -8($29)
# fetch a @ $8
# load b
lw $9 -12($29)
# fetch b @ $9
mul $10 $8 $9
# save %t122
sw $10 -20($29)
# %t123 = %t122 / c;
# fetch %t123 @ $10
# load %t122
lw $12 -20($29)
# fetch %t122 @ $12
# load c
lw $13 -28($29)
# fetch c @ $13
div $12 $13
mflo $10
# save %t123
sw $10 -24($29)
# t = %t123;
# fetch t @ $10
# load %t123
lw $14 -24($29)
# fetch %t123 @ $14
addiu $10 $14 0
# save t
sw $10 -32($29)
# PRINT_STR const_str_151;
addiu $2 $0 4
la $4 const_str_151
syscall
# PRINT_INT c;
addiu $2 $0 1
# load c
lw $13 -28($29)
# fetch c @ $13
addiu $4 $13 0
syscall
# PRINT_CHAR '\n?';
addiu $2 $0 11
addiu $4 $0 10
syscall
# PRINT_STR const_str_152;
addiu $2 $0 4
la $4 const_str_152
syscall
# PRINT_INT t;
addiu $2 $0 1
# load t
lw $10 -32($29)
# fetch t @ $10
addiu $4 $10 0
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
