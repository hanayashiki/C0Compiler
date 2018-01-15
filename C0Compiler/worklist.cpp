#include "stdafx.h"

void Flow::conflict_analyze() {
	getDUNets();
	rename();
	for (FlowMap::iterator b_iter = flow_map.begin();
		b_iter != flow_map.end();
		b_iter++) {
		for (vector<Quaterion*>::iterator q_iter =
			(*b_iter)->q_list.begin();
			q_iter != (*b_iter)->q_list.end();
			q_iter++) {
			optimized_qlist.push_back(**q_iter);
		}
	}
	generate_conflict_graph();

	vector<int> global_regs(begin(__global_regs__), end(__global_regs__));
	RegDistributor(&conf_graph, global_regs);
	
	for (vector<DUNet>::iterator iter = dunet_list.begin();
		iter != dunet_list.end(); iter++) {
		coutd << iter->use_sym->name << ": $" <<
			iter->use_sym->global_reg << endl;
	}
}

void Flow::getDUNets() {
	int cur_q_id = 0;
	generateLocSet();
	DUChain::flow = this;
	
	vector<Symbol*> & param_list = func_sym->parameter_type_list;
	for (vector<Symbol*>::iterator s_iter = param_list.begin();
		s_iter != param_list.end(); s_iter++) {
		DUNet new_chain(&all_loc_list);
		DUChain du_chain(0, 0, cur_q_id, *s_iter);
		coutd << du_chain.tg_sym->name << endl;
		new_chain.use_sym = du_chain.tg_sym;
		new_chain.map_elem_list(du_chain.chain);
		new_chain.in_display_idx();
		addToList(new_chain);
		//if ((*s_iter)->name == "r")
		//	getchar();
	}
	
	for (FlowMap::iterator b_iter = flow_map.begin();
		b_iter != flow_map.end(); b_iter++) {
		for (vector<Quaterion*>::iterator
			q_iter = (*b_iter)->q_list.begin();
			q_iter != (*b_iter)->q_list.end();
			q_iter++) {
			if (((*q_iter)->dst != NULL) && !(*q_iter)->dst->global) { // a def
				//coutd << (*q_iter)->dst->name << endl;
				int b_id = b_iter - flow_map.begin();
				int q_id = q_iter - (*b_iter)->q_list.begin();
				DUNet new_chain(&all_loc_list);
				DUChain du_chain(b_id, q_id, cur_q_id);
				//coutd << du_chain.tg_sym->name << endl;
				new_chain.use_sym = du_chain.tg_sym;
				new_chain.map_elem_list(du_chain.chain);
				new_chain.in_display_idx();
				addToList(new_chain);
			}
			cur_q_id++;
		}
	}
}

void Flow::generateLocSet() {
	int cur_q_id = 0;
	for (FlowMap::iterator b_iter = flow_map.begin();
		b_iter != flow_map.end(); b_iter++) {
		for (vector<Quaterion*>::iterator
			q_iter = (*b_iter)->q_list.begin();
			q_iter != (*b_iter)->q_list.end();
			q_iter++) {
			all_loc_list.push_back((*b_iter)->id);
		}
	}
}

void Flow::addToList(DUNet & net) {
	for (vector<DUNet>::iterator d_iter = dunet_list.begin();
		d_iter != dunet_list.end();) {
		if (d_iter->use_sym == net.use_sym &&
			(d_iter->is_crossed(net) ||
			net.use_sym->array_flag)
			) {
			//d_iter->set_union(*d_iter, net);
			net.set_union(net, *d_iter);
			d_iter = dunet_list.erase(d_iter);
			//cout << "merged: " << d_iter->use_sym->name << endl;
		}
		else {
			d_iter++;
		}
	}
	dunet_list.push_back(net);
}

void Flow::rename() {
	hash_map<Symbol*, int> repeat;
	for (vector<DUNet>::iterator d_iter = dunet_list.begin();
		d_iter != dunet_list.end(); d_iter++) {
		Symbol* sym = d_iter->use_sym;
		if (repeat.find(sym) == repeat.end()) {
			repeat[sym] = 0;
		}
		else {
			repeat[sym]++;
			Symbol* new_sym = new Symbol(*sym);
			new_sym->name = new_sym->name + "#" +
				to_string((long long)repeat[sym]);

			func_sym->symbol_table->add_map(new_sym->name, new_sym);
			replace_sym(*d_iter, new_sym);
			d_iter->use_sym = new_sym;
		}
	}
}

void Flow::replace_sym(DUNet & dunet, Symbol* new_sym) {
	Symbol* to_replace = dunet.use_sym;
	for (int idx = 0; idx < dunet.u_size(); idx++) {
		int cur_q_id = 0;
		for (FlowMap::iterator b_iter = flow_map.begin();
			b_iter != flow_map.end(); b_iter++) {
			for (vector<Quaterion*>::iterator
				q_iter = (*b_iter)->q_list.begin();
				q_iter != (*b_iter)->q_list.end();
				q_iter++) {
				if (dunet.included(cur_q_id)) {
					if ((*q_iter)->dst == to_replace) {
						(*q_iter)->dst = new_sym;
					}
					if ((*q_iter)->left == to_replace) {
						(*q_iter)->left = new_sym;
					}
					if ((*q_iter)->right == to_replace) {
						(*q_iter)->right = new_sym;
					}
				}
				cur_q_id++;
			}
		}
	}
}

void Flow::generate_conflict_graph() {
	for (vector<DUNet>::iterator iter1 = dunet_list.begin();
		iter1 != dunet_list.end(); iter1++) {
		conf_graph.insert_node(iter1->use_sym);
	}
	if (dunet_list.size() >= 2) {
		for (vector<DUNet>::iterator iter1 = dunet_list.begin();
			iter1 <= dunet_list.end() - 2; iter1++) {
			for (vector<DUNet>::iterator iter2 = iter1 + 1;
				iter2 <= dunet_list.end() - 1; iter2++) {
				if (iter1->is_crossed(*iter2)) {
					conf_graph.insert_edge(iter1->use_sym, iter2->use_sym);
				}
			}
		}
	}
	//conf_graph.display_edges();
}
