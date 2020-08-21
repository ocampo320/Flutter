import 'package:flutter/material.dart';

void main() {
  runApp(Prueba());
}

/*
Widget con  estado, se  construye las veces que se requiera
 */

//
//class Prueba extends StatefulWidget {
//  @override
//  _PruebaState createState() => _PruebaState();
//}
//

//
//class _PruebaState extends State<Prueba> {
//int contador = 0;
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: SafeArea(
//        child: Scaffold(
//            appBar: AppBar(
//              title: Text("Sin estado"),
//            ),
//            body: Container(
//              child: Column(
//                children: <Widget>[Text(contador.toString())],
//              ),
//            ),
//            floatingActionButton: FloatingActionButton(
//              child: Icon(Icons.add),
//              onPressed: () {
//                setState(() {});
//                print(contador++);
//              },
//            )),
//      ),
//    );
//  }
//}

/*
Widget sin estado, solo se  construye una vez
 */

class Prueba extends StatelessWidget {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Sin estado"),
            ),
            body: Container(
              child: Column(
                children: <Widget>[Text(contador.toString())],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                contador++;
                print(contador);
              },
            )),
      ),
    );
  }
}
