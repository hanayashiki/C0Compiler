#pragma once
#include "stdafx.h"

class MipsTable {
private:
    int stack_size;
    int dig_size;
    int reserved_reg_ptr; // 指向被保存寄存器的顶端
    Symbol * func;
    Symbol * pass_sym; // 被调用的函数返回的对象
public:
    typedef pair<int, Symbol*> p;
    typedef vector<Quaterion>::iterator q_ptr;
    typedef vector<MipsCode> m_list;

    QuaterionTable* q_table;

    MipsTable(Symbol* func_sym, SymbolTable* symbol_table,
        QuaterionTable* q, mem_map* r_m);
    q_ptr q_iter;   // 翻译指针
    ~MipsTable();
    void init_regs();

    Symbol* ret_sym;   // 函数返回的对象的指针
 
    reg_map* global_map; // 对象-局部寄存器分配
    reg_map* temp_map;   // 对象-全局寄存器分配

    mem_map* stack_map;  // 局部变量偏移量
    mem_map* root_map;   // 全局变量偏移量
    vector<Symbol*> reg_distrb;  // 寄存器分配情况

    // 获得 Symbol 的寄存器
    int fetch_symbol(Symbol*, bool load_value=true);

    void alloc_stack(Symbol*);
    int alloc_temp_reg(Symbol*);
    void map_sym_reg(Symbol* sym, int reg, reg_map* map);
    int temp_write_back();
    void unmap_all_regs();
    /*void write_back_root_vars();
    void write_back_all_vars();*/
    void reserve_regs();
    void reload_regs();

    int stack_increment(Symbol* sym);

    static bool p_compare(p & a, p & b);
    void display_stack();
    // 策略
    Symbol* findUselessSymbol();
    // utils
    static void init_opt_info(q_ptr & qp);
    static int alignment(int size, int augment);
    void display_temp_map();
    vector<Quaterion>::iterator get_base(Symbol* func_sym);
    int dig_up(int augment);
    int reg_of(Symbol* sym);

    int precompute(int op, int left, int right);
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
    void minus_translate(Quaterion & q);

    void push_translate();
    void call_func_translate(Quaterion & q);
    void return_translate(Quaterion & q);
    void get_translate(Quaterion & q);

    void print_translate(Quaterion & q);
    void scanf_translate(Quaterion & q);

    void load_symbol(Symbol* sym);
    void save_symbol(Symbol* sym);

    static void exit();
};