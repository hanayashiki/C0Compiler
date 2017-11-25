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
    void next_token();

    int const_();
    int const_above_zero();
    bool const_def();
    bool const_assign(int type);
    void const_group();

    bool var_def();
    bool var_entry(int basic_type);
    void var_group();

	int expression();
};

