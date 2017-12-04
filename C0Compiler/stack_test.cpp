#include "stdafx.h"

using namespace SymbolUtils;

int main() {
    Lexer lexer;
    SymbolTable symbol_table;
    QuaterionTable q_list;
    FILE* f = fopen("stack_test.txt", "r");
    Quaterion::dump_file = stdout;
    lexer.setSource(f);
    Syntax syntax(&lexer, &symbol_table, &q_list);
    syntax.start();
    symbol_table.display();
    q_list.emit();

    /*stack test*/
    sym_list l = symbol_table.get_all();
    for (sym_list::iterator ptr = l.begin();
        ptr != l.end(); ptr++) {
        if ((*ptr)->function_flag) {
            MipsTable m_table((*ptr), &symbol_table);

            m_table.display_stack();
        }
    }

    cout << "main ended." << endl;
    getchar();
    return 0;
}