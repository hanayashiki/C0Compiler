#include "stdafx.h"

bool Syntax::assign(bool non_array) {
    Symbol* left_sym = NULL;
    Symbol* arr_temp = NULL;
    Symbol* offset_temp = NULL;
    string left_name;

    struct SyntaxError::StatementException e = {""};

    if (match_type(Token::IDENTITY)) {
        left_name = read_token.getName();
        left_sym = symbol_table->get_sym(left_name);
        next_token();
        if (left_sym == NULL) {
            e.what = "Undefined identifier: " + left_name;
            throw e;
            return false;
        }
        if (left_sym->const_flag || left_sym->function_flag) {
            e.what = "Invalid assigned identifier: " + left_name;
            throw e;
            return false;
        }
    } else {
        next_token();
        cout << "???\n";
        e.what = "Invalid left part of assignment. ";
        throw e;
        return false;
    }
    // for array
    if (left_sym->array_flag && !non_array) {
        if (match_type(Token::LEFT_BRACKET)) {
            next_token();
        } else {
            e.what = "Identifier of array should be follow by a subscript.";
            throw e;
            return false;
        }
        offset_temp = temp_symbol(Symbol::INT);

        if (expression(offset_temp) == NULL) {
            e.what = "Bad subscript expression. ";
            throw e;
            return false;
        }

        if (match_type(Token::RIGHT_BRACKET)) {
            next_token();
        } else {
            e.what = "']' is needed. ";
            throw e;
            return false;
        }
    }
    
    if (match_type(Token::ASSIGN)) {
        next_token();
    } else {
        e.what = "'=' is needed. ";
        throw e;
        return false;        
    }

    if (!left_sym->array_flag) {
        if (expression(left_sym) == NULL) {
            e.what = "Bad right expression. ";
            throw e;
            return false;
        }
    } else {
        arr_temp = temp_symbol(Symbol::INT);
        if (expression(arr_temp) == NULL) {
            e.what = "Bad right expression. ";
            throw e;
            return false;
        }
        Quaterion offset_assign_q(Quaterion::TO, left_sym, 
            offset_temp, arr_temp);
        q_table->add_quaterion(offset_assign_q);
    }
}