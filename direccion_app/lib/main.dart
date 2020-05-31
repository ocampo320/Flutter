import 'package:direccionapp/page/direccion_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DirecionPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.orange,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color.fromRGBO(37, 211, 102, 1.0))),
  ));
}
