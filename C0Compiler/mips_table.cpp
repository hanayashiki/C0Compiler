#include "stdafx.h"
#include <algorithm>

using namespace SymbolUtils;

MipsTable::MipsTable(Symbol* func_sym, 
    SymbolTable* symbol_table) {
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
    ret_sym = new Symbol("%ret_val", func_sym->type);
    alloc_stack(ret_sym);
    // alloc space for local variables
    cout << symbol_list.size() << endl;
    cout << param_list.size() << endl;
    sym_list symbol_left = diff(symbol_list, param_list, true);
    // watch out! param_list in this scope is sorted
    for (sym_list::iterator iter_p = symbol_left.begin();
        iter_p != symbol_left.end();
        iter_p++) {
        if (((*iter_p)->type == Symbol::INT) ||
           ((*iter_p)->type == Symbol::CHAR)) {
            alloc_stack(*iter_p);
        }
    }

}

MipsTable::~MipsTable() {
    delete stack_map;
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