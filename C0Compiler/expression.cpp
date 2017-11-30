#include "stdafx.h"

#define Q Quaterion

Symbol* Syntax::expression(Symbol* target_symbol) {
    // ＜表达式＞    ::= ［＋｜－］＜项＞{＜加法运算符＞＜项＞}
    Symbol* left = NULL;
    Symbol* self = NULL;
    bool minus_flag = false;
    if (match_type(Token::ADD)) {
        next_token();
    } else if (match_type(Token::MINUS)) {
        next_token();
        minus_flag = true;
    }

    left = term();
    if (left == NULL) {
        //cout << "3\n" ; 
        return NULL;
    }
    if (minus_flag) {
        Symbol* temp_minus = temp_symbol(left->type);
        Q minus_q(Q::MINUS, temp_minus, left);
        q_table->add_quaterion(minus_q);
        left = temp_minus;
    }

    self = expression_tail(left);
    if (self == NULL) {
        //cout << "4\n" ; 
        return self;
    }

    // a = t1
    if (target_symbol) {
        Q assign_q(Q::NONE, target_symbol, self); 
        q_table->add_quaterion(assign_q);
    }
    return self;
}

Symbol* Syntax::expression_tail(Symbol* left) {
    Symbol* right = NULL;
    int op = Q::END;
    if (match_type(Token::ADD)) {
        op = Q::ADD;
        next_token();
    } else if (match_type(Token::MINUS)) {
        op = Q::SUB;
        next_token();
    } else {
        return left;
    }

    right = term();
    if (right == NULL) {
        return false;
    }
    
    int common_type = get_type(left->type, right->type);
    Symbol* temp = temp_symbol(common_type);

    if (left->type != common_type) {
        Symbol* temp_minus = temp_symbol(common_type);
        Q q(Q::CAST_INT, temp_minus, left);
        q_table->add_quaterion(q);
        left = temp_minus;
    }
    if (right->type != common_type) {
        Symbol* temp_minus = temp_symbol(common_type);
        Q q(Q::CAST_INT, temp_minus, right);
        q_table->add_quaterion(q);
        right = temp_minus;
    }
    Q add_q(op, temp, left, right);
    q_table->add_quaterion(add_q);

    return expression_tail(temp);
}

