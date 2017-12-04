#include "stdafx.h"
#include <hash_map>  
#include "hash_utils.h"

using namespace std;  
using namespace stdext;  
using namespace SymbolUtils;

class Symbol;

typedef hash_map<string, Symbol*, hash_compare<string, string_less>> symbol_map;

class SymbolTable {
public:
    symbol_map symbol_hash;
    SymbolTable* parent;
    SymbolTable(SymbolTable* parent = NULL);
	bool add_map(string name, Symbol* sym);
    bool in_map(string name);
    bool in_current_map(string & name);
	Symbol* get_sym(string name);
    sym_list get_all();
    void display();
};