import 'package:flutter/material.dart';

import 'page/login_page.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Color.fromRGBO(18, 140, 125, 1.0),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color.fromRGBO(37, 211, 102, 1.0))),
  ));
}
