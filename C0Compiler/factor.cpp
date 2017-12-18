#include "stdafx.h"

#define Q Quaterion

Symbol* Syntax::factor() {
    string name;
    Symbol* fetch_sym = NULL;
    if (match_type(Token::IDENTITY)) {
        name = read_token.getName();
        fetch_sym = symbol_table->get_sym(name);
        next_token();
        if (fetch_sym == NULL) {
            error_handler(SyntaxError::UNDEFINED_IDENTIFIER, name);
        } else if (fetch_sym->function_flag == true) {
            retract_token();
            Symbol* temp = temp_symbol(fetch_sym->type);
            call_func(temp);
            return temp;
        } else if (fetch_sym->array_flag == true) {
            if (match_type(Token::LEFT_BRACKET)) {
                next_token();
            } else {
                error_handler("Array identity must be followed by '[' <expression> ']'");
                return NULL;
            }
            Symbol* offset_sym = temp_symbol(Symbol::INT);
            Symbol* expr_sym = expression(offset_sym);
            if (expr_sym == NULL) { // TODO+: type check
                return NULL;
            }  else if (expr_sym->type != Symbol::INT) {
                error_handler("Type mismatch: array subscripts should be of int type. ");
            }
            if (match_type(Token::RIGHT_BRACKET)) {
                next_token();
            } else {
                error_handler("']' is needed. ");
                return NULL;
            }
            Symbol* temp = temp_symbol(fetch_sym->type);
            Q offset_fetch_q(Q::AT, temp, fetch_sym, offset_sym);
            q_table->add_quaterion(offset_fetch_q);
            return temp;
        } else {
            return fetch_sym;
        }
    } else {
        int value = 0;
        if (match_type(Token::CHARACTER)) {
            value = (int)read_token.getCharValue();
            next_token();
            Symbol* new_const = const_sym(value, Symbol::CHAR);
            return new_const;
        } else if (match_type(Token::ADD) || match_type(Token::MINUS) || 
            match_type(Token::UNSIGNED_INTEGER)) {
            value = const_();
            Symbol* new_const = const_sym(value, Symbol::INT);
            // new_const->display();
            return new_const;
        } else if (match_type(Token::LEFT_PARENTHESIS)) {
            next_token();
            Symbol* expr_sym = expression();
            if (expr_sym == NULL) {
                return NULL;
            }
            if (match_type(Token::RIGHT_PARENTHESIS)) {
                next_token();
            } else {
                error_handler("')' is needed. ");
                return NULL;
            }
            return expr_sym;
        } else {
            next_token();
            error_handler("Invalid factor. ");
        }
    }
    return fetch_sym;
}