#pragma once
#include "stdafx.h"

class DNode
{
private:
	
public:
	
	DNode();
	~DNode();
	
	set<Symbol*> placed_syms;
	int idx;
	bool needed;
	
	int op;
	DNode* left;
	DNode* right;

	Symbol* label;

	Symbol* calculated_sym;

	Quaterion q; // to save the false quaterion
	bool fake;

	void add_sym(Symbol* sym);
	void display();
	
};

