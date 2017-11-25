#include "stdafx.h"

int main() {
    Lexer lexer;
    SymbolTable symbol_table;
    FILE* f = fopen("var_def_test1.txt", "r");
    lexer.setSource(f);
    Syntax syntax(&lexer, &symbol_table);
    syntax.start();
    symbol_table.display();
    getchar();
    return 0;
}