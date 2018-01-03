#include "stdafx.h"

class QuaterionTable {
private:
    static const int QLIST_RESERVE_SIZE = 1024;
public:
	int q_idx;
    Symbol* entry_symbol;
    typedef vector<Quaterion> QList;
    QList q_list;
    QuaterionTable();
    bool add_quaterion(Quaterion & q);
    void emit();
};