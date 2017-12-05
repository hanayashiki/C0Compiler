#include "stdafx.h"
#include <algorithm>

#define REG_COUNT 32
#define MC MipsCode

using namespace SymbolUtils;

MipsTable::MipsTable(Symbol* func_sym, 
    SymbolTable* symbol_table,
    QuaterionTable* q): q_table(q) {
    
    init_regs();

    stack_size = 0;
    SymbolTable* func_sym_table = func_sym->symbol_table;
    sym_list param_list = func_sym->parameter_type_list;
    sym_list symbol_list = func_sym_table->get_all();

    stack_map = new mem_map;

    // alloc stack space for parameters
    for (sym_list::iterator iter_p = param_list.begin();
        iter_p != param_list.end();
        iter_p++) {
        alloc_stack(*iter_p);
    }
    // alloc space for return value
    if (func_sym->type != Symbol::VOID) {
        ret_sym = new Symbol("%ret_val", func_sym->type);
        alloc_stack(ret_sym);
    }
        
    // alloc space for local variables

    sym_list symbol_left = diff(symbol_list, param_list, true);
    // watch out! param_list in this scope is sorted
    for (sym_list::iterator iter_p = symbol_left.begin();
        iter_p != symbol_left.end();
        iter_p++) {
        if (((*iter_p)->type == Symbol::INT) ||
           ((*iter_p)->type == Symbol::CHAR)) {
            if ((*iter_p)->const_flag == false) {
                 alloc_stack(*iter_p);
            }
        }
    }
    // alloc space for registers
    // ....

}

void MipsTable::init_regs() {
    global_map = new reg_map();
    temp_map = new reg_map();
    reg_distrb = vector<Symbol*>(REG_COUNT, NULL);
}

MipsTable::~MipsTable() {
    delete stack_map;
    delete global_map;
    delete temp_map;
}

int MipsTable::stack_increment(Symbol* sym) {
    const int INT_SIZE = 4;
    const int CHAR_SIZE = 1;
    int ptr = 0;
    int single_size = 0;

    sym->display();
    
    if (sym->type == Symbol::INT) {
        single_size = 4;
    } else if (sym->type == Symbol::CHAR) {
        single_size = 1;
    }
    // alignment
    stack_size = ((stack_size + single_size - 1) 
        / single_size * single_size);

    ptr = stack_size;
    // increment
    if (!(sym->array_flag)) {
        stack_size += INT_SIZE;
    } else {
        stack_size += INT_SIZE * (sym->array_length);
    }

    return ptr;
}

void MipsTable::alloc_stack(Symbol* sym) {
    int ptr = stack_increment(sym);
    stack_map->insert(mem_map::value_type(sym, ptr));
}


bool MipsTable::p_compare(p & a, p & b) {
    return a.first < b.first;
}

void MipsTable::display_stack() {
    vector<p> list;
    for (mem_map::iterator iter_s = stack_map->begin();
        iter_s != stack_map->end(); iter_s++) {
            list.push_back(p(
                iter_s->second,
                iter_s->first
            ));

    }

    sort(list.begin(), list.end(), p_compare); 
    // 被外界调用了，要加 static！
    
    for (vector<p>::iterator iter = list.begin();
        iter != list.end(); iter++) {
        printf("@%04x: %s\n", iter->first,
            iter->second->name.c_str());
    }
}

int MipsTable::fetch_symbol(Symbol* sym, bool load_value) {
    // 注意全局变量的处理
    int reg;
    reg_map::iterator iter;
    iter = temp_map->find(sym);
    if ((iter != temp_map->end()) && (iter->second != 0)) {
        // already distributed
        reg = iter->second;
    } else {
        if (reg = alloc_temp_reg(sym)) {
            if (load_value) {
                load_symbol(sym);
            }
        } else {
            temp_write_back();
            // mips code here
            reg = alloc_temp_reg(sym);  
        }
        
    }
    display_temp_map();
    //cout << sym->name << " at $" << reg << "; " << endl;
    return reg;
}

int MipsTable::alloc_temp_reg(Symbol* sym) {
    for (int idx = MC::_t0; idx <= MC::_t7; idx++) {
        //cout << reg_distrb.at(idx) << endl;
        if (reg_distrb.at(idx) == NULL) {
            map_sym_reg(sym, idx, temp_map);
            return idx;
        }
    }
    return 0;
}

int MipsTable::temp_write_back() {
    // naive strategy, until the next jump,
    // a symbol that will not be used will be written back to
    // memory
    Symbol* to_write_back = findUselessSymbol();

    save_symbol(to_write_back);
    map_sym_reg(to_write_back, 0, temp_map);
    // map to zero is unmapping
    
    return 0;
}

void MipsTable::map_sym_reg(Symbol* sym, int reg, reg_map* map) {
    reg_map::iterator iter;
    iter = map->find(sym);
    int old_reg = 0;
    if (iter == map->end()) {
        map->insert(reg_map::value_type(sym, reg));
    } else {
        old_reg = iter->second;
        iter->second = reg;
    }
    if (reg != 0) {
        reg_distrb.at(reg) = sym;
    } else {
        reg_distrb.at(old_reg) = NULL;
    }

 }

void MipsTable::load_symbol(Symbol* sym) {
    if (sym->type == Symbol::INT) {
        MC::lw((*temp_map)[sym], (*stack_map)[sym]);
    }
    if (sym->type == Symbol::CHAR) {
        MC::lb((*temp_map)[sym], (*stack_map)[sym]);
    }
}

void MipsTable::save_symbol(Symbol* sym) {
    if (sym->type == Symbol::INT) {
        MC::sw((*temp_map)[sym], (*stack_map)[sym]);
    }
    if (sym->type == Symbol::CHAR) {
        MC::sb((*temp_map)[sym], (*stack_map)[sym]);
    }
}