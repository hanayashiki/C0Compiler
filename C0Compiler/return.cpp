#include "stdafx.h"

#define Q Quaterion

bool Syntax::return_() {
	struct SyntaxError::StatementException e = { "" };
	if (match_type(Token::RETURN)) {
		next_token();
	}
	else {
		assert(0);
	}
	// return[¡®(¡¯£¼±í´ïÊ½£¾¡®)¡¯] 
	if (match_type(Token::LEFT_PARENTHESIS)) {
		next_token();
		value_function_return = true;
		Symbol* ret_sym = expression();
		if (match_type(Token::RIGHT_PARENTHESIS)) {
			next_token();
		}
		if (ret_sym == NULL) {
			e.what = "Bad return expression. ";
			throw e;
			return false;
		}
		Q ret_q(Q::RET, ret_sym);
		q_table->add_quaterion(ret_q);
		return true;
	}
	else if (match_type(Token::SEMICOLON)) {
		Q ret_q(Q::RET, NULL);
		q_table->add_quaterion(ret_q);
		return true;
	}
	else {
		value_function_return = true;
		e.what = "'return' must be followed by nothing or a parameter wrapped by parentheses. ";
		throw e;
	}
}