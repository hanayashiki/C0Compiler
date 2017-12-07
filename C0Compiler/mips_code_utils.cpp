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

void MipsCode::sle(int dst_reg, int left, int right) {
    // <=
    addiu(_at, left, -1);
    slt(dst_reg, _at, right);
}

void MipsCode::slei(int dst_reg, int left, int imm) {
    // <= immediate
    addiu(_at, left, -1);
    slti(dst_reg, _at, imm);
}

void MipsCode::sgt(int dst_reg, int left, int right) {
    // >
    slt(dst_reg, right, left);
}

void MipsCode::sgti(int dst_reg, int left, int imm) {
    // > immediate
    li(_at, imm);
    slt(dst_reg, _at, left);
}

void MipsCode::sge(int dst_reg, int left, int right) {
    // a >= b = ~(a < b) = (a < b) ^ 1
    slt(_at, left, right);
    xori(dst_reg, _at, 1);
}

void MipsCode::sgei(int dst_reg, int left, int imm) {
    slti(_at, left, imm);
    xori(dst_reg, _at, 1);
}