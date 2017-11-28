patterns = \
[
	{
		"name": "find_end",
		"pattern": ["Token::SEMICOLON"]
	},
	{
		"name": "find_comma",
		"pattern": ["Token::COMMA"]
	},
	{
		"name": "find_if",
		"pattern": ["Token::IF"]
	},
	{
		"name": "find_for",
		"pattern": ["Token::FOR"]
	},
	{
		"name": "find_statement_block",
		"pattern": ["Token::LEFT_BRACE"]
	},
	{
		"name": "find_array_assignment",
		"pattern": ["Token::IDENTITY", "Token::LEFT_BRACKET", "ANYTOKENS",
    	"Token::RIGHT_BRACKET", "Token::ASSIGN"]
	},
	{
		"name": "find_simple_assignment",
		"pattern": ["Token::IDENTITY", "Token::ASSIGN"]
	},
	{
		"name": "find_next_const_def",
		"pattern": ["Token::CONST"]
	},
	{
	    "name": "find_next_var_int_def",
		"pattern": ["Token::INT", "Token::IDENTITY"]
	},
	{
	    "name": "find_next_var_char_def",
		"pattern": ["Token::CHAR", "Token::IDENTITY"]
	},
	{
		"name": "not_find",
		"pattern": ["ANY"]
	}

]

count = 0

for p in patterns:
	count += 1
	pattern_str = ", ".join(p["pattern"])
	print("""\
    int pattern_meta%d[%d] = {%s};
    vector<int> pattern_%s
    	(begin(pattern_meta%d), end(pattern_meta%d));
	""" % (count, len(p["pattern"]), pattern_str, p["name"], count, count))