#include "stdafx.h"

MipsTable::MipsTable(Symbol* func_sym, 
    SymbolTable* symbol_table) {
    SymbolTable* func_sym_table = func_sym->symbol_table;
    vector<Symbol*> param_list = func_sym->parameter_type_list;

    symbol_map::iterator sym_iter = func_sym_table->symbol_hash.begin();

}