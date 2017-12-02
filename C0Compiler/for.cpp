#include "stdafx.h"

#define Q Quaterion

// ��ѭ����䣾::=for��(������ʶ�����������ʽ��;��������;
// ����ʶ����������ʶ����(+|-)����������)������䣾
// ��������::=���������֣��������֣���


bool Syntax::for_() {
    Symbol* judge_label = new_label("for_condition");
    Symbol* for_end_label = new_label("for_end");
    Symbol* for_block_label = new_label("for_block");
    Symbol* compare_sym = NULL;
    // for
    if (match_type(Token::FOR)) {
        next_token();
    } else {
        assert(0);
    }
    // for (
    if (match_type(Token::LEFT_PARENTHESIS)) {
        next_token();
    } else {
        // localization
    }
    // for (i = 1
    if (assign(true) == false) {
        // localization
    }
    // for (i = 1;
    semicolon_handler();
    Q start_jump_q(Q::GOTO, for_block_label);
    q_table->add_quaterion(start_jump_q);
    // for (i = 1; i < 10;
    Q judge_label_q(Q::LABEL, judge_label);
    q_table->add_quaterion(judge_label_q);
    compare_sym = if_comparison();
    if (compare_sym == NULL) {
        //
    }
    Q condition_jump_q(Q::BEQZ, NULL, compare_sym, for_end_label);
    q_table->add_quaterion(condition_jump_q);
    semicolon_handler();
    // for (i = 1; i < 10; i = i + 1
    
    Q aug_q(Q::END, NULL);
    if (for_augment(aug_q) == false) {
        //
    }
    // for (i = 1; i < 10; i = i + 1)
    if (match_type(Token::RIGHT_PARENTHESIS)) {
        next_token();
    } else {
        // localization
        assert(0);
    }
    Q for_block_label_q(Q::LABEL, for_block_label);
    q_table->add_quaterion(for_block_label_q);
    if (statement() == false) {
        assert(0);
    }
    q_table->add_quaterion(aug_q);
    Q jump_to_judge_q(Q::GOTO, judge_label);
    q_table->add_quaterion(jump_to_judge_q);
    Q for_block_end_q(Q::LABEL, for_end_label);
    q_table->add_quaterion(for_block_end_q);
    return true;
}

bool Syntax::for_augment(Q & aug_q) {
    string left_name;
    Symbol* left_sym = NULL;
    Symbol* right_sym = NULL;
    Symbol* step_sym = NULL;
    int step = 0;
    int op = Q::END;
    // a
    left_sym = for_augment_symbol();
    if (left_sym == NULL) {
        return false;
    }
    // a =
    if (match_type(Token::ASSIGN)) {
        next_token();   
    } else {
        return false;
    }
    // a = a 
    right_sym = for_augment_symbol();
    if (right_sym == NULL) {
        return false;
    }
    // a = a + 
    if (match_type(Token::ADD)) {
        op = Q::ADD;
        next_token();
    } else if (match_type(Token::MINUS)) {
        op = Q::MINUS;
        next_token();
    } else {
        error_handler("'+' or '-' is needed. ");
        return false;
    }
    // a = a + 1
    step = const_above_zero();
    if (step > 0) {
        step_sym = const_sym(step, Symbol::INT);
    } else {
        error_handler("Step length of positive constant is needed. ");
        return false;
    }

    aug_q = Q(Q::ADD, left_sym, right_sym, step_sym);
    return true;

}

Symbol* Syntax::for_augment_symbol() {
    Symbol* left_sym;
    if (match_type(Token::IDENTITY)) {
        string left_name = read_token.getName();
        left_sym = symbol_table->get_sym(left_name);
        if (left_sym == NULL) {
            error_handler(SyntaxError::UNDEFINED_IDENTIFIER, left_name);
            return NULL;
        }
        if (left_sym->const_flag || 
            left_sym->function_flag || 
            left_sym->array_flag) {
            error_handler(SyntaxError::INVALID_LEFT_IDENTIFIER_TYPE);
            return NULL;
        }
        next_token();
    } else {
        error_handler(SyntaxError::BAD_ASSIGNMENT);
        return NULL;
    }
    return left_sym;
}