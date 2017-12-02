#include "stdafx.h"

bool Syntax::assign(bool non_array) {
    Symbol* left_sym = NULL;
    Symbol* arr_temp = NULL;
    Symbol* offset_temp = NULL;
    string left_name;

    if (match_type(Token::IDENTITY)) {
        left_name = read_token.getName();
        left_sym = symbol_table->get_sym(left_name);
        if (left_sym == NULL) {
            error_handler(SyntaxError::UNDEFINED_IDENTIFIER, left_name);
            return false;
        }
        if (left_sym->const_flag || left_sym->function_flag) {
            error_handler(SyntaxError::INVALID_LEFT_IDENTIFIER_TYPE);
            return false;
        }
        next_token();
    } else {
        error_handler(SyntaxError::BAD_ASSIGNMENT);
        return false;
    }
    // for array
    if (left_sym->array_flag && !non_array) {
        if (match_type(Token::LEFT_BRACKET)) {
            next_token();
        } else {
            error_handler(SyntaxError::BARE_ARRAY_LEFT_VALUE);
            error_handler(SyntaxError::BAD_ASSIGNMENT);
            return false;
        }
        offset_temp = temp_symbol(Symbol::INT);

        if (expression(offset_temp) == NULL) {
            error_handler(SyntaxError::BAD_ASSIGNMENT);
            return false;
        }

        if (match_type(Token::RIGHT_BRACKET)) {
            next_token();
        } else {
            error_handler(SyntaxError::BAD_ASSIGNMENT, "Missing ']'. ");
            return false;
        }
    }
    
    if (match_type(Token::ASSIGN)) {
        next_token();
    } else {
        error_handler(SyntaxError::BAD_ASSIGNMENT);
        return false;        
    }

    if (!left_sym->array_flag) {
        if (expression(left_sym) == NULL) {
            error_handler(SyntaxError::BAD_ASSIGNMENT);
            return false;
        }
    } else {
        arr_temp = temp_symbol(Symbol::INT);
        if (expression(arr_temp) == NULL) {
            error_handler(SyntaxError::BAD_ASSIGNMENT);
            return false;
        }
        Quaterion offset_assign_q(Quaterion::TO, left_sym, 
            offset_temp, arr_temp);
        q_table->add_quaterion(offset_assign_q);
    }
}