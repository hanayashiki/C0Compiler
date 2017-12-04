#pragma once
#include "stdafx.h"

class MipsTable {
public:
    MipsTable(Symbol* func_sym, SymbolTable* symbol_table);
    ~MipsTable();

    typedef hash_map<Symbol*, int> reg_map;
    typedef hash_map<Symbol*, int> mem_map;
 
    reg_map* global_map; // �ֲ��Ĵ�������
    reg_map* temp_map;   // ȫ�ּĴ�������
    mem_map* stack_map;  // �ֲ�����ƫ����
    mem_map* root_map;   // ȫ�ֱ���ƫ����

    bool alloc_global(Symbol*);
    // �����㷨ָ���Ĵ�������
    int get_sym(Symbol*);
    // ��� Symbol �ļĴ���
};