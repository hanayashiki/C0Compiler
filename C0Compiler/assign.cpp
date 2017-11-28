#include "stdafx.h"

bool Syntax::assign() {
    Symbol* left_sym = NULL;
    string left_name;
    if (match_type(Token::IDENTITY)) {
        left_name = read_token.getName();
        left_sym = symbol_table->get_sym(left_name);
        if (left_sym == NULL) {
            error_handler(SyntaxError::UNDEFINED_IDENTIFIER, left_name);
        }
        if (left_sym->const_flag || left_sym->function_flag) {
            error_handler(SyntaxError::INVALID_LEFT_IDENTIFIER_TYPE);
        }
        next_token();
    } else {
        error_handler(SyntaxError::BAD_ASSIGNMENT);
        return false;
    }

    if (left_sym->array_flag) {
        // TO DO
    }
    
    if (match_type(Token::ASSIGN)) {
        next_token();
    } else {
        error_handler(SyntaxError::BAD_ASSIGNMENT);
        return false;        
    }
    // TODO
    expression(NULL);
}