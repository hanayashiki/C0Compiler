#include "stdafx.h"

#define MC MipsCode

FILE* MipsCode::out_file = NULL;

void MipsCode::init() {
}

MipsCode::MipsCode(string op_,
    int reg_dst_, int reg_left_, int reg_right_) 
    : op(op_), reg_dst(reg_left_), reg_right(reg_right_)
{
    init();
}

void MipsCode::lw(int tg_reg, int offset) {
    fprintf(out_file, "lw $%d 0x%x($%d)\n", tg_reg, offset, _sp);
}

void MipsCode::lb(int tg_reg, int offset) {
    fprintf(out_file, "lb $%d 0x%x($%d)\n", tg_reg, offset, _sp);
}

void MipsCode::sw(int src_reg, int offset) {
    fprintf(out_file, "sw $%d 0x%x($%d)\n", src_reg, offset, _sp);
}

void MipsCode::sb(int src_reg, int offset) {
    fprintf(out_file, "sb $%d 0x%x($%d)\n", src_reg, offset, _sp);
}

void MipsCode::addiu(int tg_reg, int src_reg, int imm) {
    fprintf(out_file, "addiu $%d $%d %d\n", tg_reg, src_reg, imm);
}

void MipsCode::addu(int tg_reg, int left_reg, int right_reg) {
    fprintf(out_file, "addu $%d $%d $%d\n", tg_reg, left_reg, right_reg);
}

void MipsCode::subu(int tg_reg, int left_reg, int right_reg) {
    fprintf(out_file, "subu $%d $%d $%d\n", tg_reg, left_reg, right_reg);
}

void MipsCode::move(int tg_reg, int src_reg) {
    fprintf(out_file, "addiu $%d $%d 0\n", tg_reg, src_reg);
}

void MipsCode::mul(int dst_reg, int left_reg, int right_reg) {
    fprintf(out_file, "mul $%d $%d $%d\n", dst_reg, 
        left_reg, right_reg);
}

void MipsCode::div(int left_reg, int right_reg) {
    fprintf(out_file, "div $%d $%d\n", left_reg, right_reg);
}

void MipsCode::mfhi(int dst_reg) {
    fprintf(out_file, "mfhi $%d\n", dst_reg);
}

void MipsCode::mflo(int dst_reg) {
    fprintf(out_file, "mflo $%d\n", dst_reg);
}

void MipsCode::xor(int dst_reg, int left_reg, int right_reg) {
    fprintf(out_file, "xor $%d $%d $%d\n", dst_reg,
        left_reg, right_reg);
}

void MipsCode::xori(int dst_reg, int left_reg, int imm) {
    fprintf(out_file, "xori $%d $%d %d\n", dst_reg,
        left_reg, imm);
}

void MipsCode::sltiu(int dst_reg, int left_reg, int imm) {
    fprintf(out_file, "sltiu $%d $%d %d\n", dst_reg, left_reg,
        imm);
}