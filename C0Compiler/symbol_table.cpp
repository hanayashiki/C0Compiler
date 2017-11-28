#include "stdafx.h"

SymbolTable::SymbolTable(SymbolTable* p) {
    parent = p;
}

bool SymbolTable::add_map(string name, Symbol* sym) {
	symbol_hash[name] = sym;
	return true;
}

bool SymbolTable::in_map(string name) {
    return symbol_hash.find(name) != symbol_hash.end();
}

Symbol* SymbolTable::get_sym(string name) {
    if (in_map(name)) {
	    return symbol_hash[name];
    } else {
        return NULL;
    }
}

void SymbolTable::display() {
    for (symbol_map::iterator iter = symbol_hash.begin();
        iter != symbol_hash.end(); iter++) {
        cout << "key: " << iter->first << "; ";
        iter->second->display();
    }
}

