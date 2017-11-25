#include "stdafx.h"

int main_const_def_test() {
    Lexer lexer;
    SymbolTable symbol_table;
    FILE* f = fopen("const_def_test1.txt", "r");
    lexer.setSource(f);
    Syntax syntax(&lexer, &symbol_table);
    syntax.start();
    symbol_table.display();
    getchar();
    return 0;
}