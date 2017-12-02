#include "stdafx.h"

#define Q Quaterion

bool Syntax::return_() {
    if (match_type(Token::RETURN)) {
        next_token();
    } else {
        assert(0);
    }
    // return[¡®(¡¯£¼±í´ïÊ½£¾¡®)¡¯] 
    if (match_type(Token::LEFT_PARENTHESIS)) {
        next_token();
        Symbol* ret_sym = expression();
        if (match_type(Token::RIGHT_PARENTHESIS)) {
            next_token();
        }
        if (ret_sym == NULL) {
            return false;
        }
        Q ret_q(Q::RET, ret_sym);
        q_table->add_quaterion(ret_q);
        return true;
    } else {
        Q ret_q(Q::RET, NULL);
        q_table->add_quaterion(ret_q);
        return true;
    }
}