#include "stdafx.h"

using namespace SymbolUtils;

SymbolTable::SymbolTable(SymbolTable* p) {
    parent = p;
}

bool SymbolTable::add_map(string name, Symbol* sym) {
	symbol_hash[name] = sym;
	return true;
}

bool SymbolTable::in_map(string name) {
    if (parent == NULL) {
        return symbol_hash.find(name) != symbol_hash.end();
    } else {
        return (symbol_hash.find(name) != symbol_hash.end()) || (parent->in_map(name));
    }
}

bool SymbolTable::in_current_map(string & name) {
    return symbol_hash.find(name) != symbol_hash.end();
}

Symbol* SymbolTable::get_sym(string name) {
    if (symbol_hash.find(name) != symbol_hash.end()) {
	    return symbol_hash[name];
    } else {
        if (parent != NULL) {
            return parent->get_sym(name);
        } else {
            return NULL;
        }
    }
}

void SymbolTable::display() {
    for (symbol_map::iterator iter = symbol_hash.begin();
        iter != symbol_hash.end(); iter++) {
        cout << "key: " << iter->first << "; ";
        iter->second->display();
    }
}

sym_list SymbolTable::get_all(int starting_id) {
    sym_list l;
    int id = starting_id;
    for (symbol_map::iterator iter = symbol_hash.begin();
        iter != symbol_hash.end(); iter++) {
        iter->second->id = id++;
        l.push_back(iter->second);
    }
    return l;
}

sym_list SymbolTable::get_closure(Symbol* func_sym) {
	sym_list l = get_all();
	int id = l.size();
	sym_list l_f = func_sym->symbol_table->get_all(id);
	l.insert(l.end(), l_f.begin(), l_f.end());
	cout << func_sym->name << " closure size: " << l.size() << endl;
	return l;
}