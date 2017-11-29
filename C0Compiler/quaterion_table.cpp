#include "stdafx.h"

QuaterionTable::QuaterionTable() {
    q_list.reserve(QLIST_RESERVE_SIZE);
}

bool QuaterionTable::add_quaterion(Quaterion & q) {
    q_list.push_back(q);
    return true;
}

void QuaterionTable::emit() {
    for (QList::iterator iter = q_list.begin();
        iter != q_list.end(); iter++) {
            iter->emit();
    }
}