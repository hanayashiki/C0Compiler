#include "stdafx.h"

Syntax::Syntax(Lexer * L, SymbolTable * s) {
    lexer = L;
    symbol_table = s;
    token_pointer = token_list.begin();
}

bool Syntax::match_type(int token_type) {
    return read_token.type == token_type;
}

void Syntax::next_token() {
    if ((token_list.size() == 0) || (token_pointer == token_list.end())) {  
        read_token = lexer->getToken();
        token_list.push_back(read_token);
        //read_token.display();
        token_pointer = token_list.end();
    } else {
        read_token = *token_pointer;
        //read_token.display();
        token_pointer++;
    }
}

void Syntax::retract_token() {
    assert(token_pointer != token_list.begin());
    token_pointer--;
    read_token = *token_pointer;
    //cout << "retract:" << endl;
    //read_token.display();
}

void Syntax::start() {
    next_token();
    if (match_type(Token::CONST)) {
        const_group();
    }
    if (match_type(Token::INT) || match_type(Token::CHAR)) {
        var_group();
    }
}