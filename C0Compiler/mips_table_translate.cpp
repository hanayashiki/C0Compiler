#include "stdafx.h"

#define MC MipsCode
#define Q Quaterion

void MipsTable::translate_all() {
    q_iter = q_table->q_list.begin();
    for (; q_iter != q_table->q_list.end(); q_iter++) {
        cout << "-----" << endl;
        q_iter->emit();
        cout << ">>>>>" << endl;
        translate(*q_iter);
    }
}

void MipsTable::translate(Q & q) {
    if (q.is_commutative()) {
        commutative_translate(q);
    } else if (q.op == Q::NONE) {
        move_translate(q);
    }
}

void MipsTable::move_translate(Q &q) {
    int dst_reg = fetch_symbol(q.dst, false);
    int src_reg = fetch_symbol(q.left);
    MC::move(dst_reg, src_reg);
}

void MipsTable::commutative_translate(Q & q) {
    int dst_reg = fetch_symbol(q.dst, false);
    if (q.left->const_flag || q.right->const_flag) { // ÓÐ³£Êý
        int immediate;
        int src_reg;

        if (q.left->const_flag) {
            if (q.left->type == Symbol::INT) {
                immediate = q.left->integer_value;
            } else if (q.left->type == Symbol::CHAR) {
                immediate = q.left->character_value;
            }
            src_reg = fetch_symbol(q.right);
        }
        if (q.right->const_flag) {
            if (q.right->type == Symbol::INT) {
                immediate = q.right->integer_value;
            } else if (q.right->type == Symbol::CHAR) {
                immediate = q.right->character_value;
            }
            src_reg = fetch_symbol(q.left);
        }

        if (q.op == Q::ADD) {
            MC::addiu(dst_reg, src_reg, immediate);
        }

    } else {
        int left_reg = fetch_symbol(q.left);
        int right_reg = fetch_symbol(q.right);
        
        if (q.op == Q::ADD) {
            MC::addu(dst_reg, left_reg, right_reg); 
        }
    }
}