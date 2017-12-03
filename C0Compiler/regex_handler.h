#include "stdafx.h"

class RegexHandler {
public:
    static const int max_match_len = 3;
    vector<string> match_patterns;
    vector<string> stop_patterns;
    RegexHandler();
    static const int HANDLER_COUNT = 10;
    enum {
        JUMP_TO_NEXT_STATEMENT,
        JUMP_TO_NEXT_STATEMENT_FOR_,
        JUMP_TO_NEXT_STATEMENT_CASE_,
        JUMP_TO_NEXT_DEFINITION_FUNC
    };
};