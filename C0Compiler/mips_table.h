#pragma once
#include "stdafx.h"

class MipsTable {
private:
    int stack_size;
public:
    typedef pair<int, Symbol*> p;
    typedef vector<Quaterion>::iterator q_ptr;
    typedef vector<MipsCode> m_list;

    QuaterionTable* q_table;

    MipsTable(Symbol* func_sym, SymbolTable* symbol_table,
        QuaterionTable* q);
    q_ptr q_iter;
    ~MipsTable();
    void init_regs();

    Symbol* ret_sym;

    typedef hash_map<Symbol*, int> reg_map;
    typedef hash_map<Symbol*, int> mem_map;
 
    reg_map* global_map; // ����-�ֲ��Ĵ�������
    reg_map* temp_map;   // ����-ȫ�ּĴ�������

    mem_map* stack_map;  // �ֲ�����ƫ����
    mem_map* root_map;   // ȫ�ֱ���ƫ����
    vector<Symbol*> reg_distrb;  // �Ĵ����������
    void display_temp_map();
    // ��� Symbol �ļĴ���
    int fetch_symbol(Symbol*, bool load_value=true);

    void alloc_stack(Symbol*);
    int alloc_temp_reg(Symbol*);
    void map_sym_reg(Symbol* sym, int reg, reg_map* map);
    int temp_write_back();

    int stack_increment(Symbol* sym);

    static bool p_compare(p & a, p & b);
    void display_stack();
    // ����
    Symbol* findUselessSymbol();
    // utils
    static void init_opt_info(q_ptr & qp);
    // tranlationsd
    void translate_all();

    void translate(Quaterion & q);
    void commutative_translate(Quaterion & q);
    void incommutative_translate(Quaterion & q);
    void branch_translate(Quaterion & q);
    void move_translate(Quaterion & q);
    void label_translate(Quaterion & q);
    void array_read_translate(Quaterion & q);
    void array_write_translate(Quaterion & q);

    void print_translate(Quaterion & q);

    void load_symbol(Symbol* sym);
    void save_symbol(Symbol* sym);
};