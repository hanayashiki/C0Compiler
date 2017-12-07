#include "stdafx.h"
#define MC MipsCode

MipsData::MipsData(sym_list* str_t, SymbolTable* sym_t) 
    : string_table(str_t), symbol_table(sym_t)
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