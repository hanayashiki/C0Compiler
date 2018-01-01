#include "stdafx.h"

void Flow::dag_optimize() {
	for (FlowMap::iterator b_iter = flow_map.begin();
		b_iter != flow_map.end();
		b_iter++) {
		DAG dag(*b_iter);
		//cout << "dag begin\n";
		dag.translate();
		dag.display();
		dag.dump_quaterion();
		cout << "--------quaterions optimized--------\n";
		coutd << func_sym->name << endl;
		cout << "------------------------------------\n";
		dag.new_q_table.emit();
		cout << "-----quaterions optimized end-----\n";
		regenerate_qlist(dag);
	}
}

void Flow::regenerate_qlist(DAG & dag) {
	dag.new_q_table.q_list.begin()->emit_debug();
	for (vector<Quaterion>::iterator q_iter =
		dag.new_q_table.q_list.begin();
		q_iter != dag.new_q_table.q_list.end();
		q_iter++) {
		optimized_qlist.push_back(*q_iter);
	}
}