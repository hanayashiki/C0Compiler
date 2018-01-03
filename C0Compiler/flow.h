#pragma once
#include "stdafx.h"

typedef vector<BasicBlock*> FlowMap;
class DUNet : public dataSet<DUChain::Loc> {
public:
	Symbol* use_sym;
	DUNet (vector<DUChain::Loc> * e_l)
	{
		elem_list = e_l;
		bit_vec = vector<int>(GET_VEC(e_l->size()) + 1, 0);
		//cout << "dataSet initialized!\n";
	}
	void in_display_idx() {
		bool printed = false;
		coutd << use_sym->name << ": ";
		for (unsigned idx = 0; idx < elem_list->size(); idx++) {
			//cout << idx;
			if (bit_vec.at(GET_VEC(idx)) & (1 << GET_OFFSET(idx))) {
				//display(elem_list.at(idx));
				printed = true;	
				cout << idx << " ";
			}
		}
		if (printed == false) {
			cout << "None\n";
		}
		cout << endl;
	}
};

class Flow {
private:
	sym_list & symbol_list;
	Symbol* func_sym;
	vector<DUNet> dunet_list;
public:
	Flow(sym_list & s_l, Symbol* func_sym);
	~Flow();
	FlowMap flow_map;
	vector<Quaterion> optimized_qlist;
	vector<DUChain::Loc> all_loc_list;
	FastGraph<Symbol*> conf_graph;

	void generate_flow_map(vector<Quaterion> & q_list);
	void get_interval(vector<Quaterion> & q_list,
		Symbol* func_sym, vector<Quaterion>::iterator & begin, 
		vector<Quaterion>::iterator & end);

	void calculate_use_def();
	bool calculate_active_out(BasicBlock * block);
	bool calculate_active_in(BasicBlock * block);

	void dag_optimize();
	void regenerate_qlist(DAG & dag);

	void activity_analysis();
	void generateLocSet();
	void conflict_analyze();
	void getDUNets();
	void addToList(DUNet & net);
	void rename();
	void replace_sym(DUNet & dunet, Symbol* new_sym);
	void generate_conflict_graph();


	void display_blocks();
};