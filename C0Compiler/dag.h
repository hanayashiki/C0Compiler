#pragma once
#include "stdafx.h"
class DAG {
private:
	int node_idx;
public:
	DAG(BasicBlock* b_b);
	~DAG();

	BasicBlock* basic_block;
	vector<DNode*> node_list;
	hash_map<Symbol*, DNode*> sym_node_map;
	QuaterionTable new_q_table;

	vector<Quaterion*>::iterator q_iter;

	void translate();
	void q_interpret(Quaterion & q);
	void action_q_interpret(Quaterion & q);

	void add_node(int op, Symbol* dst_sym, Symbol* left_sym,
		Symbol* right_sym);
	void add_action_node(int op, Symbol* left_sym, Symbol* right_sym,
		Symbol* label_sym);
	void add_setting_node(int op, Symbol* dst_sym);
	void add_false_node(Quaterion & q);
	DNode* find_node(Symbol* sym);
	DNode* find_value(int op, Symbol* dst, DNode* left, DNode* right);

	void extract_needed();
	void set_needed(DNode* dn);
	void set_represent_sym(DNode* dn);
	void overlap_propagation(DNode* dn);
	// 对于一个 DNode 上的多个 Symbol, if needed later, should copy
	void dump_quaterion();

	void display();
};
