#include "stdafx.h"

void MipsCode::init() {
}

MipsCode::MipsCode(string op_,
    int reg_dst_, int reg_left_, int reg_right_) 
    : op(op_), reg_dst(reg_left_), reg_right(reg_right_)
{
    init();
}