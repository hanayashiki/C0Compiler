#pragma once
#include "stdafx.h"

using namespace std;

class LexicalError {
private:
    static const int DEALER_COUNT = 6;
public:
    enum error_types {
        CHAR_INSIDE_INT,
        LEADING_ZERO,
        MISSING_SINGLE_QUOTE,
        MISSING_DOUBLE_QUOTE,
        ILLEGAL_CHAR_INSIDE,
        ILLEGAL_FIRST_CHAR,
        ILLEGAL_CHARACTER
    };
    LexicalError();
    struct ErrorDealer;
    vector<struct ErrorDealer> ErrorDealers;
};

struct LexicalError::ErrorDealer {
    string desciption;
    bool (*next_legal)(char c);
};

namespace LegalJudger {
    bool is_first(char c);
    bool is_splitter(char c);
    bool is_splitter_string(char c);
}