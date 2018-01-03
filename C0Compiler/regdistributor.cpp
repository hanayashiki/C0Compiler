#include "stdafx.h"

RegDistributor::RegDistributor(FastGraph<Symbol*>* c_g, vector<int> & regs)
	:conf_graph(c_g)
{
	int reg_limit = regs.size();
	coutd << "deleting.." << endl;
	while (c_g->size() > 1) {
		Symbol* less_than_limit = c_g->get_degree_less_than(reg_limit);
		while (less_than_limit && c_g->size() > 1) {
			coutd << less_than_limit->name << endl;
			vector<FastGraph<Symbol*>::GraphElem> new_ge;
			new_ge = c_g->delete_node(less_than_limit);
			ge_list.insert(ge_list.end(), new_ge.begin(), new_ge.end());

			less_than_limit = c_g->get_degree_less_than(reg_limit);
		}
		if (c_g->size() > 1) {
			c_g->delete_node();
		}
		//ge_list.insert(ge_list.end(), )
	}
	if (c_g->size() > 0) {
		c_g->node_set.begin()->second.elem->global_reg = regs.at(0);
		vector<FastGraph<Symbol*>::GraphElem>::iterator iter =
			ge_list.end();

		coutd << "rebuilding.." << endl;

		while (true) {
			if (iter <= ge_list.begin()) {
				break;
			}
			assert((iter - 1)->node_or_edge == 0);
			iter--;
			Symbol* elem = iter->node;
			c_g->insert_node(iter->node);
			while (iter > ge_list.begin() && (iter - 1)->node_or_edge == 1) {
				iter--;
				c_g->insert_edge(iter->edge.elem1, iter->edge.elem2);
			}
			const set<Symbol*> & adj_set = c_g->get_edges(elem);
			set<int> available_regs(regs.begin(), regs.end());
			for (set<Symbol*>::iterator iter = adj_set.begin();
				iter != adj_set.end(); iter++) {
				available_regs.erase((*iter)->global_reg);
			}
			elem->global_reg = *(available_regs.begin());
		}
	}
}