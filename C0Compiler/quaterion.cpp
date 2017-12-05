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

string Quaterion::get_name(Symbol* sym) {
    string name = "";
    if (sym->const_flag) {
        if (sym->type == Symbol::CHAR) {
            name = "'";
            name.push_back(sym->character_value);
            name.push_back('\'');
        } else if (sym->type == Symbol::INT) {
            name = to_string((long long int)sym->integer_value);
        }
    } else {
        name = sym->name;
    }
    return name;
}

bool Quaterion::is_endblock() {
    return (op == CALL) || (op == BEQZ) || (op == BNEZ)
        || (op == RET) || (op == GOTO);
}

bool Quaterion::is_commutative() {
    return (op == ADD) || (op == MULT) || (op == NE) || (op == EQ);
}

void Quaterion::emit() {
    if ((op >= ADD) && (op <= EQ)) {
        fprintf(dump_file, "%s = %s %s %s;\n",
            get_name(dst).c_str(), get_name(left).c_str(), op_names[op], get_name(right).c_str());
    }
    if (op == TO) {
        fprintf(dump_file, "%s[%s] = %s;\n",
            get_name(dst).c_str(), get_name(left).c_str(), get_name(right).c_str());
    }
    if (op == AT) {
        fprintf(dump_file, "%s = %s[%s];\n",
            get_name(dst).c_str(), get_name(left).c_str(), get_name(right).c_str());
    }
    if ((op >= NONE) && (op <= CAST_CHAR)) {
        fprintf(dump_file, "%s = %s%s;\n",
            get_name(dst).c_str(), op_names[op], get_name(left).c_str());
    }
    if (op == LABEL) {
        fprintf(dump_file, "%s:\n", get_name(left).c_str());
    }
    if ((op >= PROLOG) && (op <= PRINT_STR)) {
        fprintf(dump_file, "%s %s;\n", op_names[op], get_name(left).c_str());
    }
    if ((op >= BEQZ) && (op <= BNEZ)) {
        fprintf(dump_file, "%s %s %s;\n",
            op_names[op], get_name(left).c_str(), get_name(right).c_str());
    }
    if ((op >= GET) && op <= (READ_INT)) {
        fprintf(dump_file, "%s %s;\n", op_names[op], get_name(dst).c_str());
    }
    if ((op >= _LINK) && (op <= RET)) {
        if (left != NULL) {
            fprintf(dump_file, "%s %s;\n", op_names[op], get_name(left).c_str());
        } else {
            fprintf(dump_file, "%s;\n", op_names[op]);
        }
    }
}