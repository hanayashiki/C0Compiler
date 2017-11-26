#include "stdafx.h"

using namespace std;

int main() {
	Lexer lexer;
	Token token;
	FILE* f = fopen("lexer_test_submit.txt", "r");
	lexer.setSource(f);
	while ((token = lexer.getToken()).type
		!= Token::END_OF_FILE) {
		token.display();
		printf("----------\n");
	}
	getchar();
	return 0;
}