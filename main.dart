// gcc mylib.c -shared -fPIC -o mylib.so
// dart run ffigen
// Samples that illustrates ffigen and struct

import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'generated_bindings.dart';

void main(List<String> args) {
  String libPath = "mylib.so";
  final lib = NativeLibrary(ffi.DynamicLibrary.open(libPath));

  ///---------------------------------------------------------------------------
  /// #1 - Illustrates creating a struct in C and using it in Dart

  MyStruct s = lib.createNewStruct();
  print("Created from C: ${s.v1} ${s.v2} ${s.v3}");

  ///---------------------------------------------------------------------------
  // # - 2 Illustrates the struct being allocated and freed in Dart instead of C
  // It's passed to C to be printed with printf
  ffi.Pointer<MyStruct> dartStruct = malloc.call<MyStruct>();

  dartStruct.ref.v1 = 100;
  dartStruct.ref.v2 = 101;
  dartStruct.ref.v3 = 102;
  lib.printStruct(dartStruct.ref);

  malloc.free(dartStruct);
}
