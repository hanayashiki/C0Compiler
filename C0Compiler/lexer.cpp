#include "stdafx.h"

Lexer::Lexer() {
	current_line = 1;
    token_id = 0;
}

Token Lexer::getToken() {
	int state = IDLE;
	int num_value = 0;
    bool leading_zero_flag = false;
	string name_str;
	Token token;
    token.token_id = token_id++;
	while (true) {
		char c = getChar();
		switch (state) {
		case IDLE:
			while ((c == '\t') || (c == '\n') || (c == ' ')) {
				if (c == '\n') {
					current_line++;
				}
				c = getChar();
			}
            token.line = current_line;
			if (c == EOF) {
				token.setType(Token::END_OF_FILE);
				return token;
			}
			else if (c == '+') {
				token.setType(Token::ADD);
				return token;
			}
			else if (c == '-') {
				token.setType(Token::MINUS);
				return token;
			}
			else if (c == '*') {
				token.setType(Token::MULTIPLY);
				return token;
			}
			else if (c == '/') {
				token.setType(Token::DIVIDE);
				return token;
			}
			else if (c == '<') {
				state = LESS_HEAD;
			}
			else if (c == '>') {
				state = GREATER_HEAD;
			}
			else if (c == '=') {
				state = EQUAL_HEAD;
			}
			else if (c == '!') {
				state = EXCLAMATION_HEAD;
			}
			else if (isLetter(c)) {
				name_str.append(1, c);
				state = IDENTITY_BODY;
			}
            else if (isNoneZero(c) || c == '0') {
                if (c == '0') {
                    leading_zero_flag = true;
                }
				token.setType(Token::UNSIGNED_INTEGER);
				num_value = digitAugment(num_value, c, token);
				state = UNSIGNED_INTEGER_BODY;
			}
			else if (c == '{') {
				token.setType(Token::LEFT_BRACE);
				return token;
			}
			else if (c == '}') {
				token.setType(Token::RIGHT_BRACE);
				return token;
			}
			else if (c == '[') {
				token.setType(Token::LEFT_BRACKET);
				return token;
			}
			else if (c == ']') {
				token.setType(Token::RIGHT_BRACKET);
				return token;
			}
			else if (c == '(') {
				token.setType(Token::LEFT_PARENTHESIS);
				return token;
			}
			else if (c == ')') {
				token.setType(Token::RIGHT_PARENTHESIS);
				return token;
			}
			else if (c == ',') {
				token.setType(Token::COMMA);
				return token;
			}
			else if (c == ':') {
				token.setType(Token::COLON);
				return token;
			}
			else if (c == ';') {
				token.setType(Token::SEMICOLON);
				return token;
			}
			else if (c == '\'') {
				state = CHARACTER_BODY;
			}
			else if (c == '\"') {
				state = STRING_BODY;
			}
			else {
                // 读到的第一个字符不合法，继续往下读，直到遇到合法的
				errorHandler(LexicalError::ILLEGAL_FIRST_CHAR);
                state = IDLE;
			}
			break;
		case LESS_HEAD:
			if (c == '=') {
				token.setType(Token::LESS_EQUAL_THAN);
			}
			else {
				retract();
				token.setType(Token::LESS_THAN);
			}
			return token;
			break;
		case GREATER_HEAD:
			if (c == '=') {
				token.setType(Token::GREATER_EQUAL_THAN);
			}
			else {
				retract();
				token.setType(Token::GREATER_THAN);
			}
			return token;
			break;
		case EQUAL_HEAD:
			if (c == '=') {
				token.setType(Token::EQUAL);
			}
			else {
				retract();
				token.setType(Token::ASSIGN);
			}
			return token;
			break;
		case EXCLAMATION_HEAD:
			if (c == '=') {
				token.setType(Token::NOT_EQUAL);
				return token;
			}
			else {
				errorHandler(0);
			}
			break;
		case IDENTITY_BODY:
			if (isLetter(c) || isDigit(c)) {
				name_str.append(1, c);
				state = IDENTITY_BODY;
			} 
			else {
				retract();
				int keyword = getKeywordID(name_str);	// 判断是否是关键字
				if (keyword >= 0) {
					token.setType(keyword);
				}
				else {
					token.setType(Token::IDENTITY);
					token.setValue(name_str);
				}
				return token;
			}
			break;
		case UNSIGNED_INTEGER_BODY:
			if (isDigit(c)) {
				num_value = digitAugment(num_value, c, token);
				state = UNSIGNED_INTEGER_BODY;
                if (leading_zero_flag) {
                    errorHandler(LexicalError::LEADING_ZERO);
                }
			}
            else if (isLetter(c)) {
                errorHandler(LexicalError::CHAR_INSIDE_INT);
                token.setValue(num_value);
				return token;
            }
			else {
				retract();
				token.setValue(num_value);
				return token;
			}
			break;
		case CHARACTER_BODY:
			if ((c == '+') || (c == '*') || isLetter(c) || isDigit(c)) {
				token.setType(Token::CHARACTER);
				token.setValue(c);
				state = CHARACTER_TAIL;
			}
			else {
				errorHandler(0);
			}
			break;
		case CHARACTER_TAIL:
			if (c == '\'') {
				return token;
			}
			else {
                retract();
				errorHandler(LexicalError::MISSING_SINGLE_QUOTE);
                return token;
			}
			break;
		case STRING_BODY:
			if (isLegalStringChar(c)) {
				name_str.append(1, c);
			}
			else if (c == '\"') {
				token.setType(Token::STRING);
				token.setValue(name_str);
				return token;
			}
			else {
                retract(); // 非法字符认为是分界符
				errorHandler(LexicalError::ILLEGAL_CHAR_INSIDE);
                token.setType(Token::STRING);
				token.setValue(name_str);
                cout << name_str;

				return token;
			}
			break;
		default:
			printf("Wrong state.\n");
			assert(0);
		}
	}
}

bool Lexer::isLetter(char c) {
	// ＜字母＞   ::= ＿｜a｜．．．｜z｜A｜．．．｜Z
	return (c == '_') || ((c >= 'a') && (c <= 'z')) || ((c >= 'A') && (c <= 'Z'));
}

bool Lexer::isNoneZero(char c) {
	// ＜非零数字＞  ::= １｜．．．｜９
	return (c >= '1') && (c <= '9');
}

bool Lexer::isDigit(char c) {
	return (c >= '0') && (c <= '9');
}

bool Lexer::isLegalStringChar(char c) {
	return (c == 32) || (c == 33) || ((c >= 35) && (c <= 126));
}

char Lexer::getChar() {
	static bool ended = false;
	if (ended == true) {
		return EOF;
	}
	char c = fgetc(source);
	if (c == EOF) {
		ended = true;
	}
	return c;
}

bool Lexer::retract() {
	fseek(source, -1, SEEK_CUR);
	return true;
}

int Lexer::digitAugment(int num_value, char c, Token & token) {
	assert(isDigit(c));
	long long int num_longer = num_value;
	long long int predict = 10 * num_longer + c - '0';
	if (predict > POSITIVE_MAX) {
		token.integerPositiveOverflow = true;
	}
	if (predict > NEGATIVE_MIN_ABS) {
		token.integerNegativeOverflow = true;
	}
	return (10 * num_value + c - '0');
}

int Lexer::getKeywordID(string & s) {

	for (int index = 0; index < KEYWORD_COUNT; index++) {
		if (s == keywords[index]) {
			return index + Token::CONST;  // keyword 编号和 token_types 统一,
										  // keyword 编号从 CONST 开始，有偏移量
		}
	}
	return -1;
}

bool Lexer::setSource(FILE* f) {
	source = f;
	return true;
}

void Lexer::errorHandler(int e) {
	// TODO: solve lexical error
	printf("Lexical error at line %d: ", current_line);
    cout << lexical_error.ErrorDealers[e].desciption << endl;
    if (lexical_error.ErrorDealers[e].next_legal != NULL) {
        char c = getChar();
        while (!(lexical_error.ErrorDealers[e].next_legal(c)) && (c != EOF)) {
            c = getChar();
        }
        retract();
    }
}