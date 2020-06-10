import 'package:flutter/material.dart';

class itemCard extends StatelessWidget {
  final String title;
  final IconData iconData;

  itemCard({this.title, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListTile(leading: Icon(iconData), title: Text(title)),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text("Salir"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/MyHomePage');
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
