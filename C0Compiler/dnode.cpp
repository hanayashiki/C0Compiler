#include "StdAfx.h"
#include "DNode.h"


DNode::DNode(): left(NULL), right(NULL), label(NULL),
	calculated_sym(NULL) , needed(false), fake(false)
{
}


DNode::~DNode()
{
}

void DNode::add_sym(Symbol* sym) {
	if (!has_sym(sym)) {
		placed_syms.insert(sym);
	}
}

bool DNode::has_sym(Symbol * sym)
{
	return placed_syms.find(sym) != placed_syms.end();
}

void DNode::display() {
	if (fake) {
		return;
	}
	cout << "------node " << idx << "------\n";
	cout << "op: " << op_names[op] << endl;
	if (left) {
		cout << "left: " << left->idx << "\n";
	}
	if (right) {
		cout << "right: " << right->idx << "\n";
	}
	cout << "symbol(s): ";
	for (set<Symbol*>::iterator s_iter = placed_syms.begin();
		s_iter != placed_syms.end(); s_iter++) {
		if (*s_iter) {
			cout << (*s_iter)->name << " ";
		}
	}
	cout << endl;
}

