#include "stdafx.h"

Syntax::Syntax(Lexer * L, SymbolTable * s, QuaterionTable* q,
    sym_list * string_t) {
    lexer = L;
    symbol_table = s;
    q_table = q;
    string_table = string_t;

    errors = 0;

    last_id = -1;
    token_pointer = token_list.begin();
    reg_handler = new RegexHandler();
}

Syntax::~Syntax() {
    delete reg_handler;
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
       // read_token.display();
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
    return "%UNNAMED_" + to_string(num++);
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
    string name = "%t" + to_string(num++);
    Symbol* t = new Symbol(name, type);
    if (save) {
        add_sym(t);
    }
    return t;
}

int Syntax::get_type(int left_type, int right_type) {
    return Symbol::INT; // INT is always bigger
}

Symbol* Syntax::new_label(string prefix, bool save) {
    static long long int num = 0;
    //string name = prefix + "_" + to_string((long long int)hash_int(num++));
    string name = prefix + "_" + to_string((num++));
    Symbol* t = new Symbol(name, Symbol::LABEL);
    if (save) {
        add_sym(t);
    }
    return t;
}

Symbol* Syntax::const_sym(int value, int type) {
    string name;
    //cout << type;
    if (type == Symbol::INT) {
        name = to_string((long long int)value);
    } else {
        name = "\'";
        name.push_back((char) value);
        name.push_back('\'');
    }
    if (symbol_table->in_map(name)) {
        return symbol_table->get_sym(name);
    } else {
        Symbol* t = new Symbol(name, type, true);
        if (type == Symbol::INT) {
            t->setConstantValue(value);
        } else {
            t->setConstantValue((char)value);
        }
        return t;
    }
}

bool Syntax::semicolon_handler() {
    if (match_type(Token::SEMICOLON)) {
        next_token();
    } else {
        error_handler(SyntaxError::MISSING_SEMICOLON);
    }
    return true;
}