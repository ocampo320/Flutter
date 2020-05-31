import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DirecionPage extends StatefulWidget {
  @override
  _DirecionPageState createState() => _DirecionPageState();
}

class _DirecionPageState extends State<DirecionPage> {
  int stars = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(50),
              child: Text("Direcion Sofka!!!"),
            ),
            backgroundColor: Colors.orange[800],
          ),
          body: ListView(
            children: <Widget>[
              Expanded(
                child: Image.network(
                    "https://www.sofka.com.co/wp-content/uploads/oficina-nueva-6.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Casa sofka",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "Cl.120-80, Medellín, Antioquia",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.star,
                          color: Colors.red[500],
                        ),
                        onPressed: () {
                          setState(() {
                            stars++;
                          });
                        }),
                    Text(
                      "$stars",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      BuildColumn(
                          title: "CALL",
                          iconData: Icons.call,
                          color: Colors.orange[800]),
                      BuildColumn(
                          title: "ROUTER",
                          iconData: Icons.near_me,
                          color: Colors.orange[800]),
                      BuildColumn(
                          title: "SHARE",
                          iconData: Icons.share,
                          color: Colors.orange[800]),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "TECNOLOGÍAS",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                ),
              ),
              TextoInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildColumn extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color color;

  const BuildColumn({Key key, this.title, this.iconData, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.orange[800],
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400, color: color),
            ),
          )
        ],
      ),
    );
  }
}

class TextoInfo extends StatefulWidget {
  @override
  _TextoInfoState createState() => _TextoInfoState();
}

class _TextoInfoState extends State<TextoInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          'Somos expertos en desarrollo de software, aseguramiento de calidad '
          'a través de automatización de pruebas, modelamiento '
          'y automatización de procesos. Nuestra experiencia en tecnología '
          'nos capacita para ofrecer servicios y soluciones de desarrollo '
          'de software que aseguren una mayor eficiencia en el negocio.',
          textAlign: TextAlign.justify,
          softWrap: true,
        ));
  }
}
