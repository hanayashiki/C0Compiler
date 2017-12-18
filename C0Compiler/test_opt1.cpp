#include "stdafx.h"
/*
int main() {
    vector<Symbol*> sym_list;
    for (int i = 0; i < 71; i++) {
        sym_list.push_back(new Symbol("s_"+
            to_string((long long int) i),
            Symbol::INT));
    }

    dataSet<Symbol*> q_set1(sym_list);
    dataSet<Symbol*> q_set2(sym_list);
    dataSet<Symbol*> q_set3(sym_list);
    
    for (int i = 25; i <= 65; i++) {
        q_set1.map_elem(i);
    }

    for (int i = 30; i <= 70; i++) {
        q_set2.map_elem(i);
    }

    cout << "set1:\n";
    q_set1.in_display(NULL);
    cout << "set2:\n";
    q_set2.in_display(NULL);

    cout << "set3 = set1 - set2:\n";
    q_set3.set_difference(q_set1, q_set2);
    q_set3.in_display(NULL);

    cout << "set3 = set1 | set2:\n";
    q_set3.set_union(q_set1, q_set2);
    q_set3.in_display(NULL);

    cout << "set3 = set1 & set2:\n";
    q_set3.set_intersect(q_set1, q_set2);
    q_set3.in_display(NULL);

    getchar();
    return 0;
}
*/