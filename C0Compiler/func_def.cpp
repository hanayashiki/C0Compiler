#include "stdafx.h"

#define Q Quaterion

bool Syntax::func_def() {
    int type = Symbol::VOID;
    value_function_return = false;
    bool main_flag = false;
    string name = anonymous();
    Symbol* new_func = NULL;

    // type
    if (match_type(Token::VOID)) {
        type = Symbol::VOID;
        next_token();    
    } else if (match_type(Token::INT)) {
        type = Symbol::INT;
        next_token(); 
    } else if (match_type(Token::CHAR)) {
        type = Symbol::CHAR;
        next_token(); 
    } else {
        error_handler(SyntaxError::FUNCTION_INVALID_TYPE);
    }
    // name
    if (match_type(Token::IDENTITY)) {
        if (q_table->entry_symbol != NULL) {
            error_handler("No definition of function should follow main. ");
        }
        name = read_token.getName();
        new_func = new Symbol(name, type);
        new_func->setFunc();
        next_token(); 
    } else if (match_type(Token::MAIN)) {
        if (type != Symbol::VOID) {
            error_handler("main() should be of void type.");
        }
        new_func = new Symbol("main", type);
        new_func->setFunc();
        main_flag = true;
        q_table->entry_symbol = new_func;
        next_token();
    } else {
        error_handler(SyntaxError::FUNCTION_MISSING_NAME);
    }

    if (match_type(Token::LEFT_PARENTHESIS)) {
        next_token();
    } else {
        error_handler(SyntaxError::FUNCTION_MISSING_LEFT_PARENTHESIS);
    }

    new_func->symbol_table = new SymbolTable(symbol_table);

    add_sym(new_func);
    symbol_table = new_func->symbol_table; // enter new table

    // (int a, int b...)
    func_def_parameter_list(new_func);

    if (main_flag && (new_func->parameter_type_list.size() != 0)) {
        error_handler("main() should contain no parameters. ");
    }

    if (match_type(Token::RIGHT_PARENTHESIS)) {
        next_token();
    } else {
        error_handler("')' is needed. ");
    }
    // statement block
    if (match_type(Token::LEFT_BRACE)) {
        next_token();
    } else {
        error_handler("'{' is needed. ");
    }

    Symbol* label = new_label(new_func->name);
    Q label_q(Q::LABEL, label);
    q_table->add_quaterion(label_q);

    new_func->start_label = label;

    Q prolog_q(Q::PROLOG, new_func);
    q_table->add_quaterion(prolog_q);

    func_def_block();
    //symbol_table->display();

    if (match_type(Token::RIGHT_BRACE)) {
        next_token();
    }

    symbol_table = symbol_table->parent;

    if ((type != Symbol::VOID) && !value_function_return) {
        error_handler("'"+new_func->name+"' should contain 'return'. ");
    }
	if ((type == Symbol::VOID) && value_function_return) {
		error_handler("'" + new_func->name + "' should not contain 'return'. ");
	}

    Q epilog_q(Q::EPILOG, NULL);
    q_table->add_quaterion(epilog_q);

    return true;
}

bool Syntax::func_def_parameter_list(Symbol* func_sym) {
    if (match_type(Token::RIGHT_PARENTHESIS)) {
        return true;
    } else if (match_type(Token::INT) || match_type(Token::CHAR)) {
        do {
            if (!func_def_parameter_pair(func_sym)) {
                return false;
                // deal with error in upper level
            }
            if (match_type(Token::COMMA)) {
                next_token();
            } else {
                break;
            }
        } while (true);      
        return true;
    } else {
        return false;
        // deal with error in upper level
    }
}

bool Syntax::func_def_parameter_pair(Symbol* func_sym) {
    int type;
    string name;
    Symbol* param_sym = NULL;
    if (match_type(Token::INT)) {
        type = Symbol::INT;
        next_token();
    } else if (match_type(Token::CHAR)) {
        type = Symbol::CHAR;
        next_token();
    } else {
        //read_token.display();
        //cout << "false at type match\n";
        return false;
    }
    if (match_type(Token::IDENTITY)) {
        name = read_token.getName();
        param_sym = new Symbol(name, type);
        add_sym(param_sym);
        func_sym->parameter_type_list.push_back(param_sym);
        next_token();
        return true;
    } else {
        //cout << "false at identity match\n";
        return false;
    }
    return true;
}

