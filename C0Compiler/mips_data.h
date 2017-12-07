#include "stdafx.h"

class MipsData {
public:
    typedef vector<Symbol*> sym_list;
    sym_list * string_table;
    SymbolTable * symbol_table;
    MipsData(sym_list* str_t, SymbolTable* sym_t);
    void dump_data();
    void dump_string();
};