#include "stdafx.h"

#define Q Quaterion

Flow::Flow(sym_list & s_l, Symbol* f_s): symbol_list(s_l),
	func_sym(f_s) {
	
}

Flow::~Flow() {
	for (FlowMap::iterator iter = flow_map.begin();
		iter != flow_map.end();
		iter++) {
		delete(*iter);
	}
}

void Flow::generate_flow_map(vector<Quaterion> & q_list) {
	// first scanning: mark first as beginning;
	// mark `label`s that are jumped to as beginning;
	// mark quaterion that follows jumps as beginning

	// second scanning: 
	// for `label`s marked as beginning, mark the quaterion as
    // beginnibng.

	// third scanning:
	// generate basicblock from beginning to the one preceding any
	// beginning, record the basicblock that each Quaterion belongs
	// to.
	bool next_as_beginning = true;
	vector<Q>::iterator q_begin;
	vector<Q>::iterator q_end;

	get_interval(q_list, func_sym, q_begin, q_end);

	for (vector<Q>::iterator q_iter = q_list.begin(); 
		q_iter != q_list.end(); q_iter++) {
		if (next_as_beginning) {
			q_iter->beginning = true;
			next_as_beginning = false;
		}
		if (q_iter->is_jump()) {
			next_as_beginning = true;
			assert(q_iter->label);
			q_iter->label->jumped_to = true;
		}
	}

	for (vector<Q>::iterator q_iter = q_list.begin();
		q_iter != q_list.end(); q_iter++) {
		if (q_iter->op == Q::LABEL && q_iter->left->jumped_to == true) {
			q_iter->beginning = true;
		}
	}

	int idx = 0;
	vector<Q>::iterator q_iter = q_list.begin();
	while (q_iter != q_list.end()) {
		if (q_iter->beginning == true) {
			vector<Q>::iterator q_begin = q_iter;
			vector<Q>::iterator q_end = q_iter;
			do {
				q_iter++;
			} while (q_iter != q_list.end() && q_iter->beginning == false);
			q_end = q_iter; // end should be the one after the real end

			BasicBlock * basic_block = new BasicBlock(symbol_list,
				q_begin, q_end);
			basic_block->id = idx++;
			q_begin->basic_block = basic_block;

			if (q_begin->op == Q::LABEL) {
				q_begin->left->basic_block = basic_block;
			}

			flow_map.push_back(basic_block);
		}
	}

	// forth scanning: 对于每一个基本块B，标注它的后继基本块为
	// 1. 顺序上的后继基本块；标记前序基本块的前驱基本块为B；
	// 2. 跳转到的基本块；并将被跳转到的前驱基本块加入B。

	for (FlowMap::iterator f_iter = flow_map.begin();
		f_iter != flow_map.end() - 1 && f_iter != flow_map.end();
		f_iter++) {
		BasicBlock* current_block = *f_iter;
		Q * last_q = *(current_block->q_list.end() - 1);
		if ((f_iter + 1) != flow_map.end() && !last_q->is_unconditional_jump()) {
			BasicBlock* next_block = *(f_iter + 1);
			current_block->next.push_back(next_block);
			next_block->previous.push_back(current_block);
		}
		if (last_q->is_branch()) {
			BasicBlock* next_block = last_q->label->basic_block;
			current_block->next.push_back(next_block);
			next_block->previous.push_back(current_block);
		}
	}
}

void Flow::get_interval(vector<Quaterion> & q_list,
	Symbol* func_sym,
	vector<Quaterion>::iterator & begin,
	vector<Quaterion>::iterator & end) {
	Symbol* label = func_sym->start_label;
	vector<Quaterion>::iterator iter;
	for (iter = q_list.begin();
		iter != q_list.end(); iter++) {
		if ((iter->op == Q::LABEL) && (iter->left == label)) {
			begin = iter;
			break;
		}
	}
	for (; iter != q_list.end(); iter++) {
		if (iter->op == Q::EPILOG) {
			end = iter;
			return;
		}
	}
}

void Flow::display_blocks() {
	for (FlowMap::iterator f_iter = flow_map.begin();
		f_iter != flow_map.end();
		f_iter++) {
		cout << "------block " << (*f_iter)->id << "------\n";
		(*f_iter)->q_display();
	}
}

