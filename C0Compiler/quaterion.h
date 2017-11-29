#include "stdafx.h"

class Quaterion {
public:
    static FILE* dump_file;
    enum operators {
        ADD, MULT,
        SUB, DIV,
        LT, LTE, GT, GTE,
        NE, EQ,

        TO,  // a[i] = b, a = b TO i
        AT,  // c = a[i], c = A AT i

        NONE, // a = b
        MINUS, // a = -b
        CAST_INT, // a = (int) b
        CAST_CHAR, // a = (char) b

        LABEL,
        PROLOG,

        PUSH,    // push parameter
        CALL,
        GET,    // get returned value
        END  // sentinel
    };
    static const int OP_COUNT = END;

    Symbol* dst;
    Symbol* left;
    Symbol* right;
    int op;

    void init(int op_name);
    Quaterion(int op_name, Symbol*, Symbol*, Symbol*);
    Quaterion(int op_name, Symbol* dst, Symbol* left);
    Quaterion(int op_name, Symbol* left);
    Quaterion(int op_name);
    Quaterion(Symbol* dst, Symbol* left); // a = b
    void emit();
};

static char* op_names[Quaterion::OP_COUNT] =
{
    "+", "*",
    "-", "/",
    "<", "<=", ">", ">=",
    "!=", "==",

    "[]=",
    "[]=",

    "",
    "-",
    "(int)",
    "(char)",

    ":",
    "PROLOG",
    "PUSH",
    "CALL",
    "GET" 
};

