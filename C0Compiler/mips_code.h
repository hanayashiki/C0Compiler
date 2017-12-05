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

    static void lw(int tg_reg, int offset);
    static void lb(int tg_reg, int offset);
    static void sw(int src_reg, int offset);
    static void sb(int src_reg, int offset);

    static void addiu(int tg_reg, int src_reg, int imm);
    static void addu(int tg_reg, int left_reg, int right_reg);
    static void move(int tg_reg, int src_reg);
};