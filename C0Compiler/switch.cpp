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

    struct SyntaxError::StatementException e = {""};

    Symbol* switch_end_label = new_label("switch_end");

    switch_sym = switch_head();
    if (switch_sym == NULL) {
        // localization
        error_handler("Bad switch expression. ", RegexHandler::JUMP_TO_NEXT_STATEMENT_CASE_);
    }

    // '{'
    if (match_type(Token::LEFT_BRACE)) {
        next_token();
    } else {
        // localization
        error_handler("'{' is needed. ", RegexHandler::JUMP_TO_NEXT_STATEMENT_CASE_);
    }

    bool default_matched = false;

    while (true) {
        //cout << "switch loop\n";
        bool case_flag = false;
        if (match_type(Token::CASE) || match_type(Token::DEFAULT)) {
            Symbol *const_sym = NULL;
            Symbol *case_end_label = new_label("case_end");
            // case XXX: | default: 
            if (match_type(Token::CASE)) {
                case_flag = true;
                if (default_matched == true) {
                    error_handler("'default' should be the last case. '");
                }
                read_token.display();
                cout << "call case head" << endl;
                const_sym = case_head();
                // list the mapping
                if ((const_sym == NULL) && (case_flag == true)) {
                    error_handler("Bad case description. ", RegexHandler::JUMP_TO_NEXT_STATEMENT_CASE_);
                }
            } else {
                // default
                default_matched = true;
                next_token();
                const_sym = NULL;
            }
            if (match_type(Token::COLON)) {
                next_token();
            } else {
                error_handler("':' is needed. ", RegexHandler::JUMP_TO_NEXT_STATEMENT_CASE_);
                // xxxx
            }

            // if not match, jump
            if ((case_flag == true) && (const_sym != NULL) && (switch_sym != NULL)) {
                Symbol* compare_temp = temp_symbol(Symbol::INT);
                Q compare_q(Q::EQ, compare_temp, switch_sym, const_sym);
                q_table->add_quaterion(compare_q);
                Q bez_q(Q::BEQZ, NULL, compare_temp, case_end_label);
                q_table->add_quaterion(bez_q);
            }
            // statement
            statement_try();
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
        e.what = "'}' is needed";
        throw e;
    }
    Q end_label_q(Q::LABEL, switch_end_label);
    q_table->add_quaterion(end_label_q);
    return true;
}

Symbol* Syntax::switch_head() {
    Symbol* switch_sym = NULL;
    if (match_type(Token::LEFT_PARENTHESIS)) {
        next_token();
    } else {
        error_handler("'(' is needed. ");
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
        next_token();
    } else {
        read_token.display();
        assert(0);
    }
    switch_sym = const_factor();
    if (switch_sym == NULL) {
        error_handler("'case' should be followed by an integer or character. ");
        return NULL;
    }
    return switch_sym;
}