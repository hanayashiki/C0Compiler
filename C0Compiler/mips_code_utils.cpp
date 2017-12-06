#include "stdafx.h"

void MipsCode::const_to_at(int c) {
    addiu(_at, _zero, c);
}

void MipsCode::li(int reg, int const_) {
    addiu(reg, _zero, const_);
}

void MipsCode::move(int dst_reg, int src_reg) {
    addiu(dst_reg, src_reg, 0);
}