#include "stdafx.h"

void Symbol::init() {
    array_flag = false;
    function_flag = false;
    string_flag = false;
}

Symbol::Symbol(string name_, int type_, bool const_): 
    name(name_), type(type_), const_flag(const_)
{
    init();
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
    case CHAR:
        cout << "char; ";
        break;
    case INT:
        cout << "int; ";
        break;
    case LABEL:
        cout << "label; ";
        break;
    default:
        cout << "unexpected type; ";
    }
    if (const_flag) {
        cout << "const value: ";
        if (type == CHAR) {
            cout << "'" << character_value << "'; ";
        } else {
            cout << integer_value << "; ";
        }
    }
    if (array_flag) {
        cout << "array length: " << array_length << "; ";
    }
    if (function_flag) {
        cout << "parameter list: " ;
        for (vector<int>::iterator ptr = parameter_type_list.begin();
            ptr != parameter_type_list.end(); ptr++) {
            int type = *ptr;
            switch (type) {
            case INT:
                cout << "int; ";
                break;
            case CHAR:
                cout << "char; ";
                break;
            default:
                cout << "unexpected type; ";
            }
        }
    }
    cout << endl;
}

void Symbol::setArray(int len) {
    array_flag = true;
    array_length = len;
}

void Symbol::setFunc() {
    function_flag = true;
}

void Symbol::setString(string & s) {
    string_flag = true;
    string_content = s;
}