#include "mylib.h"

#include <stdio.h>

struct MyStruct createNewStruct() {
  struct MyStruct s;
  s.v1 = 1;
  s.v2 = 2;
  s.v3 = 3;
  return s;
}

void printStruct(struct MyStruct s) {
  printf("struct contents: %d, %d, %d\n", s.v1, s.v2, s.v3);
}
