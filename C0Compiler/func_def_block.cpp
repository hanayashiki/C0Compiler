#include "stdafx.h"

bool Syntax::func_def_block() {
	if (match_type(Token::CONST)) {
		const_group();
	}
	if (match_type(Token::INT) || match_type(Token::CHAR)) {
		var_group();
	}
	statement_sequence();
	return true;
}