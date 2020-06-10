import 'package:flutter/material.dart';
import 'package:tiendaapp/widget/card.dart';

class MemberPage extends StatelessWidget {
  MemberPage({this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome User"),
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
    ;
  }
}
