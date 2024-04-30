#include "lexer/lexer.h"
#include "lexer/token.h"
#include <cstdio>

int main() {
  fprintf(stderr, "ready> ");
  int t = getNextToken();
  printf("%d\n", t);
}
