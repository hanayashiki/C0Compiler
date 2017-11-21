#pragma once
#include "stdafx.h"

class Syntax {
private:
	Lexer* lexer;
    SymbolTable* symbol_table;
    bool match_type(int token_type);
public:
	Syntax(Lexer* l, SymbolTable* s);
    void start();
    
    Token read_token; 
    void Syntax::next_token();

    int const_();
    bool const_def();
    bool const_assign(int type);
    void const_group();
	int expression();
};

