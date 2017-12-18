#pragma once
#include "stdafx.h"

typedef vector<BasicBlock*> FlowMap;

class Flow {
private:
	sym_list & symbol_list;
	Symbol* func_sym;
public:
	Flow(sym_list & s_l, Symbol* func_sym);
	~Flow();
	FlowMap flow_map;
	void generate_flow_map(vector<Quaterion> & q_list);
	void get_interval(vector<Quaterion> & q_list,
		Symbol* func_sym, vector<Quaterion>::iterator & begin, 
		vector<Quaterion>::iterator & end);

	void calculate_use_def();
	void activity_analysis();
	bool calculate_active_out(BasicBlock * block);
	bool calculate_active_in(BasicBlock * block);

	void display_blocks();
};