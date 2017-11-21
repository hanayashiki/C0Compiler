#pragma once
#define KEYWORD_COUNT (11)
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
	"return"
};
	
class Lexer {
public:
	Lexer();
	Token getToken();
	bool setSource(FILE * f);
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
private:
	int current_line;	// 1-indexed
	bool isLetter(char c);
	bool isNoneZero(char c);
	bool isDigit(char c);
	bool isLegalStringChar(char c);
	int digitAugment(int num_value, char c, Token & token);
	int getKeywordID(string & s);
	char getChar();
	void errorHandler();
	bool retract();
	FILE * source;
};