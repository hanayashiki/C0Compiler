#include "stdafx.h"

#define MC MipsCode

using namespace SymbolUtils;

Symbol* MipsTable::findUselessSymbol() {
    q_ptr scan_ptr;
    vector<Symbol*> in_place_syms(reg_distrb.begin() + MC::_t0, 
        reg_distrb.begin() + MC::_t7 + 1);
    vector<Symbol*> show_up_syms;
    for (scan_ptr = q_iter; scan_ptr != q_table->q_list.end() && 
        !scan_ptr->is_endblock();
        scan_ptr++) {
        init_opt_info(scan_ptr);
        // use 'used' as already added to show_up_syms
    }
    for (scan_ptr = q_iter; scan_ptr != q_table->q_list.end() &&
        !scan_ptr->is_endblock();
        scan_ptr++) {
        vector<Symbol*> to_handle;
        to_handle.push_back(scan_ptr->dst);
        to_handle.push_back(scan_ptr->right);
        to_handle.push_back(scan_ptr->left);
        for (vector<Symbol*>::iterator iter = to_handle.begin();
            iter != to_handle.end();
            iter++) {
            if (*iter && ((*iter)->used == false)) {
                (*iter)->used = true;
                show_up_syms.push_back(*iter);
            }
        }
    }
    vector<Symbol*> write_backable = 
        diff(in_place_syms, show_up_syms);
    if (write_backable.size()) {
        return write_backable[0];
    } else {
        return in_place_syms[0];
    }
}

