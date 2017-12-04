#pragma once
#include "stdafx.h"

class MipsCode {
public:
    string op;

    int reg_dst;
    int reg_left;
    int reg_right;
    int immediate;

    string label;

    void init();
    MipsCode(string op, int reg_dst, int reg_left, int reg_right);
    void display();
};