#include "stdafx.h"

Syntax::Syntax(Lexer * L, SymbolTable * s) {
    lexer = L;
    symbol_table = s;
}

bool Syntax::match_type(int token_type) {
    return read_token.type == token_type;
}

void Syntax::next_token() {
    read_token = lexer->getToken();
    cout << "next_token: ";
    read_token.display();
}

void Syntax::start() {
    next_token();
    const_group();
}