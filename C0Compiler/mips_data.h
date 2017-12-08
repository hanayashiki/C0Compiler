#include "stdafx.h"

class MipsData {
public:
    typedef vector<Symbol*> sym_list;
    sym_list * string_table;
    SymbolTable * symbol_table;
    mem_map * root_map;
    MipsData(sym_list* str_t, SymbolTable* sym_t,
        mem_map * r_m);
    void dump_data();
    void dump_string();
    void map_root();
};