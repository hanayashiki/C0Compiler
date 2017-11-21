#include "stdafx.h"
using namespace std;

Token::Token() {
	type = UNKNOWN;
	numerical_value = 0xCCCCCCCC;
	character_value = 127;
	string_value = "%Unknown";
}

bool Token::setValue(int numerical) {
	numerical_value = numerical;
	return true;
}

bool Token::setValue(char character) {
	character_value = character;
	return true;
}

bool Token::setValue(string str) {
	string_value = str;
	return true;
}

bool Token::setType(int t) {
	assert(t > UNKNOWN && t < UNKNOWN_TAIL);
	type = t;
	return true;
}

void Token::display() {
	printf("type: %s\n", token_names[type]);
	if (type == IDENTITY) {
		printf("id name: %s\n", string_value.c_str());
	}
	if (type == CHARACTER) {
		printf("character: %c\n", character_value);
	}
	if (type == STRING) {
		printf("string: %s\n", string_value.c_str());
	}
	if (type == UNSIGNED_INTEGER) {
		printf("unsigned: %d\n", numerical_value);
	}
}

const string & Token::getName() const {
    return string_value;
}

char Token::getCharValue() const {
    return character_value;
}

int Token::getIntValue() const {
    return numerical_value;
}