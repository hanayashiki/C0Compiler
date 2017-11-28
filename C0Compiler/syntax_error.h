#include "stdafx.h"

class SyntaxError;

class SyntaxError {
private:
public:
    static const int DEALER_COUNT = 10;
    static const int ANYTOKENS = -1;
    static const int ANY = -2;
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
        VARIABLE_DECLARATION_MISSING_IDENTIFIER,
        ARRAY_ILLEGAL_LENGTH,
        ARRAY_ILLEGAL_TOKEN_INSIDE,
        ARRAY_MISSING_RIGHT_BRACKET,
        REDEFINED_IDENTIFIER,
        UNDEFINED_IDENTIFIER,
        INVALID_LEFT_IDENTIFIER_TYPE,
        FUNCTION_INVALID_TYPE, // TO DO
        FUNCTION_MISSING_NAME, // TO DO
        FUNCTION_MISSING_LEFT_PARENTHESIS, // TO DO
        FUNCTION_MISSING_RIGHT_PARENTHESIS, // TO DO
        BAD_ASSIGNMENT // TO DO
    };
    pattern_list 
        pattern_group_escape_to_next_statement;
    pattern_list
        pattern_group_escape_to_next_statement_or_comma;
    pattern_list
        pattern_group_find_nothing;
};
