#pragma once
#include "stdafx.h"

class MipsTable {
public:
    MipsTable(Symbol* func_sym, SymbolTable* symbol_table);
    ~MipsTable();

    typedef hash_map<Symbol*, int> reg_map;
    typedef hash_map<Symbol*, int> mem_map;
 
    reg_map* global_map; // 局部寄存器分配
    reg_map* temp_map;   // 全局寄存器分配
    mem_map* stack_map;  // 局部变量偏移量
    mem_map* root_map;   // 全局变量偏移量

    bool alloc_global(Symbol*);
    // 其他算法指定寄存器分配
    int get_sym(Symbol*);
    // 获得 Symbol 的寄存器
};