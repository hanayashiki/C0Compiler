#include "stdafx.h"

#define Q Quaterion

bool Syntax::printf_() {
    // ＜写语句＞    ::= printf ‘(’ ＜字符串＞,＜表达式＞ ‘)’|
    // printf ‘(’＜字符串＞ ‘)’| printf ‘(’＜表达式＞‘)’
    cout << "This is printf\n";
    Symbol * string_label = NULL;
    Symbol * expr_sym = NULL;
    string str;
    if (match_type(Token::PRINTF)) {
        next_token();
    } else {
        assert(0);
    }
    if (match_type(Token::LEFT_PARENTHESIS)) {
        next_token();
    } else {
        error_handler("'printf' must be followed by a parameter list. ");
        return false;
    }
    for (int i = 0; i < 2; i++) {
        if (match_type(Token::STRING) && (i == 0)) {
            // string can only be the first
            str = read_token.getName();
            string_label = new_label("const_str");
            string_label->setString(str);
            Q print_q(Q::PRINT_STR, string_label);
            q_table->add_quaterion(print_q);
            next_token();
        } else {
            expr_sym = expression();
            if (expr_sym) {
                if (expr_sym->type == Symbol::INT) {
                    Q print_q(Q::PRINT_INT, expr_sym);
                    q_table->add_quaterion(print_q);
                } else if (expr_sym->type == Symbol::CHAR) {
                    Q print_q(Q::PRINT_CHAR, expr_sym);
                    q_table->add_quaterion(print_q);
                }
            } else {
                break;
            }
        }
        if (match_type(Token::COMMA)) {
            next_token();
        } else {
            break;
        }
    }
    if (match_type(Token::RIGHT_PARENTHESIS)) {
        next_token();
        return true;
    } else {
        error_handler("'printf' parameter list syntax error. ");
        return false;
    }
}