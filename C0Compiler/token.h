#pragma once
#include "stdafx.h"
#define TOKEN_TYPE_COUNT 42

using namespace std;

static char* token_names[TOKEN_TYPE_COUNT] = {
	"unknown",
	"+",
	"-",
	"*",
	"/",

	"<",
	"<=",
	">",
	">=",
	"!=",
	"==",

	"=",

	"identifier",
	"unsigned_integer",

	"{",
	"}",
	"[",
	"]",
	"(",
	")",

	",",
	":",
	";",

	"\'",
	"\"",

	"character",
	"string",

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
	"end of file",
	"unknow_tail"
};

class Token {
public:
	Token();
	void display();
	bool setValue(int numerical);
	bool setValue(char character);
	bool setValue(string str);
	bool setType(int type);

    char getCharValue() const;
    int getIntValue() const;
    const string getName() const;

	enum token_types {
		UNKNOWN,

		ADD,					// +
		MINUS,					// -
		MULTIPLY,				// *
		DIVIDE,					// /

		LESS_THAN,				// <
		LESS_EQUAL_THAN,		// <=
		GREATER_THAN,			// >
		GREATER_EQUAL_THAN,		// >=
		NOT_EQUAL,				// !=
		EQUAL,					// ==

		ASSIGN,					// =

		IDENTITY,				// id
		UNSIGNED_INTEGER,		// 0 or 1234

		LEFT_BRACE,				// {
		RIGHT_BRACE,			// }
		LEFT_BRACKET,			// [
		RIGHT_BRACKET,			// ]
		LEFT_PARENTHESIS,		// (
		RIGHT_PARENTHESIS,		// )

		COMMA,					// ,
		COLON,					// :
		SEMICOLON,				// ;			

		SINGLE_QUOTE,			// '
		DOUBLE_QUOTE,			// "

		CHARACTER,				// 'c'
		STRING,					// "abc"

		CONST,					// const
		INT,					// int
		CHAR,					// char
		VOID,					// void

		IF,						// if
		ELSE,					// else
		FOR,					// for

		SWITCH,					// switch
		CASE,					// case

		DEFAULT,				// default
		RETURN,					// return

        PRINTF,                 // printf
        SCANF,                  // scanf
		END_OF_FILE,			// file end
		UNKNOWN_TAIL			// signifying the tail
	};

	int type;
	bool integerPositiveOverflow;
	bool integerNegativeOverflow;

private:
	int numerical_value;
	char character_value;
	string string_value;
};