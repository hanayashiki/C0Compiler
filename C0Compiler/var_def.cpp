#include "stdafx.h"

// ＜变量定义＞  ::= ＜类型标识符＞(＜标识符＞|＜标识符＞‘[’＜无符号整数＞‘]’)
//  {,＜标识符＞|＜标识符＞‘[’＜无符号整数＞‘]’ }
bool Syntax::var_def() {
    int basic_type = Symbol::UNKNOWN;
    if (match_type(Token::INT)) {
        basic_type = Symbol::INT;
    } else if (match_type(Token::CHAR)) {
        basic_type = Symbol::CHAR;
    } else {
        assert(0);
    }

    next_token();

    if (!var_entry(basic_type)) {
        assert(0);
    }

    while(match_type(Token::COMMA)) {
        next_token();
        if (!var_entry(basic_type)) {
            assert(0);
        }
    }

    return true;
}

bool Syntax::var_entry(int basic_type) {
    Symbol* new_sym = NULL;
    string name;
    int array_length = 0;
    if (match_type(Token::IDENTITY)) {
        name = read_token.getName();
        new_sym = new Symbol(name, basic_type);
        next_token();
    } else {
        error_handler(SyntaxError::VARIABLE_DECLARATION_MISSING_IDENTIFIER);
        return true;
    }
    // [ '[' 123 ']' ]
    if (match_type(Token::LEFT_BRACKET)) {
        next_token();
    } else {
        add_sym(new_sym);
        return true;
    }

    if (match_type(Token::UNSIGNED_INTEGER)) {
        array_length = const_above_zero();
        if (array_length <= 0) {
            error_handler(SyntaxError::ARRAY_ILLEGAL_LENGTH);
            return true;
        }
    } else {
        error_handler(SyntaxError::ARRAY_ILLEGAL_TOKEN_INSIDE);
        return true;
    }

    if (match_type(Token::RIGHT_BRACKET)) {
        next_token();
    } else {
        error_handler(SyntaxError::ARRAY_MISSING_RIGHT_BRACKET);
        return true;
    }

    new_sym->setArray(array_length);
    add_sym(new_sym);

    return true;
}

void Syntax::var_group() {
    int i = 0;
    while (match_type(Token::INT) || match_type(Token::CHAR)) {
        var_def();
        if (match_type(Token::SEMICOLON)) {
            next_token();
        } else {
            error_handler(SyntaxError::MISSING_SEMICOLON);
        }
    }
}