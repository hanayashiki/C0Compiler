#include "stdafx.h"

bool do_opt = true;
bool do_dag = true;
bool do_reg = true;

int main() {
	Lexer lexer;
	SymbolTable symbol_table;
	QuaterionTable q_table;
	vector<Quaterion> new_qlist;
	vector<Symbol*> string_table;
	mem_map root_map;
	string file_name;
	cin >> file_name;
	FILE* f = fopen(file_name.c_str(), "r");
	//FILE* f = fopen("test_debug_unknown.txt", "r");
	if (!f) {
		cout << "file not exist." << endl;
		system("pause");
		return 0;
	}
	MipsCode::out_file = fopen("mips.asm", "w");
	Quaterion::dump_file = stdout;
	lexer.setSource(f);
	Syntax syntax(&lexer, &symbol_table, &q_table, &string_table);
	syntax.start();
	if (verbose) symbol_table.display();

	{
		FILE* f = fopen("15231177_王辰昱_优化前中间代码.txt", "w");
		Quaterion::dump_file = f;
		q_table.emit();
		fclose(f);
	}

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
			if (do_dag) {
				for (sym_list::iterator ptr = l.begin();
					ptr != l.end(); ptr++) {
					if ((*ptr)->function_flag) {
						sym_list closure = symbol_table.get_closure(*ptr);
						Flow flow_map(closure, (*ptr));
						flow_map.generate_flow_map(q_table.q_list);
						if (verbose) flow_map.display_blocks();
						flow_map.activity_analysis();
						flow_map.dag_optimize();
						new_qlist.insert(new_qlist.end(),
							flow_map.optimized_qlist.begin(),
							flow_map.optimized_qlist.end());
					}
				}
				q_table.q_list.clear();
				q_table.q_list.insert(q_table.q_list.begin(),
					new_qlist.begin(), new_qlist.end());
				new_qlist.clear();
			}
			if (do_reg) {
				for (sym_list::iterator ptr = l.begin();
					ptr != l.end(); ptr++) {
					if ((*ptr)->function_flag) {
						sym_list closure = symbol_table.get_closure(*ptr);
						Flow flow_map(closure, (*ptr));
						flow_map.generate_flow_map(q_table.q_list);
						if (verbose) flow_map.display_blocks();
						flow_map.activity_analysis();
						flow_map.conflict_analyze();
						new_qlist.insert(new_qlist.end(),
							flow_map.optimized_qlist.begin(),
							flow_map.optimized_qlist.end());
					}
				}
				q_table.q_list.clear();
				q_table.q_list.insert(q_table.q_list.begin(),
					new_qlist.begin(), new_qlist.end());
			}
		}
		{
			FILE* f = fopen("15231177_王辰昱_优化后中间代码.txt", "w");
			Quaterion::dump_file = f;
			q_table.emit();
			fclose(f);
		}
		Quaterion::dump_file = MipsCode::out_file;
		// dump mipscode
		for (sym_list::iterator ptr = l.begin();
			ptr != l.end(); ptr++) {
			if ((*ptr)->function_flag) {
				MipsTable m_table((*ptr), &symbol_table, &q_table, &root_map);
				m_table.translate_all();
				if (verbose) m_table.display_stack();
			}
		}
		MipsTable::exit();
		fclose(MipsCode::out_file);
		fclose(f);
		system("java -jar Mars4_5.jar mips.asm");
		system("pause");
	}
	else {
		cout << "Compilation Error(s): " << syntax.errors
			<< ". Aborting.\n";
	}


	getchar();
	return 0;
}