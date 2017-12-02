#include "stdafx.h"

bool Syntax::statement() {
    if (match_type(Token::IF)) {
        return if_statement();
    } else if (match_pattern(pattern_assign, 2)) {
        return assign() && semicolon_handler();
    } else if (match_pattern(pattern_call_func, 2)) {
        return call_func(NULL) && semicolon_handler();
    } else if (match_type(Token::LEFT_BRACE)) {
        next_token();
        if (statement_sequence() == false) {
            return false;
        }
        if (match_type(Token::RIGHT_BRACE)) {
            next_token();
        } else {
            error_handler("'}' is needed");
            return false;
        }
        return true;
    } else if (match_type(Token::SCANF)) {
        return scanf_() && semicolon_handler();
    } else if (match_type(Token::PRINTF)) {
        return printf_() & semicolon_handler();
    } else if (match_type(Token::SWITCH)) {
        cout << "in to switch" << endl;
        return switch_();
    } else if (match_type(Token::FOR)) {
        cout << "in to for" << endl;
        return for_();
    }
    return false;
}

bool Syntax::statement_sequence() {
    // a whole sequence of a function
    while (true) {
        if (statement() == false) {
            read_token.display();
            assert(0);
            //error_handler()
        }
        if (match_type(Token::RIGHT_BRACE)) {
            break;
        }
    }
    return true;
}