#include "stdafx.h"

void Flow::calculate_use_def() {
	for (FlowMap::iterator b_iter = flow_map.begin();
		b_iter != flow_map.end();
		b_iter++) {
		BasicBlock* block = *b_iter;
		block->init_symbols();
		block->calculate_def_use();
		cout << "------block " << (*b_iter)->id << "------" << endl;
		cout << "-----def: -----" << endl;
		block->def.in_display();
		cout << "-----use: -----" << endl;
		block->use.in_display();
	}
} 

void Flow::activity_analysis() {
	calculate_use_def();
	bool change = false;
	do {
		change = false;
		for (FlowMap::iterator b_iter = flow_map.begin();
			b_iter != flow_map.end();
			b_iter++) {
			change = change | calculate_active_in(*b_iter);
			change = change | calculate_active_out(*b_iter);
		}
	} while (change == true);

	for (FlowMap::iterator b_iter = flow_map.begin();
		b_iter != flow_map.end();
		b_iter++) {
		BasicBlock* block = *b_iter;
		cout << "------block " << (*b_iter)->id << "------" << endl;
		block->q_display();
		cout << "-----active_in: -----" << endl;
		block->active_in.in_display();
		cout << "-----active_out: -----" << endl;
		block->active_out.in_display();
		cout << endl;
	}
}

bool Flow::calculate_active_in(BasicBlock * block) {
	// in[B] = use[B]¡È(out[B] - def[B])
	int old_size = block->active_in.size();
	dataSet<Symbol*> diff(&symbol_list);
	diff.set_difference(block->active_out, block->def);
	block->active_in.set_union(block->use, diff);
	int new_size = block->active_in.size();
	assert(new_size >= old_size);
	cout << "active_in: " << old_size << " -> " << new_size << endl;
 	if (new_size > old_size) {
		return true;
	}
	else {
		return false;
	}
}

bool Flow::calculate_active_out(BasicBlock * block) {
	// out[B] = ¡Èin[P], P ¡Ê block->next
	int old_size = block->active_out.size();
	for (vector<BasicBlock*>::iterator b_iter = block->next.begin();
		b_iter != block->next.end();
		b_iter++) {
		cout << block->id << " - " << (*b_iter)->id << endl;
		block->active_out.set_union(block->active_out,
			(*b_iter)->active_in);
	}
	int new_size = block->active_out.size();
	assert(new_size >= old_size);
	cout << "active_out: " << old_size << " -> " << new_size << endl;
	if (new_size > old_size) {
		return true;
	}
	else {
		return false;
	}
}
