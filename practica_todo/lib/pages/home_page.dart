import 'package:flutter/material.dart';
import 'package:practicatodo/pages/test_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("practicas"),
        ),
        body: ListView(
          children: [
            ExpansionTile(
              title: Text("Navigator"),
              children: <Widget>[
                _ButtonListTile(
                    title: "ir",
                    subTitle: "volver",
                    leading: Icon(Icons.call_made)),
              ],
            ),
            ExpansionTile(
              title: Text("Pruebas"),
              children: <Widget>[
                _ButtonListTile(
                    title: "clase pruebas",
                    subTitle: "pruebas",
                    leading: Icon(Icons.adb),
                    onTap: () {
                      navigateToPage(TestPage());
                    }),
              ],
            )
          ],
        ));
  }

  void navigateToPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

class _ButtonListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget leading;
  final GestureTapCallback onTap;

  _ButtonListTile({this.title, this.subTitle, this.leading, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        leading: leading,
        subtitle: Text(subTitle),
        onTap: onTap);
  }
}
