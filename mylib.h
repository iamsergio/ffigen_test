#pragma once

struct MyStruct {
  int v1;
  int v2;
  int v3;
};

struct MyStruct createNewStruct();
void printStruct(struct MyStruct s);
