#include "stdafx.h"

#define Q Quaterion

DAG::DAG(BasicBlock* b_b) : basic_block(b_b), node_idx(0) {
}

DAG::~DAG() {
	for (vector<DNode*>::iterator iter = node_list.begin();
		iter != node_list.end(); iter++) {
		delete(*iter);
	}
}

void DAG::translate() {
	vector<Quaterion*> & q_list = basic_block->q_list;
	for (q_iter = q_list.begin(); q_iter != q_list.end(); q_iter++) {
		//cout << "translating\n";
		if ((*q_iter)->is_action() && !(*q_iter)->is_jump()) {
			q_interpret(**q_iter);
		}
		else if ((*q_iter)->is_jump()) {
			jump_q_interpret(**q_iter);
		}
		else if ((*q_iter)->op == Q::PROLOG ||
			(*q_iter)->op == Q::EPILOG) {
			add_false_node(**q_iter);
		}
		else if (((*q_iter)->op == Q::LABEL) &&
			(q_iter == q_list.begin())) {
			add_false_node(**q_iter);
		}
	}
}

void DAG::add_node(int op, Symbol* dst_sym, Symbol* left_sym,
	Symbol* right_sym) {
	DNode * dst_node = NULL;
	DNode * left_node = NULL;
	DNode * right_node = NULL;
	if (left_sym) {
		left_node = find_node(left_sym);
	}
	if (right_sym) {
		right_node = find_node(right_sym);
	}
	dst_node = find_value(op, dst_sym, left_node, right_node);
}

void DAG::add_jump_node(int op, Symbol* left_sym, Symbol* right_sym,
	Symbol* label) {
	assert((op == Q::BEQZ) || (op == Q::BNEZ) || (op == Q::BEQ) 
		|| (op == Q::BNE) || (op == Q::GOTO));
	DNode * dst_node = NULL;
	DNode * left_node = NULL;
	DNode * right_node = NULL;
	if ((op >= Q::BEQZ) && (op <= Q::BNEZ)) {
		left_node = find_node(left_sym);
	}
	if ((op >= Q::BEQ) && (op <= Q::BNE)) {
		left_node = find_node(left_sym);
		right_node = find_node(right_sym);
	}
	if (op == Q::GOTO) {
		// passing nothing is ok
	}
	DNode* new_node = new DNode();
	new_node->idx = node_idx++;
	new_node->left = left_node;
	new_node->right = right_node;
	new_node->label = label;
	new_node->op = op;

	new_node->needed = true; // Jump is absolutely needed

	node_list.push_back(new_node);
}

void DAG::display() {
	for (vector<DNode*>::iterator d_iter = node_list.begin();
		d_iter != node_list.end();
		d_iter++) {
		(*d_iter)->display();
	}
}

void DAG::q_interpret(Quaterion & q) {
	assert(q.is_action() && !q.is_jump());
	//cout << "interpretting\n";
	int op = q.op;
	Symbol* dst_sym = q.dst;
	Symbol* left_sym = q.left;
	Symbol* right_sym = q.right;

	add_node(op, dst_sym, left_sym, right_sym);

}

void DAG::jump_q_interpret(Quaterion & q) {
	assert(q.is_jump());
	int op = q.op;
	Symbol* dst_sym = q.dst;
	Symbol* left_sym = q.left;
	Symbol* right_sym = q.right;
	Symbol* label_sym = q.label;

	add_jump_node(op, left_sym, right_sym, label_sym);
}

void DAG::add_false_node(Quaterion & q) {
	// 存在一些四元式，比如PROLOG，EPILOG，LABEL，
	// 它们不需要参与 DAG 图的构建，因为不存在数据依赖，
	// 但是为了保持完整性
	// 必须把它们拷贝到 DNode 上，以备翻译。
	DNode* new_node = new DNode();
	new_node->idx = node_idx++;
	new_node->needed = true;
	new_node->fake = true;
	new_node->q = q;

	node_list.push_back(new_node);
}