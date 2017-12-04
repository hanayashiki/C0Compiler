#pragma once
#include "stdafx.h"
typedef pair<int, Symbol*> p;
class MipsTable {
private:
    int stack_size;
public:
    
    MipsTable(Symbol* func_sym, SymbolTable* symbol_table);
    ~MipsTable();

    Symbol* ret_sym;

    typedef hash_map<Symbol*, int> reg_map;
    typedef hash_map<Symbol*, int> mem_map;
 
    reg_map* global_map; // 局部寄存器分配
    reg_map* temp_map;   // 全局寄存器分配

    mem_map* stack_map;  // 局部变量偏移量
    mem_map* root_map;   // 全局变量偏移量

    void alloc_stack(Symbol*);

    int get_sym(Symbol*);
    int stack_increment(Symbol* sym);
    // 获得 Symbol 的寄存器
    static bool p_compare(p & a, p & b);
    void display_stack();
};