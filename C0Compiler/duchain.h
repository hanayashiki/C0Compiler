#pragma once
#include "stdafx.h"

class Flow;

class DUChain {
public:
	int q_id;
	Symbol* tg_sym;
	static Flow* flow;
	typedef int Loc; // block id, q id
	typedef vector<Loc> Chain;
	Chain chain;
	DUChain(int b_id, int q_id, int start_q_id,
		Symbol* def_sym=NULL);

	Quaterion* get_quat(int b_id, int q_id);
	BasicBlock * get_block(int b_id);
	vector<Loc> traverse_block(BasicBlock* b,
		int from,
		bool & killed);
};

