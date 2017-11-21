#include "stdafx.h"

Symbol::Symbol(string name_, int type_) {
    name = name_;
    type = type_;
    const_flag = false;
}

Symbol::Symbol(string name_, int type_, bool const_) {
    name = name_;
    type = type_;
    const_flag = const_;
}

bool Symbol::setConstantValue(char value) {
    assert(const_flag && (type == CHAR));
    character_value = value;
    return true;
}

bool Symbol::setConstantValue(int value) {
    assert(const_flag && (type == INT));
    integer_value = value;
    return true;
}

void Symbol::display() {
    cout << "name: " << name << "; ";
    cout << "type: ";
    switch (type) {
    case FUNCTION:
        cout << "function; ";
        break;
    case CHAR:
        cout << "char; ";
        break;
    case INT:
        cout << "int; ";
        break;
    case ARRAY:
        cout << "array; ";
        break;
    default:
        cout << "unexpected type; ";
    }
    if (const_flag) {
        cout << "const value: ";
        if (type == CHAR) {
            cout << "'" << character_value << "'";
        } else {
            cout << integer_value;
        }
    }
    cout << endl;
}