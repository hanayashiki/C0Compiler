#include "stdafx.h"
#include "dataset.h"

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