#include "stdafx.h"

bool Syntax::const_def() {
    // const int <const_assign>{, <const_assign>};

    int type = Token::UNKNOWN;
    // const
    if (match_type(Token::CONST)) {  
        next_token();
    } else {
        assert(0);
    }
    // int | char
    if (match_type(Token::CHAR) || match_type(Token::INT)) {
        type = (read_token.type == Token::CHAR) ? Symbol::CHAR : Symbol::INT;
        next_token();
    } else {
        assert(0);
    }
    if (!const_assign(type)) {
        assert(0);
    }
    /*// , b, c...
    while (match_type(Token::COMMA)) {
        next_token();
        if (match_type(Token::IDENTITY)) {
            Symbol* new_sym = new Symbol(read_token.getName(), type);
            next_token();
        } else {
            assert(0);
        }
    }*/
    return true;
}

bool Syntax::const_assign(int type) {
    // a = 1234 | a = 'a'
    // a
    Symbol* new_sym = NULL;
    const string name = read_token.getName();
    if (match_type(Token::IDENTITY)) {
        new_sym = new Symbol(name, type, true);
        next_token();
    } else {
        assert(0);
    }
    // = 
    if (match_type(Token::ASSIGN)) {
        next_token();
    } else {
        assert(0);
    }
    // 1234 | 'a'
    cout << "assign type:" << type << endl;
    if ((type == Symbol::CHAR) && match_type(Token::CHARACTER)) {
        //'a'
        new_sym->setConstantValue(read_token.getCharValue());
        next_token();
    } else if ((type == Symbol::INT)) {
        //1234
        new_sym->setConstantValue(const_());
    } else {
        assert(0);
    }
    symbol_table->add_map(name, new_sym);
    return true;
}

void Syntax::const_group() {
    int i = 0;
    while (match_type(Token::CONST)) {
        i++;
        cout << i << endl;
        const_def();
        read_token.display();
        if (match_type(Token::SEMICOLON)) {
            next_token();
        } else {
            assert(0);
        }
    }
}