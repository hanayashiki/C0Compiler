#include "stdafx.h"

bool Syntax::statement() {
    if (match_type(Token::IF)) {
        //＜条件语句＞
        return if_statement();
    } else if (match_pattern(pattern_assign, 2)) {
        //＜赋值语句＞
        return assign() && semicolon_handler();
    } else if (match_pattern(pattern_call_func, 2)) {
        // ＜有返回值函数调用语句＞/＜无返回值函数调用语句＞ 
        return call_func(NULL) && semicolon_handler();
    } else if (match_type(Token::LEFT_BRACE)) {
        // ‘{’＜语句列＞‘}’
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
        // ＜读语句＞
        return scanf_() && semicolon_handler();
    } else if (match_type(Token::PRINTF)) {
        // ＜写语句＞
        return printf_() && semicolon_handler();
    } else if (match_type(Token::SWITCH)) {
        // ＜情况语句＞
        cout << "in to switch" << endl;
        return switch_();
    } else if (match_type(Token::FOR)) {
        // ＜循环语句＞
        cout << "in to for" << endl;
        return for_();
    } else if (match_type(Token::RETURN)) {
        // ＜返回语句＞
        cout << "in to ret" << endl;
        return return_() && semicolon_handler();
    } else if (match_type(Token::SEMICOLON)) {
        // ＜空＞
        return true;
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