#include "stdafx.h"

FILE* Quaterion::dump_file = NULL;

void Quaterion::init(int op_name) {
    dst = NULL;
    left = NULL;
    right = NULL;
    op = op_name;
}

Quaterion::Quaterion(int op_name,
    Symbol* dst_, Symbol* left_, Symbol* right_) {
    init(op_name);
    dst = dst_;
    left = left_;
    right = right_;
}

Quaterion::Quaterion(int op_name,
    Symbol* dst_, Symbol* left_) {
    init(op_name);
    dst = dst_;
    left = left_;
}

Quaterion::Quaterion(int op_name,
    Symbol* left_) {
    init(op_name);
    if (op_name == GET) {
        dst = left_;
    } else {
        left = left_;
    }
}

Quaterion::Quaterion(Symbol* dst_,
    Symbol* left_) {
    init(NONE);
    dst = dst_;
    left = left_;
}

void Quaterion::emit() {
    if ((op >= ADD) && (op <= EQ)) {
        fprintf(dump_file, "%s = %s %s %s;\n",
            dst->name.c_str(), left->name.c_str(), op_names[op], right->name.c_str());
    }
    if (op == TO) {
        fprintf(dump_file, "%s[%s] = %s;\n",
            dst->name.c_str(), left->name.c_str(), right->name.c_str());
    }
    if (op == AT) {
        fprintf(dump_file, "%s = %s[%s];\n",
            dst->name.c_str(), left->name.c_str(), right->name.c_str());
    }
    if ((op >= NONE) && (op <= CAST_CHAR)) {
        fprintf(dump_file, "%s = %s%s;\n",
            dst->name.c_str(), op_names[op], left->name.c_str());
    }
    if (op == LABEL) {
        fprintf(dump_file, "%s:\n", left->name.c_str());
    }
    if ((op >= PROLOG) && (op <= CALL)) {
        fprintf(dump_file, "%s %s\n", op_names[op], left->name.c_str());
    }
    if ((op >= BEQZ) && (op <= BNEZ)) {
        fprintf(dump_file, "%s %s %s\n",
            op_names[op], left->name.c_str(), right->name.c_str());
    }
    if ((op >= GET) && op <= (READ_INT)) {
        fprintf(dump_file, "%s %s\n", op_names[op], dst->name.c_str());
    }
}