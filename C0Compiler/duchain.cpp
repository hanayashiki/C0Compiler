#include "stdafx.h"
Flow* DUChain::flow = NULL;

DUChain::DUChain(int block_id, int quat_id, int start_q_id, Symbol* def_sym)
	: tg_sym(def_sym)
{
	bool killed;
	vector<BasicBlock*> Queue;
	set<BasicBlock*> visited_blocks;
	Queue.push_back(get_block(block_id));

	if (def_sym == NULL) {
		tg_sym = get_quat(block_id, quat_id)->dst;
	}

	//coutd << block_id << " " << quat_id << " " << start_q_id << endl;
	
	vector<Loc> new_locs = traverse_block(get_block(block_id),
		quat_id + 1,
		killed);

	coutd << tg_sym->name << ": " << get_quat(block_id, quat_id)->idx << endl;

	chain.push_back(get_quat(block_id, quat_id)->idx); // the head is the def
	chain.insert(chain.end(), new_locs.begin(),
		new_locs.end());

	if (!killed) {
		while (Queue.size()) {
			BasicBlock* current_block = Queue.back();
			Queue.pop_back();
			for (vector<BasicBlock*>::iterator b_iter
				= current_block->next.begin();
				b_iter != current_block->next.end();
				b_iter++) {
				if (visited_blocks.find(*b_iter) == visited_blocks.end()) {
					bool killed;
					visited_blocks.insert(*b_iter);
					vector<Loc> new_locs = traverse_block(*b_iter, 0,
						killed);
					chain.insert(chain.end(), new_locs.begin(),
						new_locs.end());
					if (!killed) {
						Queue.push_back(*b_iter);
					}
				}
			}
		}
	}
}

Quaterion* DUChain::get_quat(int b_id, int q_id) {
	BasicBlock* block = get_block(b_id);
	return block->q_list.at(q_id);
}

BasicBlock* DUChain::get_block(int b_id) {
	return flow->flow_map.at(b_id);
}

vector<DUChain::Loc>
DUChain::traverse_block(BasicBlock* b, int from, bool & killed) {
	vector<Loc> locs;
	killed = false;
	for (int idx = from; idx < b->q_list.size(); idx++) {
		Quaterion* q = get_quat(b->id, idx);

		if (q->dst == tg_sym) {
			if (q->left == tg_sym || q->right == tg_sym) {
				locs.push_back(q->idx);
			}
			else {
				killed = true;
				//coutd << tg_sym->name << " is killed at " << q_id << endl\;
				break;
			}
		}
		else {
			locs.push_back(q->idx);
		}
	}
	if (!b->active_out.included(tg_sym->id)) {
		//coutd << tg_sym->name << " is killed at " << q_id << endl;
		killed = true;
	}
	return locs;
}