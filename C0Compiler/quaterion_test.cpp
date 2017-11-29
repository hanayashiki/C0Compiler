#include "stdafx.h"
/*
#define Q Quaterion

int main() {
    Lexer lexer;
    SymbolTable symbol_table;
    QuaterionTable q_table;
    FILE* f = fopen("quaterion_test1.txt", "r");
    FILE* q_emit = NULL;
    // q_emit = fopen("quaterion_emit.txt", "w");
    q_emit = stdout;
    lexer.setSource(f);
    Syntax syntax(&lexer, &symbol_table);
    syntax.start();
    symbol_table.display();

    Symbol* a = symbol_table.get_sym("a");
    Symbol* b = symbol_table.get_sym("b");
    Symbol* c = symbol_table.get_sym("c");

    Quaterion::dump_file = q_emit;
    Quaterion q1(Q::ADD, a, b, c);
    Quaterion q2(Q::EQ, a, b, c);
    Quaterion q3(Q::TO, a, b, c);
    Quaterion q4(Q::AT, a, b, c);
    Quaterion q5(Q::LT, a, b, c);
    q_table.add_quaterion(q1);
    q_table.add_quaterion(q2);
    q_table.add_quaterion(q3);
    q_table.add_quaterion(q4);
    q_table.add_quaterion(q5);
    q_table.emit();

    fclose(q_emit);
    getchar();
    return 0;
}
*/