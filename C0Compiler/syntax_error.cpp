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
	
    int pattern_meta6[6] = {Token::SEMICOLON, Token::IDENTITY, Token::LEFT_BRACKET, ANYTOKENS, Token::RIGHT_BRACKET, Token::ASSIGN};
    vector<int> pattern_find_array_assignment
    	(begin(pattern_meta6), end(pattern_meta6));
	
    int pattern_meta7[3] = {Token::SEMICOLON, Token::IDENTITY, Token::ASSIGN};
    vector<int> pattern_find_simple_assignment
    	(begin(pattern_meta7), end(pattern_meta7));
	
    int pattern_meta8[1] = {Token::CONST};
    vector<int> pattern_find_next_const_def
    	(begin(pattern_meta8), end(pattern_meta8));
	
    int pattern_meta9[2] = {Token::INT, Token::IDENTITY};
    vector<int> pattern_find_next_var_int_def
    	(begin(pattern_meta9), end(pattern_meta9));
	
    int pattern_meta10[2] = {Token::CHAR, Token::IDENTITY};
    vector<int> pattern_find_next_var_char_def
    	(begin(pattern_meta10), end(pattern_meta10));
	
    int pattern_meta11[1] = {ANY};
    vector<int> pattern_not_find
    	(begin(pattern_meta11), end(pattern_meta11));

    pattern_group_escape_to_next_statement.push_back(pattern_find_end);
    pattern_group_escape_to_next_statement.push_back(pattern_find_if);
    pattern_group_escape_to_next_statement.push_back(pattern_find_for);
    pattern_group_escape_to_next_statement.push_back(pattern_find_statement_block);
    pattern_group_escape_to_next_statement.push_back(pattern_find_next_const_def);
    pattern_group_escape_to_next_statement.push_back(pattern_find_next_var_int_def);
    pattern_group_escape_to_next_statement.push_back(pattern_find_next_var_char_def);
    pattern_group_escape_to_next_statement.push_back(pattern_find_array_assignment);
    pattern_group_escape_to_next_statement.push_back(pattern_find_simple_assignment);

    pattern_group_escape_to_next_statement_or_comma = pattern_list(
        pattern_group_escape_to_next_statement.begin(),
        pattern_group_escape_to_next_statement.end());
    pattern_group_escape_to_next_statement_or_comma.push_back(pattern_find_comma);
    pattern_group_find_nothing.push_back(pattern_not_find);
    // 0
    struct ErrorDealer dealer_const_declaration_missing_type = {
        "Keyword 'const' must be followed by 'char' or 'int'. ",
        pattern_group_escape_to_next_statement
    };
    ErrorDealers.push_back(dealer_const_declaration_missing_type);
    // 1
    struct ErrorDealer dealer_const_declaration_missing_assignment = {
        "Constant definition must contain initialization. ",
        pattern_group_escape_to_next_statement_or_comma
    };
    ErrorDealers.push_back(dealer_const_declaration_missing_assignment);
    // 2
    struct ErrorDealer dealer_missing_semicolon = {
        "';' is needed. ",
        pattern_group_escape_to_next_statement
    };
    ErrorDealers.push_back(dealer_missing_semicolon);
    // 3
    struct ErrorDealer dealer_variable_declaration_missing_identifier = {
        "Keyword 'char' and 'int' must be followed by an identifier. ",
        pattern_group_escape_to_next_statement_or_comma
    };
    ErrorDealers.push_back(dealer_variable_declaration_missing_identifier);
    // 4
    struct ErrorDealer dealer_array_illegal_length = {
        "The length of an array must be an appropriate positive integer. ",
        pattern_group_escape_to_next_statement_or_comma
    };
    ErrorDealers.push_back(dealer_array_illegal_length);
    // 5
    struct ErrorDealer dealer_array_illegal_token_inside = {
        "The token after the bracket should be an appropriate positive integer. ",
        pattern_group_escape_to_next_statement_or_comma
    };
    ErrorDealers.push_back(dealer_array_illegal_token_inside);
    // 6
    struct ErrorDealer dealer_array_missing_right_bracket = {
        "']' is needed. ",
        pattern_group_escape_to_next_statement_or_comma
    };
    ErrorDealers.push_back(dealer_array_missing_right_bracket);
    // 7
    struct ErrorDealer dealer_redefined_identifier = {
        "Redefined identifier. ",
        pattern_group_find_nothing
    };
    ErrorDealers.push_back(dealer_redefined_identifier);
    // 8
    struct ErrorDealer dealer_undefined_identifier = {
        "Undefined identifier. ",
        pattern_group_find_nothing
    };
    ErrorDealers.push_back(dealer_undefined_identifier);
    // 9
    struct ErrorDealer dealer_invalid_left_identifier_type = {
        "Only 'char' and 'int' can be assigned. ",
        pattern_group_find_nothing
    };
    ErrorDealers.push_back(dealer_invalid_left_identifier_type);
    // 10
    struct ErrorDealer dealer_bare_array_left_value = {
        "Array must be followed by [<expression>]. ",
        pattern_group_find_nothing
    };
    ErrorDealers.push_back(dealer_bare_array_left_value);
}

void Syntax::error_handler(int e, string info) {
    errors++;
    assert((e >= 0) && (e < SyntaxError::DEALER_COUNT));
    struct SyntaxError::ErrorDealer dealer = syntax_error.ErrorDealers.at(e);
    if (read_token.token_id != last_id) {
        cout << "Syntax error at line " << read_token.line << " : ";
        if (info.size() > 0) {
            cout << info << " : ";
        }
        cout << dealer.description << endl;
    }
    last_id = read_token.token_id;
    search_pattern(dealer.pattern_list);
}

bool Syntax::error_handler(string message, int pid) {
    errors++;
    if (read_token.token_id != last_id) {
        cout << "Syntax error at line " << read_token.line << " : ";
        cout << message << endl;
    }
    last_id = read_token.token_id;
    if (pid >= 0) {
        return search_pattern(pid);
    } else {
        return true;
    }
}

void Syntax::warning(string message) {
    cout << "Syntax warning at line " << read_token.line << " : ";
    cout << message << endl;
}

void Syntax::search_pattern(SyntaxError::pattern_list & list) {
    vector<int> match_count;
    for (unsigned idx = 0; idx < list.size(); idx++) {
        match_count.push_back(0);
    }
    // cout << "Start searching." << endl;
    // read_token.display();
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
            } else if (match_type(current_expecting_type) || 
                (current_expecting_type == SyntaxError::ANY)) {
                match_count.at(pattern_id)++;
            } else {
                match_count.at(pattern_id) = 0;
            }
            if (match_count.at(pattern_id) == pattern_pointer->size()) {
                // 倒退 n - 1 格
                //cout << "retract: -----\n";
                for (unsigned i = 0; i < (pattern_pointer->size())-1; i++) {
                    //read_token.display();
                    //cout << "->";
                    retract_token();
                    //read_token.display();
                }
                //cout << "----match returned" << endl;
                return;
            }
        }
        //cout << "matching:" ;
        next_token();
        //read_token.display();
    }
}

void Syntax::display_token_list() {
    vector<Token>::iterator ptr;
    for (ptr = token_list.begin(); ptr != token_list.end(); ptr++) {
        ptr->display();
    }
}