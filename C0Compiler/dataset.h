#pragma once
#include "stdafx.h"

template<class elem> 
class dataSet {
private:
    vector<elem> * elem_list;
public:
    vector<int> bit_vec;

	dataSet();
    dataSet(vector<elem> * e_l);
    ~dataSet();
    void set_elem_list(vector<elem> * e_l);

    bool map_elem(int idx, bool in=true);
	bool included(int idx);
    
    void set_union(dataSet & src1, dataSet & src2);
    void set_intersect(dataSet & src1, dataSet & src2);
    void set_difference(dataSet & src1, dataSet & src2);

	int size();

    void in_display(void (*display)(elem & e) = NULL);  // display that is included
};

#include "dataset.cpp"  // 不这么写会出现无法解析的外部符号，因为需要先生成其方法