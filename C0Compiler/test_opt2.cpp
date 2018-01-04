#include "stdafx.h"
/*
bool do_opt = false;

int main_test_opt2() {
	Lexer lexer;
	SymbolTable symbol_table;
	QuaterionTable q_table;
	vector<Quaterion> new_qlist;
	vector<Symbol*> string_table;
	mem_map root_map;

	FILE* f = fopen("foreign_test_zhaokaifeng.txt", "r");
	MipsCode::out_file = fopen("mips.asm", "w");
	Quaterion::dump_file = stdout;
	lexer.setSource(f);
	Syntax syntax(&lexer, &symbol_table, &q_table, &string_table);
	syntax.start();
	symbol_table.display();
	cout << "------quaterion begin------\n";
	q_table.emit();
	cout << "-------quaterion end-------\n" << endl;

	MipsData md(&string_table, &symbol_table, &root_map);
	md.dump_data();
	md.map_root();
	MipsCode::_text();
	if (q_table.entry_symbol) {
		MipsCode::j(q_table.entry_symbol->start_label->name);
	}

	if (syntax.errors == 0) {
		sym_list l = symbol_table.get_all();
		// optimization
		if (do_opt) {
			for (sym_list::iterator ptr = l.begin();
				ptr != l.end(); ptr++) {
				if ((*ptr)->function_flag) {
					sym_list closure = symbol_table.get_closure(*ptr);
					Flow flow_map(closure, (*ptr));
					flow_map.generate_flow_map(q_table.q_list);
					flow_map.display_blocks();
					flow_map.activity_analysis();
					flow_map.dag_optimize();
					new_qlist.insert(new_qlist.end(),
						flow_map.optimized_qlist.begin(),
						flow_map.optimized_qlist.end());
				}
			}
			q_table.q_list = new_qlist;
			cout << "------opt quaterion begins------\n";
			q_table.emit();
			cout << "------opt quaterion ends------\n";
		}
		Quaterion::dump_file = MipsCode::out_file;
		// dump mipscode
		for (sym_list::iterator ptr = l.begin();
			ptr != l.end(); ptr++) {
			if ((*ptr)->function_flag) {
				MipsTable m_table((*ptr), &symbol_table, &q_table, &root_map);
				m_table.translate_all();
				m_table.display_stack();
			}
		}
		MipsTable::exit();
		fclose(MipsCode::out_file);
		fclose(f);
		system("mips.asm");
	}
	else {
		cout << "Compilation Error(s): " << syntax.errors
			<< ". Aborting.\n";
	}


	getchar();
	return 0;
}*/