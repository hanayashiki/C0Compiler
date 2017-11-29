#include "stdafx.h"

bool Syntax::const_def() {
    // const int <const_assign>{, <const_assign>};

    int type = Symbol::UNKNOWN;
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
        error_handler(SyntaxError::CONST_DECLARATION_MISSING_TYPE);
        return false;
    }
    if (!const_assign(type)) {
        assert(0);
    }
    while (match_type(Token::COMMA)) {
        next_token();
        if (!const_assign(type)) {
            assert(0);
        }
    }
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
        error_handler(SyntaxError::CONST_DECLARATION_MISSING_ASSIGNMENT);
        delete(new_sym);
        return true;
    }
    // = 
    if (match_type(Token::ASSIGN)) {
        next_token();
    } else {
        error_handler(SyntaxError::CONST_DECLARATION_MISSING_ASSIGNMENT);
        delete(new_sym);
        return true;
    }
    // 1234 | 'a'
    //cout << "assign type:" << type << endl;
    if ((type == Symbol::CHAR) && match_type(Token::CHARACTER)) {
        //'a'
        new_sym->setConstantValue(read_token.getCharValue());
        next_token();
    } else if ((type == Symbol::INT)) {
        //1234
        new_sym->setConstantValue(const_());
    } else {
        error_handler(SyntaxError::CONST_DECLARATION_MISSING_ASSIGNMENT);
        delete(new_sym);
        return true;
    }
    add_sym(new_sym);
    return true;
}
