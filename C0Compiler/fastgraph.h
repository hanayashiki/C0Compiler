#pragma once
#include "stdafx.h"
#include <hash_map>

template<typename type>
class FastGraph {
public:
	class FNode {
	public:
		type elem;
		set<type> adj_set;
		bool operator< (const FNode & f) const
		{ 
			return elem < f.elem;
		}
	};
	struct FEdge {
		type elem1;
		type elem2;
	};
	struct GraphElem {
		int node_or_edge;
		type node;
		FEdge edge;
	};
	hash_map<type, FNode> node_set;

	void insert_node(const type &);
	void insert_edge(const type &, const type &);
	vector<GraphElem> delete_node(const type &);
	void delete_node();
	void delete_edge(const type &, const type &);
	bool is_adjacent(const type &, const type &);
	int get_degree(const type &);
	type get_degree_less_than(int limit);
	int size();
	const set<type> & get_edges(const type &);

	void display_edges();
};

template<typename type>
void FastGraph<typename type>::insert_node(const type & elem) {
	FNode new_node;
	new_node.elem = elem;
	
	node_set[elem] = new_node;
}

template<typename type>
void FastGraph<typename type>::insert_edge(const type & elem1, const type & elem2) {
	node_set[elem1].adj_set.insert(elem2);
	node_set[elem2].adj_set.insert(elem1);
}

template<typename type>
vector<typename FastGraph<typename type>::GraphElem>
FastGraph<typename type>::delete_node(const type & elem) {
	vector<GraphElem> ge_list;
	for (set<type>::iterator iter = node_set[elem].adj_set.begin();
		iter != node_set[elem].adj_set.end();) {
		type elem2 = *iter;
		node_set[elem2].adj_set.erase(elem);
		node_set[elem].adj_set.erase(iter++);
		GraphElem ge;
		ge.node_or_edge = 1;
		ge.edge.elem1 = elem;
		ge.edge.elem2 = elem2;
		ge_list.push_back(ge);
	}
	node_set.erase(elem);
	GraphElem ge;
	ge.node_or_edge = 0;
	ge.node = elem;
	ge_list.push_back(ge);
	return ge_list;
}

template<typename type>
void FastGraph<typename type>::delete_edge(const type & elem1, const type & elem2) {
	node_set[elem1].adj_set.erase(elem2);
	node_set[elem2].adj_set.erase(elem1);
}

template<typename type>
bool FastGraph<typename type>::is_adjacent(const type & elem1, const type & elem2) {
	return node_set[elem1].adj_set.find(elem2) != node_set[elem1].adj_set.end();
}

template<typename type>
void FastGraph<typename type>::display_edges() {
	for (hash_map<type, FNode>::iterator iter = node_set.begin();
		iter != node_set.end(); iter++) {
		for (set<type>::iterator n_iter = iter->second.adj_set.begin();
			n_iter != iter->second.adj_set.end(); n_iter++) {
			coutd << iter->second.elem->name << " - " << node_set[*n_iter].elem->name << endl;
		}
	}
}

template<typename type>
int FastGraph<typename type>::get_degree(const type & elem) {
	return node_set[elem].adj_set.size();
}

template<typename type>
type FastGraph<typename type>::get_degree_less_than(int limit) {
	for (hash_map<type, FNode>::iterator iter = node_set.begin();
		iter != node_set.end(); iter++) {
		if (iter->second.adj_set.size() < limit) {
			return iter->second.elem;
		}
	}
	return NULL;
}

template<typename type>
int FastGraph<typename type>::size() {
	return node_set.size();
}

template<typename type>
void FastGraph<typename type>::delete_node() {
	delete_node(node_set.begin()->first);
}

template<typename type>
const set<type> & FastGraph<typename type>::get_edges(const type & elem) {
	return node_set[elem].adj_set;
}