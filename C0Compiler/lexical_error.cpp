#include "stdafx.h"

LexicalError::LexicalError() {
    struct ErrorDealer dealer_char_inside_int = 
    {
        "An unexpected character is inside a integer. ", 
        LegalJudger::is_splitter
    };
    ErrorDealers.push_back(dealer_char_inside_int);
    struct ErrorDealer dealer_leading_zero = 
    {
        "Integers except for zero should not contain any leading zeros. ",
        LegalJudger::is_splitter
    };
    ErrorDealers.push_back(dealer_leading_zero);
    struct ErrorDealer dealer_missing_single_quote =
    {
        "''' is not matched when defining a character. ",
        LegalJudger::is_splitter
    };
    ErrorDealers.push_back(dealer_missing_single_quote);
    struct ErrorDealer dealer_missing_double_quote =
    {
        "'\"' is not matched when defining a string. ",
        LegalJudger::is_splitter_string
    };
    ErrorDealers.push_back(dealer_missing_double_quote);
    struct ErrorDealer dealer_illegal_char_inside =
    {
        "Illegal character found inside a string. ",
        LegalJudger::is_splitter_string
    };
    ErrorDealers.push_back(dealer_illegal_char_inside);
    struct ErrorDealer dealer_illegal_first_char =
    {
        "Unknown character identified. ",
        LegalJudger::is_first
    };
    ErrorDealers.push_back(dealer_illegal_first_char);
}

bool LegalJudger::is_first(char c) {
    return 
        (c == '+') || 
        (c == '-') ||
        (c == '*') ||
        (c == '/') ||
        (c == '<') ||
        (c == '=') ||
        (c == '!') ||
        Lexer::isLetter(c) ||
        Lexer::isNoneZero(c) || (c == '0') ||
        (c == '{') ||
        (c == '}') ||
        (c == '[') ||
        (c == ']') ||
        (c == '(') ||
        (c == ')') ||
        (c == ',') ||
        (c == ':') ||
        (c == ';') ||
        (c == '\'') ||
        (c == '\"');
}

bool LegalJudger::is_splitter(char c) {
    // 下一个是分界符
    return 
        (!is_first(c)) || //不合法，当做分解符
        (c == EOF) ||
        (c == ' ') ||
        (c == '\n') ||
        (c == '\t') ||
        (c == '+') || 
        (c == '-') ||
        (c == '*') ||
        (c == '/') ||
        (c == '<') ||
        (c == '=') ||
        (c == '!') ||
        (c == '{') ||
        (c == '}') ||
        (c == '[') ||
        (c == ']') ||
        (c == '(') ||
        (c == ')') ||
        (c == ',') ||
        (c == ':') ||
        (c == ';') ||
        (c == '\'') ||
        (c == '\"');
}

bool LegalJudger::is_splitter_string(char c) {
    // 下一个是分界符，读入 " 后，' 不再视为分节符
    return
        (!is_first(c)) || //不合法，当做分解符
        (c == EOF) ||
        (c == ' ') ||
        (c == '\n') ||
        (c == '\t') ||
        (c == '+') || 
        (c == '-') ||
        (c == '*') ||
        (c == '/') ||
        (c == '<') ||
        (c == '=') ||
        (c == '!') ||
        (c == '{') ||
        (c == '}') ||
        (c == '[') ||
        (c == ']') ||
        (c == '(') ||
        (c == ')') ||
        (c == ',') ||
        (c == ':') ||
        (c == ';') ||
        (c == '\"');
}