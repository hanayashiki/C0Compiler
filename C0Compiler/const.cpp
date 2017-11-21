#include "stdafx.h"

int Syntax::const_() {
    bool minus = false;
    int value;
    // £Û£«£ü£­£Ý£¼ÎÞ·ûºÅÕûÊý£¾£ü£°
    if (read_token.type == Token::ADD) {
        next_token();
    } else if (read_token.type == Token::MINUS) {
        minus = true;
        next_token();
    }
    if (read_token.type == Token::UNSIGNED_INTEGER) {
        if ((read_token.integerPositiveOverflow == true) &&
            (minus == false)) {
            assert(0);
        }
        if ((read_token.integerNegativeOverflow == true) &&
            (minus == true)) {
            assert(0);
        }
        value = read_token.getIntValue();
        cout << "got value: " << value << endl;
        next_token();
        if (minus) {
            return -1 * value;
        } else {
            return value;
        }
    }
    return -1;
}
