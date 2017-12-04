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

        if (left->const_flag) {
            temp_minus->const_flag = true;
            temp_minus->character_value = -(left->character_value);
            temp_minus->integer_value = -(left->integer_value);
        } else {
            Q minus_q(Q::MINUS, temp_minus, left);
            q_table->add_quaterion(minus_q);
        }
        left = temp_minus;
    }

    self = expression_tail(left);
    if (self == NULL) {
        //cout << "4\n" ; 
        return self;
    }
    // a = t1
    if (target_symbol) {
        // int i; char b; b = i;
        if (target_symbol->type == Symbol::CHAR) {
            if (self->type == Symbol::INT) {
                Symbol* temp_int = temp_symbol(target_symbol->type);
                Q q(Q::CAST_CHAR, temp_int, self);
                q_table->add_quaterion(q);
                self = temp_int;
                warning("implicit convertion from int to char. ");
            }
        }
        if (target_symbol->type == Symbol::INT) {
            if (self->type == Symbol::CHAR) {
                Symbol* temp_int = temp_symbol(target_symbol->type);
                Q q(Q::CAST_INT, temp_int, self);
                q_table->add_quaterion(q);
                self = temp_int;
                warning("implicit convertion from char to int. ");
            }
        }
    }
    Q assign_q(Q::NONE, target_symbol, self); 
    q_table->add_quaterion(assign_q);
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
        if (left->const_flag) {
            temp_minus->const_flag = true;
            temp_minus->character_value = left->character_value;
            temp_minus->integer_value = left->character_value;
            cout << temp_minus->integer_value << endl;
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
            cout << temp_minus->integer_value << endl;
        } else {
            Q q(Q::CAST_INT, temp_minus, right);
            q_table->add_quaterion(q);
        }
        right = temp_minus;
    }

    if (left->const_flag && right->const_flag) {
        temp->const_flag = true;
        if (common_type == Symbol::CHAR) {
            if (op == Q::ADD) {
                temp->setConstantValue((char)(left->character_value
                    +right->character_value));
            }
            if (op == Q::SUB) {
                temp->setConstantValue((char)(left->character_value
                    -right->character_value));
            }
        }
        if (common_type == Symbol::INT) {
            if (op == Q::ADD) {
                temp->setConstantValue(left->integer_value
                    +right->integer_value);
            }
            if (op == Q::SUB) {
                temp->setConstantValue(left->integer_value
                    -right->integer_value);
            }
        }
    } else {
        Q add_q(op, temp, left, right);
        q_table->add_quaterion(add_q);
    }
    return expression_tail(temp);
}

