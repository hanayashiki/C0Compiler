#include "stdafx.h"

#define MC MipsTable
#define Q Quaterion
#define INT_SIZE 4
#define CHAR_SIZE 1


void MipsTable::translate_all() {
    q_iter = q_table->q_list.begin();
    for (; q_iter != q_table->q_list.end(); q_iter++) {
        //cout << "# " << endl;
        q_iter->emit(true);
        translate(*q_iter);
    }
}


void MipsTable::translate(Q & q) {
    if (q.is_commutative()) {
        commutative_translate(q);
    } else if (q.is_incommutative()) {
        incommutative_translate(q);
    } else if (q.is_branch()) {
        branch_translate(q);
    } else if (q.op == Q::NONE) {
        move_translate(q);
    } else if (q.op == Q::LABEL) {
        label_translate(q);
    } else if (q.op == Q::AT) {
        array_read_translate(q);
    } else if (q.op == Q::TO) {
        array_write_translate(q);
    } else if (q.is_print()) {
        print_translate(q);
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
找出被注销的
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

