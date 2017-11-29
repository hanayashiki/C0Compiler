#include "stdafx.h"

#define Q Quaterion

Symbol* Syntax::expression(Symbol* target_symbol) {
    Q q(target_symbol, factor());
    q_table->add_quaterion(q);
    return NULL;
}

Symbol* Syntax::factor() {
    string name;
    Symbol* fetch_sym = NULL;
    if (match_type(Token::IDENTITY)) {
        name = read_token.getName();
        fetch_sym = symbol_table->get_sym(name);
        if (fetch_sym == NULL) {
            error_handler(SyntaxError::UNDEFINED_IDENTIFIER, name);
        }
    } else {
        assert(0);
    }
    return fetch_sym;
}