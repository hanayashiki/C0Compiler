#include "stdafx.h"
#include <regex>

RegexHandler::RegexHandler() {
    string if_ = "if(.*)";
    string for_ = "for(.*)";
    string sequence = "\\{(.*)";
    string function = "identifier\\((.*)";
    string assign = "identifier(\\[|\\=)(.*)";
    string printf_ = "printf(.*)";
    string scanf_ = "scanf(.*)";
    string switch_ = "switch(.*)";
    string return_ = "return(.*)";
    string empty = ";(.*)";
    string right_brace = "\\}(.*)";

    string comparison = "(identifier)(\\<|\\<\\=|\\>|\\>\\=|\\=\\=|\\!\\=)";
    string case_ = "(case|default)(.*)"; 
    string colon = "\\:(.*)";

    string const_def = "const(.*)";
    string func_def = "(int|void|char)(main|identifier)\\((.*)";

   
    match_patterns.resize(HANDLER_COUNT, "");
    stop_patterns.resize(HANDLER_COUNT, "");
    // search_match_patterns
    match_patterns[JUMP_TO_NEXT_STATEMENT] =
        if_ + "|" +
        for_ + "|" +
        sequence + "|" +
        function + "|" +
        assign + "|" +
        printf_ + "|" +
        scanf_ + "|" +
        switch_ + "|" +
        return_ + "|" +
        empty;
    match_patterns[JUMP_TO_NEXT_STATEMENT_FOR_] =
        match_patterns[JUMP_TO_NEXT_STATEMENT] + "|" + comparison;
    match_patterns[JUMP_TO_NEXT_STATEMENT_CASE_] = 
        match_patterns[JUMP_TO_NEXT_STATEMENT] + "|" + case_ + "|" + colon;
    // until some other patterns are matched 
    stop_patterns[JUMP_TO_NEXT_STATEMENT] =
        func_def + "|" +
        right_brace;
}

bool Syntax::search_pattern(int pid) {
    int count = 0;
    while (true) {
        cout << "searching\n";
        if (match_pattern(reg_handler->match_patterns.at(pid), 
            reg_handler->max_match_len)) {
            cout << "found\n";
            read_token.display();
           // cout << reg_handler->match_patterns.at(pid);
            return true;
        }
        else if (match_pattern(reg_handler->stop_patterns.at(pid),
            reg_handler->max_match_len)) {
            cout << "gave up\n";
            break;
        }
        next_token();
        count++;
        if (read_token.type == Token::END_OF_FILE) {
            cout << "meet end\n";
            break;
        }
    }
    for (; count>0; count--) {
         cout << "retracting\n";
         retract_token();
    }
    return false;
}
