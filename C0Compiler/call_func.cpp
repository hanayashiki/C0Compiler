#include "stdafx.h"

#define Q Quaterion

bool Syntax::call_func(Symbol* target_symbol) {
    string name;
    Symbol* func_sym = NULL;
    struct SyntaxError::StatementException e = {""};

    if (match_type(Token::IDENTITY)) {
        name = read_token.getName();
        func_sym = symbol_table->get_sym(name);
        next_token();
        if (func_sym == NULL) {
            e.what = "Undefined identifier: " + name + ". ";
            throw e;
            return false;
        } else if (func_sym->function_flag == false) {
            e.what = "'" + name + "' is not a function. ";
            throw e;
            return false;
        }
    }
    if (match_type(Token::LEFT_PARENTHESIS)) {
        next_token();
    } else {
        e.what = "'(' is needed.";
        throw e;
        return false;
    }
    if (call_func_list(func_sym) == false) {
        e.what = "Inapproriate list of parameters. ";
        throw e;
        return false;
    }
    // read_token.display();
    if (match_type(Token::RIGHT_PARENTHESIS)) {
        next_token();
    } else {
        e.what = "')' is needed. ";
        throw e;
        return false;
    }
    Q call_q(Q::CALL, func_sym);
    q_table->add_quaterion(call_q);
    if (target_symbol) {
        Q get_q(Q::GET, target_symbol);
        q_table->add_quaterion(get_q);
    }
    return true;
}

bool Syntax::call_func_list(Symbol* func_sym) {
	vector<Symbol*> to_push;
    vector<Symbol*> & param_types = func_sym->parameter_type_list;
    for (vector<Symbol*>::iterator iter = param_types.begin();
        iter != param_types.end(); iter++) {
        if (match_type(Token::RIGHT_PARENTHESIS)) {
            error_handler("Too few parameters. ");
            return false;
        }
        Symbol* temp = temp_symbol((*iter)->type, false);
        Symbol* value = expression();
        
        if (temp->type != value->type) {
            if (temp->type == Symbol::CHAR) {
                Q cast_q(temp, value);
                q_table->add_quaterion(cast_q);
            } else {
                Q cast_q(temp, value);
                q_table->add_quaterion(cast_q);
            }
        } else {
            delete(temp);
            temp = value;
        }

        if (match_type(Token::COMMA)) {
            if ((iter < param_types.end()-1)) {
                next_token();
            } else {
                error_handler("Too many parameters. ");
                return false;
            }
        }
        if (value == NULL) { // TODO: type match
            error_handler("Parameter list miss match. ");
            return false;
        }
		to_push.push_back(temp);
    }
	for (int idx = 0; idx < to_push.size(); idx++) {
		Q push_q(Q::PUSH, to_push[idx]);
		q_table->add_quaterion(push_q);
	}
    return true;
}