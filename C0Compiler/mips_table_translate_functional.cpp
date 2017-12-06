#include "stdafx.h"

using namespace SymbolUtils;

#define MC MipsCode
#define Q Quaterion
#define INT_SIZE 4
#define CHAR_SIZE 1

void MipsTable::label_translate(Q & q) {
    if (q.op == Q::LABEL) {
        MC::label_(q.left->name);
    }
}

void MipsTable::branch_translate(Q & q) {
    // (op == BEQZ) || (op == BNEZ) || (op == BEQ) || (op == BNE)
    // || (op == GOTO)
    int src_reg = 0;
    if (q.left->type != Symbol::LABEL && !q.left->const_flag) {
        src_reg = fetch_symbol(q.left);
    }

    if (q.op == Q::BEQZ) {
        if (q.left->const_flag) {
            int v = get_const_value(q.left);
            if (v == 0) {
                MC::j(q.right->name);
            }
        } else {
            MC::beq(src_reg, MC::_zero, q.right->name);
        }
    }
    if (q.op == Q::BNEZ) {
        if (q.left->const_flag) {
            int v = get_const_value(q.left);
            if (v != 0) {
                MC::j(q.right->name);
            }
        } else {
            MC::bne(src_reg, MC::_zero, q.right->name);
        }
    }
    if ((q.op == Q::BEQ) || (q.op == Q::BNE)) {
        int cmp_reg;
        if (q.left->const_flag && q.right->const_flag) {
            int v_left = get_const_value(q.left);
            int v_right = get_const_value(q.right);
            if (v_left == v_right) {
                MC::j(q.label->name);
            }
        } else if (q.left->const_flag) {
            MC::addiu(MC::_at, MC::_zero, get_const_value(q.left));
            src_reg = MC::_at;
        } else if (q.right->const_flag) {
            MC::addiu(MC::_at, MC::_zero, get_const_value(q.right));
            cmp_reg = MC::_at;            
        } else {
            cmp_reg = fetch_symbol(q.right);
        }
        if (q.op == Q::BEQ) {
            MC::beq(src_reg, cmp_reg, q.label->name);
        } else {
            MC::bne(src_reg, cmp_reg, q.label->name);
        }
    }
    if (q.op == Q::GOTO) {
        MC::j(q.left->name);
    }
}

void MipsTable::print_translate(Quaterion & q) {
    int syscall_num = 0;
    if (q.op == Q::PRINT_CHAR) {
        syscall_num = 11;
    }
    if (q.op == Q::PRINT_INT) {
        syscall_num = 1;
    }
    MC::li(MC::_v0, syscall_num);
    if (q.left->const_flag) {
        MC::li(MC::_a0, get_const_value(q.left));
    } else {
        int src_reg = fetch_symbol(q.left);
        MC::move(MC::_a0, src_reg);
    }
    MC::syscall();
}