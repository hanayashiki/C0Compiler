#include "stdafx.h"

#define Q Quaterion

bool Syntax::call_func(Symbol* target_symbol) {
    string name;
    Symbol* func_sym = NULL;
    struct SyntaxError::StatementException e = {""};

    cout << "This is call_func.\n";

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
    //read_token.display();
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
    vector<int> & param_types = func_sym->parameter_type_list;
    for (vector<int>::iterator iter = param_types.begin();
        iter != param_types.end(); iter++) {
        if (match_type(Token::RIGHT_PARENTHESIS)) {
            error_handler("Too few parameters. ");
            return false;
        }
        Symbol* temp = temp_symbol(*iter);
        Symbol* value = expression();
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
        Q push_q(Q::PUSH, value);
        q_table->add_quaterion(push_q);
    }
   
    return true;
}