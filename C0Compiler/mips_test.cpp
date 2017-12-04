#include "stdafx.h"

using namespace SymbolUtils;

int main() {
    Symbol* sym1 = new Symbol("a", Symbol::INT);
    Symbol* sym2 = new Symbol("b", Symbol::INT);
    Symbol* sym3 = new Symbol("c", Symbol::INT);

    sym_list l1, l2, l3;
    l1.push_back(sym1);
    l1.push_back(sym2);
    l1.push_back(sym3);
    l2.push_back(sym3);

    l3 = set_diff(l1, l2, true);
    for (sym_list::iterator iter = l3.begin();
        iter != l3.end(); iter++) {
        //if (*iter != NULL)
            (*iter)->display();
    }


    getchar();
    return 0;
}