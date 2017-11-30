#include "stdafx.h"

#define Q Quaterion

bool Syntax::if_statement() {
    Symbol *if_false = new_label("if_false", false);
    if (match_type(Token::IF)) {
        next_token();
    } else {
        assert(0);
    }
    try {
        if (match_type(Token::LEFT_PARENTHESIS)) {
            next_token();
        } else {
            throw "IF_BAD_CONDITION";
        }
        Symbol* compare_temp = if_comparison();
        if (compare_temp == NULL) {
            throw "IF_BAD_CONDITION";
        }
        Q beqz_q(Q::BEQZ, NULL, compare_temp, if_false);
        q_table->add_quaterion(beqz_q);
        if (match_type(Token::RIGHT_PARENTHESIS)) {
            next_token();
        } else {
            throw "IF_BAD_CONDITION";
        }
    }
    catch (string) {
        delete if_false;
        assert(0);
        //error_handler(IF_BAD_CONDITION);
    }

    if (statement() == false) {
        cout << "statement failed" << endl;
        delete if_false;
        return false;
    }

    Q label_q(Q::LABEL, if_false);
    q_table->add_quaterion(label_q);

    if (match_type(Token::ELSE)) {
        next_token();
        if (statement() == false) {
            cout << "statement else failed" << endl;
            return false;
        }
    }

    add_sym(if_false);
    return true;
}

Symbol* Syntax::if_comparison() {
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
    } else {
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