#include "stdafx.h"

void Syntax::start() {
    pattern_func_def = "(int|char|void)(identifier|main)\\(";
    pattern_int_def = "(int|char)identifier[^(]";
    pattern_call_func = "identifier\\(";
    pattern_assign = "identifier(\\[|\\=)";
    next_token();
    if (match_type(Token::CONST)) {
        const_group();
    }
    if (match_pattern(pattern_int_def, 3)) {
        var_group();
    }
    if (match_pattern(pattern_func_def, 3)) {
        type_func_group();
    }
    //cout << "------ending: token_list:--------";
    //display_token_list();
}

void Syntax::const_group() {
    while (match_type(Token::CONST)) {
        const_def();
        if (match_type(Token::SEMICOLON)) {
            next_token();
        } else {
            error_handler(SyntaxError::MISSING_SEMICOLON);
        }
    }
}

void Syntax::var_group() {
    int i = 0;
    while (match_pattern(pattern_int_def, 3)) {
        var_def();
        if (match_type(Token::SEMICOLON)) {
            next_token();
        } else {
            error_handler(SyntaxError::MISSING_SEMICOLON);
        }
    }
}

void Syntax::type_func_group() {
    while (match_pattern(pattern_func_def, 3)) {
        func_def();
    }
}
