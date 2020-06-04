import 'package:flutter_test/flutter_test.dart';
import 'package:pruebas1/calc.dart';

import 'package:flutter/material.dart';

void main() {
  test('El contador debe ser incrementado', () {
    var test = Calc();

    expect(test.calc(4), 2);
  });
}
