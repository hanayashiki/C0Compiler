#include "stdafx.h"
#include <time.h>
/*
using namespace SymbolUtils;

int main() {
    Lexer lexer;
    SymbolTable symbol_table;
    QuaterionTable q_table;
    vector<Symbol*> string_table;
    mem_map root_map;

    clock_t start,stop;
    start = clock();

    MipsCode::out_file = fopen("mips.asm", "w");
    FILE* f = fopen("public_test.txt", "r");
    if (f == NULL) {
        cout << "File not exist. " << endl;
        getchar();
        exit(1);
    }
    Quaterion::dump_file = stdout;
    lexer.setSource(f);
    Syntax syntax(&lexer, &symbol_table, &q_table, &string_table);
    syntax.start();
    //symbol_table.display();
    //q_table.emit();

    MipsData md(&string_table, &symbol_table, &root_map);
    md.dump_data();
    md.map_root();
    MipsCode::_text();
    if (q_table.entry_symbol) {
        MipsCode::j(q_table.entry_symbol->start_label->name);
    }
    Quaterion::dump_file = MipsCode::out_file;

    //stack test
    sym_list l = symbol_table.get_all();
    for (sym_list::iterator ptr = l.begin();
        ptr != l.end(); ptr++) {
        if ((*ptr)->function_flag) {
            MipsTable m_table((*ptr), &symbol_table, &q_table, &root_map);
            m_table.translate_all();
            m_table.display_stack();
        }
    }
    MipsTable::exit();
    stop = clock();
    printf("Use Time: %f\n",((double)(stop-start))/CLOCKS_PER_SEC);
    cout << "main ended." << endl;

    fclose(MipsCode::out_file);
    fclose(f);
    if (syntax.errors == 0) {
        //system("java -jar Mars4_5.jar mips.asm");
        system("mips.asm");
    } else {
        cout << "Compilation Error(s): " << syntax.errors 
            << ". Aborting.\n";
    }
    getchar();
    return 0;
}*/