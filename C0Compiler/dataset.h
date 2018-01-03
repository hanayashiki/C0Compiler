#pragma once
#include "stdafx.h"

template<class elem> 
class dataSet {
public:
	vector<elem> * elem_list;
    vector<int> bit_vec;

	dataSet();
    dataSet(vector<elem> * e_l);
    ~dataSet();
    void set_elem_list(vector<elem> * e_l);

    bool map_elem(int idx, bool in=true);
	bool map_elem_list(vector<int> & idx_l);
	bool included(int idx);
    
    void set_union(dataSet & src1, dataSet & src2);
    void set_intersect(dataSet & src1, dataSet & src2);
    void set_difference(dataSet & src1, dataSet & src2);

	bool is_crossed(dataSet<elem> & ds);

	int size();
	int u_size();

    void in_display(void (*display)(elem & e) = NULL);  // display that is included

};

#define GET_VEC(x) ((x)/32)
#define GET_OFFSET(x) ((x)%32)

template<class elem>
dataSet<elem>::dataSet(vector<elem> * e_l): elem_list(e_l)
{
	bit_vec = vector<int>(GET_VEC(e_l->size()) + 1, 0);
    //cout << "dataSet initialized!\n";
}

template<class elem>
dataSet<elem>::dataSet()
{
	//cout << "dataSet initialized!\n";
}


template<class elem>
void dataSet<elem>::set_elem_list(vector<elem> * e_l) {
    elem_list = e_l;
    bit_vec = vector<int>(GET_VEC(e_l->size()) + 1, 0);
}

template<class elem>
dataSet<elem>::~dataSet() {
    //cout << "dataSet deleted!\n";
}

template<class elem>
bool dataSet<elem>::map_elem(int idx, bool in) {
    int vec = GET_VEC(idx);
    assert((unsigned)idx < elem_list->size());
    
    if (in) {
        bit_vec.at(vec) |= 1 << GET_OFFSET(idx);
        //cout << hex << bit_vec.at(vec) << dec; 
    } else {
        bit_vec.at(vec) &= ~(1 << GET_OFFSET(idx));
    }
    return true;
}

template<class elem>
inline bool dataSet<elem>::map_elem_list(vector<int>& idx_l)
{
	for (vector<int>::iterator iter = idx_l.begin();
		iter != idx_l.end(); iter++) {
		map_elem(*iter, true);
	}
	return true;
}

template<class elem>
bool dataSet<elem>::included(int idx)
{
	return ((bit_vec.at(GET_VEC(idx)) & (1 << GET_OFFSET(idx))) != 0);
}

template<class elem>
void dataSet<elem>::set_union(dataSet & src1, dataSet & src2) {
    for (unsigned idx = 0; idx <= GET_VEC(src1.elem_list->size()-1); 
        idx++) {
        bit_vec.at(idx) = src1.bit_vec.at(idx) | 
            src2.bit_vec.at(idx);
    }
}

template<class elem>
void dataSet<elem>::set_intersect(dataSet & src1, dataSet & src2) {
    for (unsigned idx = 0; idx <= GET_VEC(src1.elem_list->size()-1); 
        idx++) {
        bit_vec.at(idx) = src1.bit_vec.at(idx) & 
            src2.bit_vec.at(idx);
    }
}

template<class elem>
void dataSet<elem>::set_difference(dataSet & src1, dataSet & src2) {
    for (unsigned idx = 0; idx <= GET_VEC(src1.elem_list->size()-1); 
        idx++) {
        bit_vec.at(idx) = src1.bit_vec.at(idx) & 
            (~src2.bit_vec.at(idx));
        //cout << bit_vec.at(idx);
    }
}

template<class elem>
void dataSet<elem>::in_display(void (*display)(elem & e)) {
	int printed = false;
	for (unsigned idx = 0; idx < elem_list->size(); idx++) {
        //cout << idx;
        if (bit_vec.at(GET_VEC(idx)) & (1 << GET_OFFSET(idx))) {
            //display(elem_list.at(idx));
			printed = true;
            elem_list->at(idx)->display();
        }
    }
	if (printed == false) {
		cout << "None\n";
	}
}

template<class elem>
int dataSet<elem>::size() {
	int count = 0;
	for (unsigned idx = 0; idx < elem_list->size(); idx++) {
		//cout << idx;
		if (bit_vec.at(GET_VEC(idx)) & (1 << GET_OFFSET(idx))) {
			count++;
		}
	}
	return count;
}

template<class elem>
int dataSet<elem>::u_size() {
	return elem_list->size();
}

template<class elem>
bool dataSet<elem>::is_crossed(dataSet<elem> & ds) {
	for (unsigned idx = 0; idx <= GET_VEC(ds.elem_list->size() - 1);
		idx++) {
		int and = bit_vec.at(idx) & ds.bit_vec.at(idx);
		if (and != 0) {
			return true;
		}
	}
	return false;
}