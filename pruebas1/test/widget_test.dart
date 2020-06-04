// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pruebas1/calc.dart';

import 'package:pruebas1/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  test('El contador debe ser incrementado', () {
    var test = Calc();

    expect(test.calc(4), 8);
  });

  test('test de reactivo', () {
    Stream<int> generador(int rangoProcesamiento) async* {
      for (int i = 0; i < rangoProcesamiento; i++) {
        await Future.delayed(Duration(seconds: 1));
        yield i;
      }
    }

    generador(10).listen((int valor) => print(valor));
  });

  test("pruebas de stream", () {
    Stream<int> getNumber() async* {
      for (int i = 1; i <= 10; i++) {
        yield i;
        await Future.delayed(Duration(seconds: 1));
      }
      void main() {
        getNumber().listen((event) {
          print(event);
        });
      }
    }
  });
}
