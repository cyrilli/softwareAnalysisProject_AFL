/* 
 * Correct regular experssion matching example for AFL
 * From:
 *   The Practice of Programming
 *   Brian W. Kernighan, Rob Pike
 *
 */ 
#include <stdio.h>

static int matchhere(char*,char*);

static int matchstar(int c, char *re, char *text) {
  do {
    if (matchhere(re, text))
      return 1;
  } while (*text != '\0' && (*text++ == c || c== '.'));
  return 0;
}

static int matchhere(char *re, char *text) {
  if (re[0] == '\0')
     return 0;
  if (re[1] == '*')
    return matchstar(re[0], re+2, text);
  if (re[0] == '$' && re[1]=='\0')
    return *text == '\0';
  if (*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}

int match(char *re, char *text) {
  if (re[0] == '^')
    return matchhere(re+1, text);
  do {
    if (matchhere(re, text))
      return 1;
  } while (*text++ != '\0');
  return 0;
}
/*
 * Harness for testing with AFL.
 */

// The size of the buffer to test with.
#define SIZE 7

int main(int argc, char** argv) {
  // The input regular expression.
  // The match function expects a null terminated string, e.g. one that ends with '\0'
  // Therefore, simply using scanf to read input will cause problem.
  // For example, when the input size is greater than or equal to SIZE, it leaves no place for '\0'.
  char re[SIZE];
  fgets(re, sizeof(re), stdin);
  size_t length = strlen(re);
  if (re[length - 1] == '\n') {
      re[length - 1] = '\0';
  }
  // Try to match against a constant string "hello".
  printf("%d\n",match(re, "hello"));
  return 0;
}

