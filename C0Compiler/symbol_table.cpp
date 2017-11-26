#include "stdafx.h"

bool SymbolTable::add_map(string name, Symbol* sym) {
	symbol_hash[name] = sym;
	return true;
}

Symbol* SymbolTable::get_sym(string name) {
	return symbol_hash[name];
}

void SymbolTable::display() {
    for (symbol_map::iterator iter = symbol_hash.begin();
        iter != symbol_hash.end(); iter++) {
        cout << "key: " << iter->first << "; ";
        iter->second->display();
    }
}