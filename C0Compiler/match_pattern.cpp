#include "stdafx.h"
#include <regex>


bool Syntax::match_pattern(string pattern, int token_count) {
    std::regex e(pattern);
    string see = "";
    int i;
    for (i = 0; i < token_count; i++) {
        if (match_type(Token::END_OF_FILE)) {
            break;
        }
        see += token_names[read_token.type];
        next_token();
        //read_token.display();
    }

    for (int j = 0; j < i; j++) {
        retract_token();
    }
    // cout << pattern << endl;
    // cout << see << (bool)std::regex_match(see, e) << endl;
    return (std::regex_match(see, e));
}