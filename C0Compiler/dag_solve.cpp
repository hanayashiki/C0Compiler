#include "stdafx.h"

#define Q Quaterion

void DAG::extract_needed() {
	dataSet<Symbol*> & active_out = basic_block->active_out;
	for (hash_map<Symbol*, DNode*>::iterator
		sn_iter = sym_node_map.begin();
		sn_iter != sym_node_map.end();
		sn_iter++) {
		if (in_mem(sn_iter->first) && 
			active_out.included(sn_iter->first->id)) {
			DNode* needed_node = sn_iter->second;
			set_needed(needed_node);
		}
	}
}

void DAG::set_needed(DNode* dn) {
	dn->needed = true;
	if (dn->left) {
		set_needed(dn->left);
	}
	if (dn->right) {
		set_needed(dn->right);
	}
}

void DAG::set_represent_sym(DNode* dn) {
	dataSet<Symbol*> & use = basic_block->use;
	dataSet<Symbol*> & active_out = basic_block->active_out;
	for (set<Symbol*>::iterator s_iter = dn->placed_syms.begin();
		s_iter != dn->placed_syms.end();
		s_iter++) {
		Symbol* sym = *s_iter;
		if (sym->const_flag || use.included(sym->id)) { 
			// ������Ȼ����Ҫ��
			// use �ӻ����鿴��Ҳ�ǳ��������Ҳ��������Ҫ��
			dn->calculated_sym = sym;
			return;
		}
	}
	for (set<Symbol*>::iterator s_iter = dn->placed_syms.begin();
		s_iter != dn->placed_syms.end();
		s_iter++) {
		Symbol* calculated = *s_iter;
		if (calculated->const_flag || 
			active_out.included(calculated->id)) { // �����Ƿ񱻺����Ҫ
			dn->calculated_sym = calculated;
			return;
		}
	}
	// ������ǲ���Ҫ�ģ����һ��
	if (dn->placed_syms.size() > 0) {
		dn->calculated_sym = *(dn->placed_syms.begin());
	}
	else {
		dn->calculated_sym = NULL;
	}
}

void DAG::dump_quaterion() {
	extract_needed();
	for (vector<DNode*>::iterator d_iter = node_list.begin();
		d_iter != node_list.end(); d_iter++) {
		// Q new_q();
		DNode* dnode = *d_iter;
		set_represent_sym(dnode);
		if (dnode->needed == false) {
			// ����ڵ㲻��Ҫ
			continue;
		}
		if (dnode->op == Quaterion::SELF) {
			// Ҫ����������
			overlap_propagation(dnode);
			continue;
		}
		else if (dnode->fake) {
			new_q_table.add_quaterion(dnode->q);
		}
		else {
			Quaterion new_q;
			new_q.op = dnode->op;
			if (dnode->left) {
				new_q.left = dnode->left->calculated_sym;
			}
			if (dnode->right) {
				new_q.right = dnode->right->calculated_sym;
			}
			new_q.dst = dnode->calculated_sym;
			new_q.label = dnode->label;
			new_q_table.add_quaterion(new_q);

			overlap_propagation(dnode);
		}
	}
}

void DAG::overlap_propagation(DNode* dn) {
	dataSet<Symbol*> & active_out = basic_block->active_out;
	for (set<Symbol*>::iterator s_iter = dn->placed_syms.begin();
		s_iter != dn->placed_syms.end();
		s_iter++) {
		Symbol* sym = *s_iter;
		if (in_mem(sym) && sym != dn->calculated_sym && active_out.included(sym->id)) {
			if (sym_node_map[sym] == dn) {
				// ��ǰ�ڵ㲻�ǡ����ա��ڵ㣬�����Ĵ�����������
				// ��Ϊ�ϲ�ڵ㲻������ sym��sym�ڻ������д洢��
				// calculated_sym ��ȡ��
				Quaterion new_q(sym, dn->calculated_sym);
				new_q_table.add_quaterion(new_q);
			}
		}
	}
}

