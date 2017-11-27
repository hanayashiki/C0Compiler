#include "stdafx.h"

class SyntaxError;

class SyntaxError {
private:
public:
    static const int DEALER_COUNT = 4;
    static const int ANYTOKENS = -1;
    SyntaxError();
    typedef vector<vector<int>> pattern_list;

    struct ErrorDealer {
        string description;
        pattern_list pattern_list;
    };
    typedef vector<struct ErrorDealer> dealer_list;
    dealer_list ErrorDealers;

    enum error_types {
        CONST_DECLARATION_MISSING_TYPE,
        CONST_DECLARATION_MISSING_ASSIGNMENT,
        MISSING_SEMICOLON,
        VARIABLE_DECLARATION_MISSING_IDENTIFIER
    };
    pattern_list 
        pattern_group_escape_to_next_statement;
    pattern_list
        pattern_group_escape_to_next_statement_or_comma;
};
