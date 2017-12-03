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
        //cout << "term right illegal";
        return NULL;
    }
    
    int common_type = get_type(left->type, right->type);
    Symbol* temp = temp_symbol(common_type);

    if (left->type != common_type) {
        Symbol* temp_minus = temp_symbol(common_type);
        if (left->const_flag) {
            temp_minus->const_flag = true;
            temp_minus->character_value = left->character_value;
            temp_minus->integer_value = left->character_value;
        } else {
            Q q(Q::CAST_INT, temp_minus, left);
            q_table->add_quaterion(q);
        }
        left = temp_minus;
    }
    if (right->type != common_type) {
        Symbol* temp_minus = temp_symbol(common_type);
        if (right->const_flag) {
            temp_minus->const_flag = true;
            temp_minus->character_value = right->character_value;
            temp_minus->integer_value = right->character_value;
        } else {
            Q q(Q::CAST_INT, temp_minus, right);
            q_table->add_quaterion(q);
        }

        right = temp_minus;
    }
    if (left->const_flag && right->const_flag) {
        temp->const_flag = true;
        if (common_type == Symbol::CHAR) {
            if (op == Q::MULT) {
                temp->setConstantValue((char)(left->character_value
                    *right->character_value));
            }
            if (op == Q::DIV) {
                if (right->character_value != 0) {
                    temp->setConstantValue((char)(left->character_value
                        /right->character_value));
                } else {
                    error_handler("Divided-by-zero is not allowed.");
                }
            }
        }
        if (common_type == Symbol::INT) {
            if (op == Q::MULT) {
                temp->setConstantValue(left->integer_value
                    *right->integer_value);
            }
            if (op == Q::DIV) {
                if (right->character_value != 0) {
                    temp->setConstantValue(left->integer_value
                        /(right->integer_value));
                } else {
                    error_handler("Divided-by-zero is not allowed.");
                }
            }
        }
    } else {
        Q mult_q(op, temp, left, right);
        q_table->add_quaterion(mult_q);
    }
    return term_tail(temp);
}