#pragma once
#include "stdafx.h"

class MipsCode {
public:
    static FILE* out_file;
    string op;
    enum registers {
        _zero,
        _at,
        _v0,
        _v1,
        _a0, _a1, _a2, _a3,
        _t0, _t1, _t2, _t3, _t4, _t5, _t6, _t7,
        _s0, _s1, _s2, _s3, _s4, _s5, _s6, _s7,
        _t8, _t9,
        _k0, _k1,
        _gp, _sp, _fp, _ra
    };
    int reg_dst;
    int reg_left;
    int reg_right;
    int immediate;
    
    string label;

    void init();
    MipsCode(string op, int reg_dst, int reg_left, int reg_right);
    void display();

    static void lw(int tg_reg, int offset, int base_reg=_sp);
    static void lb(int tg_reg, int offset, int base_reg=_sp);
    static void sw(int src_reg, int offset, int base_reg=_sp);
    static void sb(int src_reg, int offset, int base_reg=_sp);

    static void addiu(int tg_reg, int src_reg, int imm);
    static void addu(int tg_reg, int left_reg, int right_reg);
    static void mul(int tg_reg, int left_reg, int right_reg);
    static void div(int left_reg, int right_reg);
    static void mfhi(int dst_reg);
    static void mflo(int dst_reg);
    
    static void subu(int tg_reg, int left_reg, int right_reg);

    static void xor(int dst_reg, int left_reg, int right_reg);
    static void xori(int dst_reg, int left_reg, int imm);

    static void sltiu(int dst_reg, int left_reg, int imm);
    
    static void label_(string l);
    static void beq(int left_reg, int right_reg, string l);
    static void bne(int left_reg, int right_reg, string l);
    static void j(string l);
    static void jal(string l);
    static void jr(int src_reg);

    static void sll(int dst_reg, int src_reg, int imm);

    static void slt(int dst_reg, int left, int right);
    static void slti(int dst_reg, int src_reg, int imm);

    static void syscall();
    static void la(int dst_reg, string tag);

    // utils
    static void const_to_at(int c); 
    static void li(int reg, int const_);
    static void move(int dst_reg, int src_reg);
    static void nop();
    static void sle(int dst_reg, int left, int right);
    static void slei(int dst_reg, int left, int imm);
    static void sgt(int dst_reg, int left, int right);
    static void sgti(int dst_reg, int left, int imm);
    static void sge(int dst_reg, int left, int right);
    static void sgei(int dst_reg, int left, int imm);
    static void mns(int dst_reg, int src_reg);
    // data
    static void _data();
    static void _asciiz(string tag, string str);
    // text
    static void _text();
};