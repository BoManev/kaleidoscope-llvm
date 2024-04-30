#ifndef __TOKEN_H__
#define __TOKEN_H__

// The lexer returns tokens [0-255], eg in ASCII, if it's an unknown character like "+"
// otherwise it returns one of these for known things
enum Token {
  // End Of File
  tok_eof = -1,

  // Commands
  tok_def = -2,
  tok_extern = -3,

  // Primary
  tok_identifier = -4,
  tok_number = -5,
};

#endif
