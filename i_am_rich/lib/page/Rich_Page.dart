import 'package:flutter/material.dart';

class RichPage extends StatefulWidget {
  @override
  _RichPageState createState() => _RichPageState();
}

class _RichPageState extends State<RichPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: (AppBar(
            title: Text("I am Rich"),
          )),
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "DIAMOND STATUS",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Image.network(
                        ("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ-VBSpURRRc3BYi6BPfgM64upbvMYOu0G3XvPjOAztUEeEacU6&usqp=CAU")),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      "I am so rich that i bougth this"
                      "aplication to show my diamod"
                      "status because i am just that rich",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.black),
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
