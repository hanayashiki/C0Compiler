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
 
    reg_map* global_map; // �ֲ��Ĵ�������
    reg_map* temp_map;   // ȫ�ּĴ�������

    mem_map* stack_map;  // �ֲ�����ƫ����
    mem_map* root_map;   // ȫ�ֱ���ƫ����

    void alloc_stack(Symbol*);

    int get_sym(Symbol*);
    int stack_increment(Symbol* sym);
    // ��� Symbol �ļĴ���
    static bool p_compare(p & a, p & b);
    void display_stack();
};