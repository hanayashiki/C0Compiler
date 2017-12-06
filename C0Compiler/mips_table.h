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
 
    reg_map* global_map; // 对象-局部寄存器分配
    reg_map* temp_map;   // 对象-全局寄存器分配

    mem_map* stack_map;  // 局部变量偏移量
    mem_map* root_map;   // 全局变量偏移量
    vector<Symbol*> reg_distrb;  // 寄存器分配情况
    void display_temp_map();
    // 获得 Symbol 的寄存器
    int fetch_symbol(Symbol*, bool load_value=true);

    void alloc_stack(Symbol*);
    int alloc_temp_reg(Symbol*);
    void map_sym_reg(Symbol* sym, int reg, reg_map* map);
    int temp_write_back();

    int stack_increment(Symbol* sym);

    static bool p_compare(p & a, p & b);
    void display_stack();
    // 策略
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