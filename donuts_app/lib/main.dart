import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
          title: Text("Albun"),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(Icons.add),
          onPressed: () {
            AlertDialog(
              title: Text("hola"),
              content: Text("do you acept"),
              actions: [
                FlatButton(
                  child: Text("si"),
                )
              ],
            );
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              DicePace(image: "images/1.jpeg", messege: "foto 1"),
              Expanded(
                child: Image(
                  image: AssetImage("images/2.jpeg"),
                ),
              ),
              Image(
                image: AssetImage("images/3.jpeg"),
              ),
              Image(
                image: AssetImage("images/4.jpeg"),
              ),
            ],
          ),
        )),
  ));
}

class DicePace extends StatelessWidget {
  final String messege;
  final String image;

  const DicePace({Key key, this.messege, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            onPressed: () {
              print("hola");
            },
            child: Image.asset(image),
          ),
        ),
      ],
    );
  }
}
