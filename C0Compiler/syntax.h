#pragma once
#include "stdafx.h"
#include <list>

class Syntax {
private:
    SyntaxError syntax_error;
	Lexer* lexer;
    SymbolTable* symbol_table;
    vector<Token> token_list;
    vector<Token>::iterator token_pointer;
    bool match_type(int token_type);
public:
	Syntax(Lexer* l, SymbolTable* s);
    void start();
    
    Token read_token; 
    void next_token();
    void retract_token();
    void search_pattern(SyntaxError::pattern_list & list);
    void error_handler(int e);

    int const_();
    int const_above_zero();
    bool const_def();
    bool const_assign(int type);
    void const_group();

    bool var_def();
    bool var_entry(int basic_type);
    void var_group();

	int expression();

    void display_token_list();
};

