#pragma once
#include "stdafx.h"
#include <list>

class Syntax {
private:
    SyntaxError syntax_error;
	Lexer* lexer;
    SymbolTable* symbol_table;
    RegexHandler* reg_handler;
    QuaterionTable* q_table;
    vector<Token> token_list;
    vector<Token>::iterator token_pointer;
    bool match_type(int token_type);
    bool match_pattern(string p, int token_count);

    string pattern_func_def;
    string pattern_int_def;

    string pattern_call_func;
    string pattern_assign;
public:
	Syntax(Lexer* l, SymbolTable* s, QuaterionTable* q=NULL);
    ~Syntax();
    static string Syntax::anonymous();
    void start();
    
    Token read_token; 
    void next_token();
    void retract_token();
    void search_pattern(SyntaxError::pattern_list & list);
    bool search_pattern(int pid);
    bool semicolon_handler();
    void error_handler(int e, string info="");
    void error_handler(string info);
    bool error_handler(string m, int pid);
    void add_sym(Symbol* sym);
    Symbol* temp_symbol(int type, bool save=true);
    Symbol* new_label(string prefix="", bool save=true);
    Symbol* const_sym(int value, int type);

    int get_type(int left_type, int right_type);

    int const_();
    int const_above_zero();
    bool const_def();
    bool const_assign(int type);
    void const_group();

    bool var_def();
    bool var_entry(int basic_type);
    void var_group();

    bool func_def();
    bool func_def_parameter_list(Symbol* sym);
    bool func_def_block();
    bool return_();
    bool func_def_parameter_pair(Symbol* sym);
    void type_func_group();

    bool assign(bool non_array=false);

	Symbol* expression(Symbol* s = NULL);
    Symbol* expression_tail(Symbol*);
    Symbol* term(Symbol* s=NULL);
    Symbol* term_tail(Symbol*);
    Symbol* factor();
    Symbol* const_factor();
    
    bool call_func(Symbol* target_symbol);
    bool call_func_list(Symbol* func_sym);

    bool statement();
    bool statement_sequence();

    bool if_statement();
    Symbol* if_comparison();

    bool scanf_();
    bool scanf_parameter_entry();

    bool printf_();

    bool switch_();
    Symbol* switch_head();
    Symbol* case_head();

    bool for_();
    bool for_augment(Quaterion & aug_q);
    Symbol* for_augment_symbol();

    void display_token_list();
};
