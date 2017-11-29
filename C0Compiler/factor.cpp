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
        }
        if (fetch_sym->function_flag == true) {
            retract_token();
            Symbol* temp = temp_symbol(fetch_sym->type);
            call_func(temp);
            return temp;
        }
        if (fetch_sym->array_flag == true) {
            if (match_type(Token::LEFT_BRACKET)) {
                next_token();
            } else {
                error_handler("Array identity must be followed by '[' <expression> ']'");
                return NULL;
            }
            Symbol* offset_sym = temp_symbol(Symbol::INT);
            if (expression(offset_sym) == NULL) { // TODO: type check
                return NULL;
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
        return NULL;
    }
    return fetch_sym;
}