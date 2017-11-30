#pragma once
#define KEYWORD_COUNT (13)
#define POSITIVE_MAX (2147483647)
#define NEGATIVE_MIN_ABS (2147483648)

static string keywords[KEYWORD_COUNT] = {
	"const",
	"int",
	"char",
	"void",

	"if",
	"else",
	"for",

	"switch",
	"case",

	"default",
	"return",
    "printf",
    "scanf",
};
	
class Lexer {
public:
	Lexer();
	Token getToken();
	bool setSource(FILE * f);
    enum errors;
    	int current_line;	// 1-indexed
	enum states {
		IDLE,
		LESS_HEAD,
		GREATER_HEAD,
		EQUAL_HEAD,
		EXCLAMATION_HEAD,

		IDENTITY_BODY,
		UNSIGNED_INTEGER_BODY,

		CHARACTER_BODY,
		CHARACTER_TAIL,
		STRING_BODY
	};
    static bool isLetter(char c);
	static bool isNoneZero(char c);
	static bool isDigit(char c);
	static bool isLegalStringChar(char c);
private:
    LexicalError lexical_error;
	int digitAugment(int num_value, char c, Token & token);
	int getKeywordID(string & s);
	char getChar();
	void errorHandler(int e);
	bool retract();
	FILE * source;
};