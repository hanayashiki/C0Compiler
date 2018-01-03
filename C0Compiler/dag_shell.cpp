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
		if ((*q_iter)->is_simple()) {
			q_interpret(**q_iter);
		}
		else if ((*q_iter)->is_jump() || 
			(*q_iter)->op == Q::PUSH ||
			(*q_iter)->op == Q::PRINT_CHAR ||
			(*q_iter)->op == Q::PRINT_INT ||
			(*q_iter)->op == Q::RET) {
			action_q_interpret(**q_iter);
		}
		else if ((*q_iter)->op == Q::PROLOG ||
			(*q_iter)->op == Q::EPILOG ||
			(*q_iter)->op == Q::CALL ||
			(*q_iter)->op == Q::PRINT_STR) {
			add_false_node(**q_iter);
		}
		else if (((*q_iter)->op == Q::LABEL) &&
			(q_iter == q_list.begin())) {
			add_false_node(**q_iter);
		}
		else if ((*q_iter)->op == Q::READ_INT ||
			(*q_iter)->op == Q::READ_CHAR ||
			(*q_iter)->op == Q::GET) {
			// 一类强制对变量值进行设定的指令
			add_setting_node((*q_iter)->op, (*q_iter)->dst);
		}
		else {
			(*q_iter)->emit_debug();
			assert(0);
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
	if (dst_node == NULL) {
		assert(0);
	}

	if ((op == Q::TO)) {
		set_needed(dst_node);
	}
}

void DAG::add_action_node(int op, Symbol* left_sym, Symbol* right_sym,
	Symbol* label) {
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
	if (op == Q::PUSH) {
		left_node = find_node(left_sym);
	}
	if (op == Q::PRINT_CHAR || op == Q::PRINT_INT ||
		op == Q::RET) {
		if (left_sym) {
			left_node = find_node(left_sym);
		}
	}


	DNode* new_node = new DNode();
	new_node->idx = node_idx++;
	new_node->left = left_node;
	new_node->right = right_node;
	new_node->label = label;
	new_node->op = op;

	set_needed(new_node);

	node_list.push_back(new_node);
}

void DAG::add_setting_node(int op, Symbol* dst_sym) {
	DNode* new_node = new DNode();
	new_node->idx = node_idx++;
	new_node->op = op;
	
	if (op == Quaterion::READ_CHAR || op == Quaterion::READ_INT) {
		set_needed(new_node);
	}

	new_node->add_sym(dst_sym);
	sym_node_map[dst_sym] = new_node;
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

	//coutd << "interpretting: ";
	//q.emit_debug();

	if (dst_sym == NULL) {
		q.emit_debug();
		assert(0);
	}

	add_node(op, dst_sym, left_sym, right_sym);

}

void DAG::action_q_interpret(Quaterion & q) {
	int op = q.op;
	Symbol* dst_sym = q.dst;
	Symbol* left_sym = q.left;
	Symbol* right_sym = q.right;
	Symbol* label_sym = q.label;

	add_action_node(op, left_sym, right_sym, label_sym);
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
