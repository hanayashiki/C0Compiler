#include "stdafx.h"
#include <algorithm>

using namespace SymbolUtils;

bool comp(Symbol* & a, Symbol* & b)
{
    return ((*a) < (*b));
}

sym_list SymbolUtils::set_diff(sym_list & left, sym_list & right, bool do_sort) {
    if (do_sort) {
        sort(left.begin(), left.end(), comp);
        sort(right.begin(), right.end(), comp);
    }
   // cout << "sorted";
    sym_list new_list;
    new_list.resize(max(left.size(), right.size()), NULL); 
    sym_list::iterator new_iter = 
        set_difference(left.begin(), left.end(),
        right.begin(), right.end(), new_list.begin());
    new_list.resize(new_iter - new_list.begin());

    return new_list;
}

