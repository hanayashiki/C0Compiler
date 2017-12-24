#include "stdafx.h"

using namespace SymbolUtils;

#define MC MipsCode
#define Q Quaterion
#define INT_SIZE 4
#define CHAR_SIZE 1

void MipsTable::label_translate(Q & q) {
    if (q.op == Q::LABEL) {
        MC::label_(q.left->name);
        unmap_all_regs();
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
				if (q.op == Q::BEQ) {
					MC::j(q.label->name);
				}
			}
			else {
				if (q.op == Q::BNE) {
					MC::j(q.label->name);
				}
			}
		}
		else {
			if (q.left->const_flag) {
				MC::addiu(MC::_at, MC::_zero, get_const_value(q.left));
				src_reg = MC::_at;
				cmp_reg = fetch_symbol(q.right);
			}
			else if (q.right->const_flag) {
				MC::addiu(MC::_at, MC::_zero, get_const_value(q.right));
				cmp_reg = MC::_at;
			}
			else {
				cmp_reg = fetch_symbol(q.right);
			}
			if (q.op == Q::BEQ) {
				MC::beq(src_reg, cmp_reg, q.label->name);
			}
			else {
				MC::bne(src_reg, cmp_reg, q.label->name);
			}
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
    if (q.op == Q::PRINT_STR) {
        syscall_num = 4;
    }
    MC::li(MC::_v0, syscall_num);
    if (q.op != Q::PRINT_STR) {
        if (q.left->const_flag) {
            MC::li(MC::_a0, get_const_value(q.left));
        } else {
            int src_reg = fetch_symbol(q.left);
            MC::move(MC::_a0, src_reg);
        }
    } else {
        MC::la(MC::_a0, q.left->name);
    }
    MC::syscall();
}

void MipsTable::scanf_translate(Quaterion & q) {
    int syscall_num;
    if (q.op == Q::READ_CHAR) {
        syscall_num = 12;
    }
    if (q.op == Q::READ_INT) {
        syscall_num = 5;
    }
    MC::li(MC::_v0, syscall_num);
    MC::syscall();
    int reg = fetch_symbol(q.dst, false);
    MC::move(reg, MC::_v0);
}

void MipsTable::push_translate() {
    while (q_iter != q_table->q_list.end()) {
        if (q_iter->op != Q::PUSH) {
            q_iter--;
            break;
        }
        int src_reg;
        Symbol* push_sym = q_iter->left;
        //cout << "dig_size:" << dig_size << endl;
        //cout << "stack_size:" << stack_size << endl;
        dig_size = alignment(dig_size, get_simple_size(push_sym));
        dig_size += get_simple_size(push_sym);
        if (push_sym->const_flag) {
            MC::const_to_at(get_const_value(push_sym));
            src_reg = MC::_at;
        } else {
            src_reg = fetch_symbol(push_sym);
        }

        //fprintf(MipsCode::out_file, "# %s @ $%d\n", reg_distrb[src_reg]->name.c_str(), src_reg);
        if (push_sym->type == Symbol::INT) {
            MC::sw(src_reg, -dig_size);
        }
        if (push_sym->type == Symbol::CHAR) {
            MC::sb(src_reg, -dig_size);
        }
        q_iter++;
    }
}

void MipsTable::call_func_translate(Q & q) {
    dig_size = stack_size + 4;
    // »Ö¸´ÍÚ¾ò
    MC::addiu(MC::_sp, MC::_sp, -stack_size);
    if (q.left->type != Symbol::VOID) {
        int ret_offset = - 4 - stack_size;
        pass_sym->type = Symbol::INT;
        (*stack_map)[pass_sym] = ret_offset;
    }
    MC::jal(q.left->start_label->name);
    MC::addiu(MC::_sp, MC::_sp, stack_size);
}

void MipsTable::return_translate(Q & q) {
    if (q.left != NULL) {
        int ret_offset = (*stack_map)[ret_sym];
        int src_reg = reg_of(q.left);
        MC::sw(src_reg, ret_offset);
    }
    if (func->name == "main") {
        MC::j("__exit__");
    } else {
        reload_regs();
        MC::jr(MC::_ra);
    }
}

void MipsTable::get_translate(Q & q) {
    int tg_ret = fetch_symbol(q.dst, false);
	int sym_ret = fetch_symbol(pass_sym);
	MC::move(tg_ret, sym_ret);
	map_sym_reg(pass_sym, 0, temp_map);
	// special for pass_sym: valid only once
}

void MipsTable::exit() {
    MC::label_("__exit__");
    MC::li(MC::_v0, 10);
    MC::syscall();
}