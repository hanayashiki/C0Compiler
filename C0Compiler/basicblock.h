#pragma once
#include "stdafx.h"

class BasicBlock {
public:
	int id;
    BasicBlock(sym_list & symbol_list,
        vector<Quaterion>::iterator begin,
        vector<Quaterion>::iterator end);
    ~BasicBlock();
    vector<Quaterion*> q_list;
	vector<BasicBlock*> previous;
	vector<BasicBlock*> next;

    sym_list & symbol_list;

    dataSet<Symbol*> def;
    dataSet<Symbol*> use;

    dataSet<Symbol*> active_in;
    // the symbols the block needs
    dataSet<Symbol*> active_out;
    // the symbols following blocks need.
    void init_symbols();
    void calculate_def_use();

	void q_display();
};