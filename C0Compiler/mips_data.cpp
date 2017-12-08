#include "stdafx.h"
#define MC MipsCode
#define MT MipsTable

MipsData::MipsData(sym_list* str_t, SymbolTable* sym_t, mem_map* r_m) 
    : string_table(str_t), symbol_table(sym_t), root_map(r_m)
{
}

void MipsData::dump_data() {
    MC::_data();
    dump_string();
}

void MipsData::dump_string() {
    for (sym_list::iterator iter = string_table->begin();
        iter != string_table->end(); iter++) {
        MC::_asciiz((*iter)->name, (*iter)->string_content);
    }
}

void MipsData::map_root() {
    int heap_size = 0;
    for (symbol_map::iterator iter = symbol_table->symbol_hash.begin();
        iter != symbol_table->symbol_hash.end(); iter++) {
        Symbol * sym = iter->second;
        if (in_mem(sym)) {
            heap_size = MT::alignment(heap_size, get_simple_size(sym));
            (*root_map)[iter->second] = heap_size;
            cout << "Map " << sym->name << " at " << heap_size << ":";
            if (!sym->array_flag) {
                heap_size += get_simple_size(sym);
            } else {
                heap_size += sym->array_length * get_simple_size(sym);
            }
            cout << heap_size << endl;
        }
    }
}