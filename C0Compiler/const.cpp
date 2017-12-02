#include "stdafx.h"

int Syntax::const_() {
    bool minus = false;
    int value;
    // ［＋｜－］＜无符号整数＞｜０
    if (read_token.type == Token::ADD) {
        next_token();
    } else if (read_token.type == Token::MINUS) {
        minus = true;
        next_token();
    }
    if (read_token.type == Token::UNSIGNED_INTEGER) {
        if ((read_token.integerPositiveOverflow == true) &&
            (minus == false)) {
            assert(0);
        }
        if ((read_token.integerNegativeOverflow == true) &&
            (minus == true)) {
            assert(0);
        }
        value = read_token.getIntValue();
        //cout << "got value: " << value << endl;
        next_token();
        if (minus) {
            return -1 * value;
        } else {
            return value;
        }
    }
    return -1;
}

int Syntax::const_above_zero() {
    int value;
    // ＜无符号整数＞
    if (read_token.type == Token::UNSIGNED_INTEGER) {
        if ((read_token.integerPositiveOverflow == true) ||
            (read_token.getIntValue() == 0)) {
            return -1;
        }
        value = read_token.getIntValue();
        next_token();
        return value;
    } else {
        return -1;
    }
}

Symbol* Syntax::const_factor() {
    int value;
    if (match_type(Token::CHARACTER)) {
        value = (int)read_token.getCharValue();
        next_token();
        Symbol* new_const = const_sym(value, Symbol::CHAR);
        return new_const;
    } else if (match_type(Token::ADD) || match_type(Token::MINUS) || 
        match_type(Token::UNSIGNED_INTEGER)) {
        value = const_();
        Symbol* new_const = const_sym(value, Symbol::INT);
        return new_const;
    }
    error_handler("A const is needed. ");
    return NULL;
}