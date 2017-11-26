#include "stdafx.h"

class SyntaxError {
private:
    static const int DEALER_COUNT = 10;
public:
    SyntaxError();
    struct ErrorDealer;
    enum error_types {
        CONST_DECLARATION_MISSING_TYPE,
        CONST_DECLARATION_MISSING_ASSIGNMENT,
        VARIABLE_DECLARATION_MISSING_IDENTIFIER
    };
};

struct SyntaxError::ErrorDealer {
    string description;
    bool (*next_legal)(int token_type);
};

namespace TokenJudger {
    /*bool */
};