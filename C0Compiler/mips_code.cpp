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

void MipsCode::lw(int tg_reg, int offset, int base_reg) {
    fprintf(out_file, "lw $%d %d($%d)\n", tg_reg, offset, base_reg);
}

void MipsCode::lb(int tg_reg, int offset, int base_reg) {
    fprintf(out_file, "lb $%d %d($%d)\n", tg_reg, offset, base_reg);
}

void MipsCode::sw(int src_reg, int offset, int base_reg) {
    fprintf(out_file, "sw $%d %d($%d)\n", src_reg, offset, base_reg);
}

void MipsCode::sb(int src_reg, int offset, int base_reg) {
    fprintf(out_file, "sb $%d %d($%d)\n", src_reg, offset, base_reg);
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

void MipsCode::label_(string l) {
    fprintf(out_file, "%s:\n", l.c_str());
}

void MipsCode::beq(int left_reg, int right_reg, string l) {
    fprintf(out_file, "beq $%d $%d %s\n", left_reg, right_reg,
        l.c_str());
    nop();
}

void MipsCode::bne(int left_reg, int right_reg, string l) {
    fprintf(out_file, "bne $%d $%d %s\n", left_reg, right_reg,
        l.c_str());
    nop();
}

void MipsCode::j(string l) {
    fprintf(out_file, "j %s\n", l.c_str());
    nop();
}

void MipsCode::jal(string l) {
    fprintf(out_file, "jal %s\n", l.c_str());
    nop();
}

void MipsCode::jr(int src_reg) {
    fprintf(out_file, "jr $%d\n", src_reg);
    nop();
}

void MipsCode::sll(int dst_reg, int src_reg, int imm) {
    fprintf(out_file, "sll $%d $%d %d\n", dst_reg, src_reg, imm);
}

void MipsCode::syscall() {
    fprintf(out_file, "syscall\n");
}

void MipsCode::la(int dst_reg, string tag) {
    fprintf(out_file, "la $%d %s\n", dst_reg, tag.c_str());
}

void MipsCode::_data() {
    fprintf(out_file, ".data\n");
}

void MipsCode::_text() {
    fprintf(out_file, ".text\n");
}

void MipsCode::_asciiz(string tag, string str) {
    fprintf(out_file, "%s: .asciiz \"%s\"\n", 
        tag.c_str(), str.c_str());
}

void MipsCode::nop() {
    fprintf(out_file, "nop\n");
}