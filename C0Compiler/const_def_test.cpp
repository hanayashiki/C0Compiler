#include "stdafx.h"

int main() {
    Lexer lexer;
    SymbolTable symbol_table;
    FILE* f = fopen("const_var_err_test2.txt", "r");
    lexer.setSource(f);
    Syntax syntax(&lexer, &symbol_table);
    syntax.start();
    symbol_table.display();
    cout << "main ended." << endl;
    getchar();
    return 0;
}
