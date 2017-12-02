#include "stdafx.h"

#define Q Quaterion

// ＜情况语句＞  ::=  switch ‘(’＜表达式＞‘)’ ‘{’＜情况表＞＜缺省＞‘}’
// ＜情况表＞   ::=  ＜情况子语句＞{＜情况子语句＞}
// ＜情况子语句＞  ::=  case＜常量＞：＜语句＞
// ＜缺省＞   ::=  default : ＜语句＞

bool Syntax::switch_() {
    Symbol* switch_sym = NULL;
    if (match_type(Token::SWITCH)) {
        next_token();
    } else {
        assert(0);
    }

    Symbol* switch_end_label = new_label("switch_end");

    switch_sym = switch_head();
    if (switch_sym == NULL) {
        // localization
        cout << "switch_sym fucked" << endl;
    }

    // '{'
    if (match_type(Token::LEFT_BRACE)) {
        next_token();
    } else {
        // localization
    }

    bool default_matched = false;

    while (true) {
        cout << "switch loop\n";
        bool case_flag = false;
        if (match_type(Token::CASE) || match_type(Token::DEFAULT)) {
            Symbol *const_sym = NULL;
            Symbol *case_end_label = new_label("case_end");
            // case XXX: | default: 
            if (match_type(Token::CASE)) {
                case_flag = true;
                if (default_matched == true) {
                    error_handler("'default should be the last case. '");
                }
                read_token.display();
                cout << "call case head" << endl;
                const_sym = case_head();
            } else {
                // default
                default_matched = true;
                next_token();
                const_sym = NULL;
            }
            if (match_type(Token::COLON)) {
                next_token();
            } else {
                error_handler("':' is needed. ");
                // xxxx
            }
            // list the mapping
            if (const_sym == NULL) {
                // localization
            }
            // if not match, jump
            if (case_flag == true) {
                Symbol* compare_temp = temp_symbol(Symbol::INT);
                Q compare_q(Q::EQ, compare_temp, switch_sym, const_sym);
                q_table->add_quaterion(compare_q);
                Q bez_q(Q::BEQZ, NULL, compare_temp, case_end_label);
                q_table->add_quaterion(bez_q);
            }
            // statement
            if (statement() == false) {
                // localization
            }
            // after the statement, go out of the switch
            Q goto_q(Q::GOTO, switch_end_label);
            q_table->add_quaterion(goto_q);
            // case end
            Q label_q(Q::LABEL, case_end_label);
            q_table->add_quaterion(label_q);
        } else {
            break;
        }
    }

    // '}'
    if (match_type(Token::RIGHT_BRACE)) {
        next_token();
    } else {
        error_handler("'}' is needed");
        // localization
    }
    Q end_label_q(Q::LABEL, switch_end_label);
    q_table->add_quaterion(end_label_q);
    cout << "switch end" << endl;
    return true;
}

Symbol* Syntax::switch_head() {
    Symbol* switch_sym = NULL;
    if (match_type(Token::LEFT_PARENTHESIS)) {
        next_token();
    } else {
        error_handler("'switch' must be followed by a parameter list. ");
        return NULL;
    }

    switch_sym = expression();
    if (switch_sym == NULL) {
        return NULL;
    }

    if (match_type(Token::RIGHT_PARENTHESIS)) {
        next_token();
    } else {
        error_handler("')' is needed. ");
        return switch_sym;
    }

    return switch_sym;
}

Symbol* Syntax::case_head() {
    Symbol *switch_sym = NULL;
    read_token.display();
    if (match_type(Token::CASE)) {
        cout << "matched case\n";
        next_token();
    } else {
        read_token.display();
        cout << "failed\n";
        assert(0);
    }
    switch_sym = const_factor();
    if (switch_sym == NULL) {
        cout << "const failed" << endl;
        return NULL;
    }
    cout << "case head end\n";
    return switch_sym;
}