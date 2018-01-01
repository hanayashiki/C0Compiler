#include "stdafx.h"

#define Q Quaterion

BasicBlock::BasicBlock(sym_list & s_l,
    vector<Q>::iterator begin,
    vector<Q>::iterator end): symbol_list(s_l) {
    for (vector<Q>::iterator q_iter = begin;
         q_iter != end; q_iter++) {
             Q* q_ptr = new Q(*q_iter);
             q_list.push_back(q_ptr);
    }
    def.set_elem_list(&s_l);
    use.set_elem_list(&s_l);
    active_in.set_elem_list(&s_l);
    active_out.set_elem_list(&s_l);
}

BasicBlock::~BasicBlock() {
    for (vector<Q*>::iterator q_ptr_iter = q_list.begin();
        q_ptr_iter != q_list.end(); q_ptr_iter++) {
        delete(*q_ptr_iter);
    }
}

void BasicBlock::init_symbols() {
    for (sym_list::iterator s_ptr_iter = symbol_list.begin();
        s_ptr_iter != symbol_list.end();
        s_ptr_iter++) {
            (*s_ptr_iter)->defined = false;
            (*s_ptr_iter)->used = false;
    }
}

void BasicBlock::calculate_def_use() {
    // @require:init_symbols() launched

    for (vector<Quaterion*>::iterator q_ptr_iter = q_list.begin();
        q_ptr_iter != q_list.end();
        q_ptr_iter++) {
		if ((*q_ptr_iter)->is_action() == false) continue;
		Symbol* dst_sym = (*q_ptr_iter)->dst;
		Symbol* left_sym = (*q_ptr_iter)->left;
		Symbol* right_sym = (*q_ptr_iter)->right;
		if (left_sym && in_mem(left_sym)) {
			left_sym->used = true;
			if (left_sym->defined == false) {
				// if the symbol is used as a source, but
				// not defined, it tells that the block needs
				// the value of the symbol from its former blocks.
				use.map_elem(left_sym->id);
			}
		}
		if (right_sym && in_mem(right_sym)) {
			right_sym->used = true;
			if (right_sym->defined == false) {
				use.map_elem(right_sym->id);
			}
		}
		if (dst_sym && in_mem(dst_sym)) {
			dst_sym->defined = true;
			if (dst_sym->used == false) {
				def.map_elem(dst_sym->id);
			}
		}
		/*if ((*q_ptr_iter)->op == Quaterion::CALL) {
			for (sym_list::iterator s_iter = symbol_list.begin();
				s_iter != symbol_list.end(); s_iter++) {

			}
		}*/
    }
}

void BasicBlock::q_display() {
	for (vector<Quaterion*>::iterator q_ptr_iter = q_list.begin();
		q_ptr_iter != q_list.end();
		q_ptr_iter++) {
		FILE* old = (*q_ptr_iter)->dump_file;
		(*q_ptr_iter)->dump_file = stdout;
		(*q_ptr_iter)->emit();
		(*q_ptr_iter)->dump_file = old;
	}
}