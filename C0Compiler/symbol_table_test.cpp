#include "stdafx.h"

using namespace std;

int main_symbol_table_test() {
	SymbolTable sym_table;
    Symbol symbol("foo", Symbol::INT);
	symbol.id = 233;
	sym_table.add_map("fuck", &symbol);
	cout << sym_table.get_sym("fuck")->id;
	sym_table.add_map("fuckshit", &symbol);
	cout << sym_table.get_sym("fuckshit")->id;
	getchar();
	return 0;
}