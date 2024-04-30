#ifndef __LEXER_H__
#define __LEXER_H__

#include <cstdlib>
#include <string>

// CurTok is the current token the parser is looking at
extern int CurTok;

int getCurToken();
// getNextToken reads another token from the lexer and updates CurTok with its results
int getNextToken();

// If the current token is an identifier
// IdentifierStr will hold the name of the identifier
extern std::string IdentifierStr;

// If the current token is a numeric literal
// NumVal holds its value
extern double NumVal;

#endif
