#include "stdafx.h"

Syntax::Syntax(Lexer * L, SymbolTable * s, QuaterionTable* q) {
    lexer = L;
    symbol_table = s;
    q_table = q;
    token_pointer = token_list.begin();
}

bool Syntax::match_type(int token_type) {
    return read_token.type == token_type;
}

void Syntax::next_token() {
    if ((token_list.size() == 0) || (token_pointer == (token_list.end() - 1))) {  
        read_token = lexer->getToken();
        token_list.push_back(read_token);
        //read_token.display();
        token_pointer = token_list.end() - 1;
        //cout << "way1--------" << endl;
        //cout << "reason:" << (token_pointer == (token_list.end() - 1));
    } else {
        token_pointer++;
        read_token = *token_pointer;
        //read_token.display();
    }
}

void Syntax::retract_token() {
    assert(token_pointer != token_list.begin());
    token_pointer--;
    //cout << "I have retracted. " << (token_pointer == (token_list.end() - 1)) << endl;
    read_token = *token_pointer;
    //cout << "retract:" << endl;
    //read_token.display();
}

string Syntax::anonymous() {
    static long long int num = 0;
    return "UNNAMED_" + to_string(num++);
}

void Syntax::add_sym(Symbol* sym) {
    if (symbol_table->in_current_map(sym->name)) {
        error_handler(SyntaxError::REDEFINED_IDENTIFIER, sym->name);
        sym->name = anonymous(); // 赋予一个临时的名字，以便继续编译
    }
    symbol_table->add_map(sym->name, sym);
}

Symbol* Syntax::temp_symbol(int type, bool save) {
    static long long int num = 0;
    string name = "t" + to_string(num++);
    Symbol* t = new Symbol(name, type);
    if (save) {
        add_sym(t);
    }
    return t;
}

int Syntax::get_type(int left_type, int right_type) {
    if (left_type == right_type) {
        return left_type;
    } else {
        return Symbol::INT; // INT is always bigger
    }
}

Symbol* Syntax::new_label(string prefix, bool save) {
    static long long int num = 0;
    string name = prefix + "_" + to_string(num++);
    Symbol* t = new Symbol(name, Symbol::LABEL);
    if (save) {
        add_sym(t);
    }
    return t;
}