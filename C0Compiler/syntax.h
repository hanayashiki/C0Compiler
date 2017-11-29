#pragma once
#include "stdafx.h"
#include <list>

class Syntax {
private:
    SyntaxError syntax_error;
	Lexer* lexer;
    SymbolTable* symbol_table;
    QuaterionTable* q_table;
    vector<Token> token_list;
    vector<Token>::iterator token_pointer;
    bool match_type(int token_type);
    bool match_pattern(string p, int token_count);

    string pattern_func;
    string pattern_int_def;
public:
	Syntax(Lexer* l, SymbolTable* s, QuaterionTable* q=NULL);
    static string Syntax::anonymous();
    void start();
    
    Token read_token; 
    void next_token();
    void retract_token();
    void search_pattern(SyntaxError::pattern_list & list);
    void error_handler(int e, string info="");
    void error_handler(string info);
    void add_sym(Symbol* sym);
    Symbol* temp_symbol(int type, bool save=true);
    Symbol* new_label(string prefix="", bool save=true);

    int get_type(int left_type, int right_type);

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
    void type_func_group();

    bool assign();

	Symbol* expression(Symbol* s = NULL);
    Symbol* expression_tail(Symbol*);
    Symbol* term(Symbol* s=NULL);
    Symbol* term_tail(Symbol*);
    Symbol* factor();
    
    bool call_func(Symbol* target_symbol);
    bool call_func_list(Symbol* func_sym);

    void display_token_list();
};
