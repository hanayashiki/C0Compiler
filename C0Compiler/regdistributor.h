#pragma once
#include "stdafx.h"

class RegDistributor {
private:
	FastGraph<Symbol*>* conf_graph;
	vector<FastGraph<Symbol*>::GraphElem> ge_list;
public:
	RegDistributor(FastGraph<Symbol*>* conf_graph, vector<int> & regs);
};