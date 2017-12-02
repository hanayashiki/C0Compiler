#include "stdafx.h"

int main() {
    Lexer lexer;
    SymbolTable symbol_table;
    QuaterionTable q_list;
    FILE* f = fopen("for_error.txt", "r");
    Quaterion::dump_file = stdout;
    lexer.setSource(f);
    Syntax syntax(&lexer, &symbol_table, &q_list);
    syntax.start();
    symbol_table.display();
    q_list.emit();
    cout << "main ended." << endl;
    getchar();
    return 0;
}