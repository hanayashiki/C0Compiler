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
    if (q.left->const_flag == false) {
        int src_reg = fetch_symbol(q.left, false);
        MC::move(dst_reg, src_reg);
    } else {
        int immediate;
        if (q.left->type == Symbol::INT) {
            immediate = q.left->integer_value;
        } else if (q.left->type == Symbol::CHAR) {
            immediate = q.left->character_value;
        }
        MC::addiu(dst_reg, MC::_zero, immediate);
    }
}

void MipsTable::commutative_translate(Q & q) {
    // (op == ADD) || (op == MULT) || (op == NE) || (op == EQ)
    int dst_reg = fetch_symbol(q.dst, false);
    if (q.left->const_flag || q.right->const_flag) { // ÓĞ³£Êı
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
        if (q.op == Q::MULT) {
            MC::addiu(dst_reg, MC::_at, immediate); 
            MC::mul(dst_reg, src_reg, MC::_at);
        }
        if (q.op == Q::EQ) {
            MC::xori(MC::_at, src_reg, immediate);
            MC::sltiu(dst_reg, MC::_at, 1);
        }
    } else {
        int left_reg = fetch_symbol(q.left);
        int right_reg = fetch_symbol(q.right);
        
        if (q.op == Q::ADD) {
            MC::addu(dst_reg, left_reg, right_reg); 
        }
        if (q.op == Q::MULT) {
            MC::mul(dst_reg, left_reg, right_reg);
        }
        if (q.op == Q::EQ) {
            MC::xor(MC::_at, left_reg, right_reg);
            MC::sltiu(dst_reg, MC::_at, 1);
            // if left_reg == right_reg
            //  _at = 0;  then dst_reg = 1
            // else
            //  _at !=0; then in unsigned comparion
            //  _at >= 1; then dst_reg = 0
        }
    }
}

