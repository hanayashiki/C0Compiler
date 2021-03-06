#include "stdafx.h"

#define MC MipsCode
#define Q Quaterion
#define INT_SIZE 4
#define CHAR_SIZE 1


void MipsTable::translate_all() {
    for (; q_iter != q_table->q_list.end(); q_iter++) {
        //cout << "# " << endl;
        q_iter->emit(true);
        translate(*q_iter);
        if (q_iter->op == Q::EPILOG) {
            break;
        }
    }
}

void MipsTable::translate(Q & q) {
    if (q.is_commutative()) {
        commutative_translate(q);
    } else if (q.is_incommutative()) {
        incommutative_translate(q);
    } else if (q.is_branch()) {
        branch_translate(q);
    } else if ((q.op == Q::NONE) || (q.op == Q::CAST_CHAR) || (q.op == Q::CAST_INT)) {
        move_translate(q);
    } else if (q.op == Q::LABEL) {
        label_translate(q);
    } else if (q.op == Q::AT) {
        array_read_translate(q);
    } else if (q.op == Q::TO) {
        array_write_translate(q);
    } else if (q.is_print()) {
        print_translate(q);
    } else if (q.op == Q::PUSH) {
        push_translate();
    } else if (q.op == Q::CALL) {
        call_func_translate(q);
    } else if ((q.op == Q::RET) || (q.op == Q::EPILOG)){
        return_translate(q);
    } else if (q.op == Q::GET) {
        get_translate(q);
    } else if (q.op == Q::PROLOG) {
        reserve_regs();
    } else if ((q.op == Q::READ_CHAR) || (q.op == Q::READ_INT)) {
        scanf_translate(q);
    } else if (q.op == Q::MINUS) {
        minus_translate(q);
    } else {
        cout << "Warning: untranslated: ";
        FILE * old = q.dump_file;
        q.dump_file = stdout;
        q.emit();
        q.dump_file = old;
        cout << endl;
        //assert(0);
    }
    if (q.dst != NULL) {
        save_symbol(q.dst);
        map_sym_reg(q.dst, 0, temp_map);
    }
}


void MipsTable::init_opt_info(q_ptr & qp) {
    qp->dst && (qp->dst->used = false);
    qp->dst && (qp->dst->defined = false);
    qp->left && (qp->left->used = false);
    qp->left && (qp->left->defined = false);
    qp->right && (qp->right->used = false);
    qp->right && (qp->right->defined = false);
}
/*
�ҳ���ע����
    for (scan_ptr = q_iter; !scan_ptr->is_endblock();
        scan_ptr++) {
        init_opt_info(q_iter);
    }
    for (scan_ptr = q_iter; !scan_ptr->is_endblock();
        scan_ptr++) {
        scan_ptr->right && (scan_ptr->right->used = true);
        scan_ptr->left && (scan_ptr->left->used = true);
        scan_ptr->dst && (scan_ptr->dst->defined = true);
        if ((scan_ptr->dst) && (scan_ptr->dst->defined == true)
            && (scan_ptr->dst->used == false)) {

        }
    }
*/

void MipsTable::display_temp_map() {
    for (reg_map::iterator iter = temp_map->begin();
        iter != temp_map->end(); iter++) {
        cout << iter->first->name << ":$" << iter->second << "; " ;
    }
    cout << endl;
}

vector<Quaterion>::iterator MipsTable::get_base(Symbol* func_sym) {
    Symbol* label = func_sym->start_label;
    vector<Quaterion>::iterator iter;
    for (iter = q_table->q_list.begin();
        iter != q_table->q_list.end(); iter++) {
        if (iter->left == label) {
            break;
        }
    }
    return iter;
}

int MipsTable::alignment(int size, int augment) {
    return (size + augment - 1) 
        / augment * augment;
}

int MipsTable::dig_up(int augment) {
    return (stack_size = alignment(stack_size, 4) + augment);
}

int MipsTable::reg_of(Symbol* sym) {
    if (sym->const_flag) {
        MC::const_to_at(get_const_value(sym));
        return MC::_at;
    } else {
        return fetch_symbol(sym);
    }
}

int MipsTable::precompute(int op, int left, int right) {
    switch (op) {
    case Q::GT:
        return left > right;
    case Q::LT:
        return left < right;
    case Q::GTE:
        return left >= right;
    case Q::LTE:
        return left <= right;
	case Q::SUB:
		return left - right;
	case Q::DIV:
		return left / right;
    default:
        throw "OP not implemented.\n";
    }
}