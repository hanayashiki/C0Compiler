#include "stdafx.h"

#define Q Quaterion

bool Syntax::scanf_() {
    cout << "This is scanf\n";
    if (match_type(Token::SCANF)) {
        next_token();
    } else {
        assert(0);
    }
    if (match_type(Token::LEFT_PARENTHESIS)) {
        next_token();
    } else {
        error_handler("scanf must be followed by a parameter list. ");
    }
    while (true) {
        if (scanf_parameter_entry() == false) {
            return false;
        }
        if (match_type(Token::COMMA)) {
            next_token();
        } else if (match_type(Token::RIGHT_PARENTHESIS)) {
            next_token();
            return true;
        } else {
            return false;
        }
    }
}

bool Syntax::scanf_parameter_entry() {
    string name;
    int op = Q::END;
    Symbol* fetch_sym = NULL;
    if (match_type(Token::IDENTITY)) {
        name = read_token.getName();
        fetch_sym = symbol_table->get_sym(name);
        next_token();
        if (fetch_sym->const_flag) {
            error_handler("Cannot read to a const. ");
            return false;
        }
        if (fetch_sym->array_flag) {
            error_handler("Cannot read to an array. ");
            return false;
        }
        if (fetch_sym->type == Symbol::INT) {
            op = Q::READ_INT;
        } else if (fetch_sym->type == Symbol::CHAR) {
            op = Q::READ_CHAR;
        }
        Q read_q(op, fetch_sym, NULL, NULL);
        q_table->add_quaterion(read_q);
    } else {
        error_handler("Expect a variable. ");
        return false;
    }
    return true;
}