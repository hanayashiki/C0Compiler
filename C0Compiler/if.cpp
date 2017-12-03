#include "stdafx.h"

#define Q Quaterion

bool Syntax::if_statement() {

    cout << "This is if\n";

    Symbol *if_false = new_label("if_false", false);
    if (match_type(Token::IF)) {
        next_token();
    } else {
        assert(0);
    }
    
    if (match_type(Token::LEFT_PARENTHESIS)) {
         next_token();
    } else {
         error_handler("'(' is needed. ",
         RegexHandler::JUMP_TO_NEXT_STATEMENT_FOR_);
    }
    Symbol* compare_temp = if_comparison();
    if (compare_temp == NULL) {
        error_handler("Bad comparision expression. ", 
        RegexHandler::JUMP_TO_NEXT_STATEMENT);
    } else {
        Q beqz_q(Q::BEQZ, NULL, compare_temp, if_false);
        q_table->add_quaterion(beqz_q);
    }
    if (match_type(Token::RIGHT_PARENTHESIS)) {
        next_token();
    } else {
        error_handler("')' is needed. ", 
        RegexHandler::JUMP_TO_NEXT_STATEMENT);
    }

    statement_try();

    Q label_q(Q::LABEL, if_false);
    q_table->add_quaterion(label_q);

    if (match_type(Token::ELSE)) {
        next_token();
        statement_try();
    }

    add_sym(if_false);
    return true;
}

Symbol* Syntax::if_comparison(int right_end) {
    Symbol* left = NULL, * right = NULL;
    int op = Q::END;
    left = expression();
    if (left == NULL) {
        return NULL;
    }
    if (match_type(Token::LESS_THAN)) {
        op = Q::LT;
        next_token();
    } else if (match_type(Token::LESS_EQUAL_THAN)) {
        op = Q::LTE;
        next_token();
    } else if (match_type(Token::GREATER_THAN)) {
        op = Q::GT;
        next_token();
    } else if (match_type(Token::GREATER_EQUAL_THAN)) {
        op = Q::GTE;
        next_token();
    } else if (match_type(Token::NOT_EQUAL)) {
        op = Q::NE;
        next_token();
    } else if (match_type(Token::EQUAL)) {
        op = Q::EQ;
        next_token();
    } else if (match_type(right_end)) {
        return left; 
    }

    right = expression();
    if (right == NULL) {
        return NULL;
    }

    Symbol* compare_temp = temp_symbol(Symbol::INT);
    Q compare_q(op, compare_temp, left, right);
    q_table->add_quaterion(compare_q);
    return compare_temp;
}