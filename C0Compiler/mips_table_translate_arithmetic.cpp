#include "stdafx.h"

using namespace SymbolUtils;

#define MC MipsCode
#define Q Quaterion
#define INT_SIZE 4
#define CHAR_SIZE 1

void MipsTable::incommutative_translate(Q &q) {
    //    (op == SUB) || (op == DIV) || (op == GT) ||
    //    (op == LT) || (op == GTE) || (op == LTE)
    int dst_reg = fetch_symbol(q.dst, false);
    int left_reg, right_reg;

    if ((q.left->const_flag == true) && 
        (q.right->const_flag == true)) {
        int result = precompute(q.op, get_const_value(q.left),
            get_const_value(q.right));
        MC::li(dst_reg, result);
        return;
    }

    if (q.left->const_flag == true) {
        MC::addiu(MC::_at, MC::_zero, q.left->integer_value);
        left_reg = MC::_at;
    } else {
        left_reg = fetch_symbol(q.left);
    }

    if (q.right->const_flag == true) {
        MC::addiu(MC::_at, MC::_zero, q.right->integer_value);
        right_reg = MC::_at;
    } else {
        right_reg = fetch_symbol(q.right);
    }

    if (q.op == Q::SUB) {
        MC::subu(dst_reg, left_reg, right_reg);
    }
    if (q.op == Q::DIV) {
        MC::div(left_reg, right_reg);
        MC::mflo(dst_reg);
    }

    if (q.op == Q::GT) {
        if (q.right->const_flag) {
            MC::sgti(dst_reg, left_reg, get_const_value(q.right));
        } else {
            MC::sgt(dst_reg, left_reg, right_reg);
        }
    }
    if (q.op == Q::LT) {
        if (q.right->const_flag) {
            MC::slti(dst_reg, left_reg, get_const_value(q.right));
        } else {
            MC::slt(dst_reg, left_reg, right_reg);
        }
    }
    if (q.op == Q::GTE) {
        if (q.right->const_flag) {
            MC::sgei(dst_reg, left_reg, get_const_value(q.right));
        } else {
            MC::sge(dst_reg, left_reg, right_reg);
        }
    }
    if (q.op == Q::LTE) {
        if (q.right->const_flag) {
            MC::slei(dst_reg, left_reg, get_const_value(q.right));
        } else {
            MC::sle(dst_reg, left_reg, right_reg);
        }       
    }
}

void MipsTable::move_translate(Q &q) {
	if (q.dst->const_flag) {
		cout << "caught" << endl;
		q.dump_file = stdout;
		q.emit();
	}
    int dst_reg = fetch_symbol(q.dst, false);

    if (q.left->const_flag == false) {
        int src_reg = fetch_symbol(q.left);
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
        if (q.op == Q::MULT) {
            MC::addiu(dst_reg, MC::_at, immediate); 
            MC::mul(dst_reg, src_reg, MC::_at);
        }
        if (q.op == Q::EQ) {
            MC::xori(MC::_at, src_reg, immediate);
            MC::sltiu(dst_reg, MC::_at, 1);
        }
        if (q.op == Q::NE) {
            MC::xor(dst_reg, src_reg, immediate);
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
        if (q.op == Q::NE) {
            MC::xor(dst_reg, left_reg, right_reg);
        }
    }
}

void MipsTable::array_read_translate(Q & q) {
    // c = a[i], c = A AT i
    int ptr_reg = fetch_symbol(q.left);
    int offset = 0;
    int dst_reg = fetch_symbol(q.dst, false);
    if (q.right->const_flag) {
        offset = get_const_value(q.right);
        if (q.left->type == Symbol::CHAR) {
            MC::lb(dst_reg, CHAR_SIZE * offset, ptr_reg);
        }
        if (q.left->type == Symbol::INT) {
            MC::lw(dst_reg, INT_SIZE * offset, ptr_reg);
        }
    } else {
        offset = fetch_symbol(q.right);
        if (q.left->type == Symbol::CHAR) {
            MC::addu(MC::_at, ptr_reg, offset);
        } else if (q.left->type == Symbol::INT) {
            MC::sll(MC::_at, offset, 2); // multiply offset by 4
            MC::addu(MC::_at, MC::_at, ptr_reg);
        }
        if (q.left->type == Symbol::CHAR) {
            MC::lb(dst_reg, 0, MC::_at);
        }
        if (q.left->type == Symbol::INT) {
            MC::lw(dst_reg, 0, MC::_at);
        }
    }
}

void MipsTable::array_write_translate(Q & q) {
    // a[i] = b
    int ptr_reg = fetch_symbol(q.dst);
    int offset = 0;
    int src_reg = fetch_symbol(q.right);
    if (q.left->const_flag) {
        offset = get_const_value(q.left);
        if (q.left->type == Symbol::CHAR) {
            MC::sb(src_reg, CHAR_SIZE * offset, ptr_reg);
        }
        if (q.left->type == Symbol::INT) {
            MC::sw(src_reg, INT_SIZE * offset, ptr_reg);
        }
    } else {
        offset = fetch_symbol(q.left);
        if (q.dst->type == Symbol::CHAR) {
            MC::addu(MC::_at, ptr_reg, offset);
        } else if (q.dst->type == Symbol::INT) {
            MC::sll(MC::_at, offset, 2); // multiply offset by 4
            MC::addu(MC::_at, MC::_at, ptr_reg);
        }
        if (q.dst->type == Symbol::CHAR) {
            MC::sb(src_reg, 0, MC::_at);
        }
        if (q.dst->type == Symbol::INT) {
            MC::sw(src_reg, 0, MC::_at);
        }
    }    
}

void MipsTable::minus_translate(Q & q) {
    int dst_reg = fetch_symbol(q.dst, false);
    int src_reg = fetch_symbol(q.left);
    MC::mns(dst_reg, src_reg);
}