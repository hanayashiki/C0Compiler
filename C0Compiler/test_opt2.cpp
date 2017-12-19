#include "stdafx.h"

int main() {
	Lexer lexer;
	SymbolTable symbol_table;
	QuaterionTable q_table;
	FILE* f = fopen("dag_1.txt", "r");
	Quaterion::dump_file = stdout;
	lexer.setSource(f);
	Syntax syntax(&lexer, &symbol_table, &q_table);
	syntax.start();
	symbol_table.display();
	cout << "------quaterion begin------\n";
	q_table.emit();
	cout << "-------quaterion end-------\n" << endl;

	sym_list l = symbol_table.get_all();
	for (sym_list::iterator ptr = l.begin();
		ptr != l.end(); ptr++) {
		if ((*ptr)->function_flag) {
			sym_list closure = symbol_table.get_closure(*ptr);
			Flow flow_map(closure, (*ptr));
			flow_map.generate_flow_map(q_table.q_list);
			flow_map.display_blocks();
			flow_map.activity_analysis();
			flow_map.dag_optimize();
		}
	}

	getchar();
	return 0;
}