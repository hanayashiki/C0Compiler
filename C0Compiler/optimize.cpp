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
		dag.new_q_table.emit();
		cout << "-----quaterions optimized end-----\n";
	}
}