#include "stdafx.h"

using namespace SymbolUtils;

int main() {
    Lexer lexer;
    SymbolTable symbol_table;
    QuaterionTable q_table;
    MipsCode::out_file = stdout;
    FILE* f = fopen("translate_test.txt", "r");
    Quaterion::dump_file = stdout;
    lexer.setSource(f);
    Syntax syntax(&lexer, &symbol_table, &q_table);
    syntax.start();
    symbol_table.display();
    q_table.emit();

    //stack test
    sym_list l = symbol_table.get_all();
    for (sym_list::iterator ptr = l.begin();
        ptr != l.end(); ptr++) {
        if ((*ptr)->function_flag) {
            MipsTable m_table((*ptr), &symbol_table, &q_table);
            m_table.translate_all();
            m_table.display_stack();
        }
    }

    cout << "main ended." << endl;
    getchar();
    return 0;
}