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
    static string Syntax::anonymous();
    void start();
    
    Token read_token; 
    void next_token();
    void retract_token();
    void search_pattern(SyntaxError::pattern_list & list);
    void error_handler(int e, string info="");
    void add_sym(Symbol* sym);

    int const_();
    int const_above_zero();
    bool const_def();
    bool const_assign(int type);
    void const_group();

    bool var_def();
    bool var_entry(int basic_type);
    void var_group();

    bool func_def(bool is_void);
    bool func_def_parameter_list(Symbol* sym);
    bool func_def_block();
    bool Syntax::func_def_parameter_pair(Symbol* sym);

    bool assign();

	Symbol* expression(Symbol*);

    void display_token_list();
};
