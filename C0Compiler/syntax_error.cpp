#include "stdafx.h"

SyntaxError::SyntaxError() {
    int pattern_meta1[1] = {Token::SEMICOLON};
    vector<int> pattern_find_end
    	(begin(pattern_meta1), end(pattern_meta1));
	
    int pattern_meta2[1] = {Token::COMMA};
    vector<int> pattern_find_comma
    	(begin(pattern_meta2), end(pattern_meta2));
	
    int pattern_meta3[1] = {Token::IF};
    vector<int> pattern_find_if
    	(begin(pattern_meta3), end(pattern_meta3));
	
    int pattern_meta4[1] = {Token::FOR};
    vector<int> pattern_find_for
    	(begin(pattern_meta4), end(pattern_meta4));
	
    int pattern_meta5[1] = {Token::LEFT_BRACE};
    vector<int> pattern_find_statement_block
    	(begin(pattern_meta5), end(pattern_meta5));
	
    int pattern_meta6[5] = {Token::IDENTITY, Token::LEFT_BRACKET, ANYTOKENS, Token::RIGHT_BRACKET, Token::ASSIGN};
    vector<int> pattern_pattern_find_array_assignment
    	(begin(pattern_meta6), end(pattern_meta6));
	
    int pattern_meta7[2] = {Token::IDENTITY, Token::ASSIGN};
    vector<int> pattern_pattern_find_simple_assignment
    	(begin(pattern_meta7), end(pattern_meta7));
	
    int pattern_meta8[1] = {Token::CONST};
    vector<int> pattern_pattern_find_next_const_def
    	(begin(pattern_meta8), end(pattern_meta8));
	
    int pattern_meta9[2] = {Token::INT, Token::IDENTITY};
    vector<int> pattern_pattern_find_next_var_int_def
    	(begin(pattern_meta9), end(pattern_meta9));
	
    int pattern_meta10[2] = {Token::CHAR, Token::IDENTITY};
    vector<int> pattern_pattern_find_next_var_char_def
    	(begin(pattern_meta10), end(pattern_meta10));

    pattern_group_escape_to_next_statement.push_back(pattern_find_end);
    pattern_group_escape_to_next_statement.push_back(pattern_find_if);
    pattern_group_escape_to_next_statement.push_back(pattern_find_for);
    pattern_group_escape_to_next_statement.push_back(pattern_find_statement_block);
    pattern_group_escape_to_next_statement.push_back(pattern_pattern_find_next_const_def);
    pattern_group_escape_to_next_statement.push_back(pattern_pattern_find_next_var_int_def);
    pattern_group_escape_to_next_statement.push_back(pattern_pattern_find_next_var_char_def);

    pattern_group_escape_to_next_statement_or_comma = pattern_list(
        pattern_group_escape_to_next_statement.begin(),
        pattern_group_escape_to_next_statement.end());
    pattern_group_escape_to_next_statement_or_comma.push_back(pattern_find_comma);

    struct ErrorDealer dealer_const_declaration_missing_type = {
        "Keyword 'const' must be followed by 'char' or 'int'. ",
        pattern_group_escape_to_next_statement
    };
    ErrorDealers.push_back(dealer_const_declaration_missing_type);
    
    struct ErrorDealer dealer_const_declaration_missing_assignment = {
        "Constant definition must contain initialization. ",
        pattern_group_escape_to_next_statement_or_comma
    };
    ErrorDealers.push_back(dealer_const_declaration_missing_assignment);

    struct ErrorDealer dealer_missing_semicolon = {
        "';' is needed. ",
        pattern_group_escape_to_next_statement
    };
    ErrorDealers.push_back(dealer_missing_semicolon);
}

void Syntax::error_handler(int e) {
    assert((e >= 0) && (e < SyntaxError::DEALER_COUNT));
    struct SyntaxError::ErrorDealer dealer = syntax_error.ErrorDealers.at(e);
    cout << "Syntax error at line " << lexer->current_line << " :";
    cout << dealer.description << endl;
    search_pattern(dealer.pattern_list);
}

void Syntax::search_pattern(SyntaxError::pattern_list & list) {
    vector<int> match_count;
    for (unsigned idx = 0; idx < list.size(); idx++) {
        match_count.push_back(0);
    }
    //cout << "Start searching." << endl;
    while (!match_type(Token::END_OF_FILE)) {
        for (SyntaxError::pattern_list::iterator pattern_pointer = list.begin(); 
            pattern_pointer != list.end();
            pattern_pointer++) {
            // 对于每条pattern_list
            int pattern_id = pattern_pointer - list.begin();
            int current_expecting_type = pattern_pointer->at(match_count[pattern_id]);
            // 取得当前需要匹配的type
            if (current_expecting_type == SyntaxError::ANYTOKENS) {
                int next_expecting_type = pattern_pointer->at(match_count[pattern_id] + 1);
                if (match_type(next_expecting_type)) {
                    match_count.at(pattern_id)++;
                }
            } else if (match_type(current_expecting_type)) {
                match_count.at(pattern_id)++;
            } else {
                match_count.at(pattern_id) = 0;
            }
            if (match_count.at(pattern_id) == pattern_pointer->size()) {
                // 倒退 n - 1 格
                for (unsigned i = 0; i < pattern_pointer->size()-1; i++) {
                    retract_token();
                    //cout << "retract:";
                }
                //cout << "match returned" << endl;
                return;
            }
        }
        //cout << "matching:" ;
        next_token();
        //read_token.display();
    }
}

