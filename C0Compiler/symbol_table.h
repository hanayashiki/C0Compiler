#include "stdafx.h"
#include <hash_map>  
#include "hash_utils.h"

using namespace std;  
using namespace stdext;  

class Symbol;

typedef hash_map<string, Symbol*, hash_compare<string, string_less>> symbol_map;

class SymbolTable {
private:
	symbol_map symbol_hash;
public:
    SymbolTable* parent;
    SymbolTable(SymbolTable* parent = NULL);
	bool add_map(string name, Symbol* sym);
    bool in_map(string name);
	Symbol* get_sym(string name);
    void display();
};