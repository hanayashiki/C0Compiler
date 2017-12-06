#include "stdafx.h"
#include <algorithm>

using namespace SymbolUtils;

bool SymbolUtils::comp(Symbol* & a, Symbol* & b)
{
    return ((*a) < (*b));
}

sym_list SymbolUtils::diff(sym_list & left, sym_list & right, bool do_sort) {
   /* for (sym_list::iterator iter = left.begin();
        iter != left.end(); iter++) {
        //if (*iter != NULL)
            (*iter)->display();
    }*/

    if (do_sort) {
        sort(left.begin(), left.end(), comp);
        sort(right.begin(), right.end(), comp);
       // cout << "sorted";
    }/*
    for (sym_list::iterator iter = left.begin();
        iter != left.end(); iter++) {
        //if (*iter != NULL)
            (*iter)->display();
    }*/


    sym_list new_list;
    new_list.resize(left.size(), NULL); 
    sym_list::iterator new_iter = 
        set_difference(left.begin(), left.end(),
        right.begin(), right.end(), new_list.begin(), comp);
    new_list.resize(new_iter - new_list.begin());

    return new_list;
}

sym_list SymbolUtils::union_(sym_list & left, sym_list & right, bool do_sort) {
    if (do_sort) {
        sort(left.begin(), left.end(), comp);
        sort(right.begin(), right.end(), comp);
    }
   // cout << "sorted";
    sym_list new_list;
    new_list.resize(left.size() + right.size(), NULL); 
    sym_list::iterator new_iter = 
        set_union(left.begin(), left.end(),
        right.begin(), right.end(), new_list.begin(), comp);
    new_list.resize(new_iter - new_list.begin());    

    return new_list;
}

sym_list SymbolUtils::intersection(sym_list & left, sym_list & right, bool do_sort) {
    if (do_sort) {
        sort(left.begin(), left.end(), comp);
        sort(right.begin(), right.end(), comp);
    }
   // cout << "sorted";
    sym_list new_list;
    new_list.resize(min(left.size(), right.size()), NULL); 
    sym_list::iterator new_iter = 
        set_intersection(left.begin(), left.end(),
        right.begin(), right.end(), new_list.begin(), comp);
    new_list.resize(new_iter - new_list.begin());    

    return new_list;
}

int SymbolUtils::get_const_value(Symbol* sym) {
    assert(sym->const_flag);
    if (sym->type == Symbol::CHAR) {
        return (int)sym->character_value;
    }
    if (sym->type == Symbol::INT) {
        return (int)sym->integer_value;
    }
}

