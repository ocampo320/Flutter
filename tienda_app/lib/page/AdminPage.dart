import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiendaapp/widget/card.dart';

class AdminPage extends StatelessWidget {
  AdminPage({this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Admin"),
      ),
      body: Column(
        children: <Widget>[
          itemCard(
            title: "Bienvenido $username",
            iconData: Icons.account_circle,
          ),
        ],
      ),
    );
  }
}
