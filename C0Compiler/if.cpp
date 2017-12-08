#include "stdafx.h"

#define Q Quaterion

bool Syntax::if_statement() {
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

    if (if_comparison(if_false) == false) {
        error_handler("Bad comparision expression. ", 
        RegexHandler::JUMP_TO_NEXT_STATEMENT);
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

bool Syntax::if_comparison(Symbol* if_false, int right_end) {
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
        Q beqz_q(Q::BEQZ, NULL, left, if_false);
        q_table->add_quaterion(beqz_q);
        return left; 
    }

    right = expression();
    if (right == NULL) {
        return false;
    }
    if ((op != Q::EQ) && (op != Q::NE)) {
        Symbol* compare_temp = temp_symbol(Symbol::INT);
        Q compare_q(op, compare_temp, left, right);
        q_table->add_quaterion(compare_q);
        Q beqz_q(Q::BEQZ, NULL, compare_temp, if_false);
        q_table->add_quaterion(beqz_q);
    } else {
        if (op == Q::EQ) {
            Q bne_q(Q::BNE, if_false, left, right);
            q_table->add_quaterion(bne_q);
        }
        if (op == Q::NE) {
            Q beq_q(Q::BEQ, if_false, left, right);
            q_table->add_quaterion(beq_q);
        }
    }

    return true;
}