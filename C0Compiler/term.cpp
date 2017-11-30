#include "stdafx.h"

#define Q Quaterion

Symbol* Syntax::term(Symbol* target_symbol) {
    // ＜项＞     ::= ＜因子＞{＜乘法运算符＞＜因子＞}
    Symbol* left = NULL;
    Symbol* self = NULL;

    left = factor();
    if (left == NULL) {
        //cout << "term1" << endl;
        return NULL;
    }

    self = term_tail(left);
    if (self == NULL) {
        //cout << "term2" << endl;
        return NULL;
    }

    if (target_symbol != NULL) {
        // a = t1
        Q assign_q(Q::NONE, target_symbol, self); 
        q_table->add_quaterion(assign_q);
    }
    return self;
}

Symbol* Syntax::term_tail(Symbol* left) {
    Symbol* right = NULL;
    int op = Q::END;
    if (match_type(Token::MULTIPLY)) {
        op = Q::MULT;
        next_token();
    } else if (match_type(Token::DIVIDE)) {
        op = Q::DIV;
        next_token();
    } else {
        return left;
    }

    right = factor();
    if (right == NULL) {
        cout << "term right illegal";
        return NULL;
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
    Q mult_q(op, temp, left, right);
    q_table->add_quaterion(mult_q);

    return term_tail(temp);
}