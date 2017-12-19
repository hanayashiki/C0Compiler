#include "stdafx.h"

DNode* DAG::find_node(Symbol* sym) {
	hash_map<Symbol*, DNode*>::iterator find_iter;
	find_iter = sym_node_map.find(sym);
	if (find_iter != sym_node_map.end()) {
		return find_iter->second;
	}
	else {
		DNode* new_node = new DNode();
		new_node->idx = node_idx++;
		new_node->add_sym(sym);
		new_node->op = Quaterion::SELF;
		sym_node_map.insert(pair<Symbol*, DNode*>(sym, new_node));
		node_list.push_back(new_node);
		return new_node;
	}
}

DNode* DAG::find_value(int op, Symbol* dst, DNode* left, DNode* right) {
	for (vector<DNode*>::iterator n_iter = node_list.begin();
		n_iter != node_list.end(); n_iter++) {
		DNode* cur_node = *n_iter;
		if (cur_node->op == op && cur_node->left == left &&
			cur_node->right == right) {
			cur_node->add_sym(dst);
			sym_node_map[dst] = cur_node;
			return cur_node;
		}
		else {
			// for a = b case.
			if (op == Quaterion::NONE) {
				if (cur_node == left) {
					cur_node->add_sym(dst);
					sym_node_map[dst] = cur_node;
					return cur_node;
				}
			}
		}
	}

	DNode* new_node = new DNode();
	new_node->idx = node_idx++;
	new_node->left = left;
	new_node->right = right;
	new_node->op = op;

	new_node->add_sym(dst);
	sym_node_map.insert(pair<Symbol*, DNode*>(dst, new_node));
	node_list.push_back(new_node);
	return new_node;
}

