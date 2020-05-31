import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.purpleAccent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 40.0,
                backgroundImage: NetworkImage(
                    "https://scontent.feoh3-1.fna.fbcdn.net/v/t1.0-1/p200x200/10645014_10153633183605865_8580684961406947258_n.jpg?_nc_cat=111&_nc_sid=7206a8&_nc_ohc=aGbeHDTwWcIAX_nuFTW&_nc_ht=scontent.feoh3-1.fna&_nc_tp=6&oh=8719a4d1bc2d6f11bc5c01e053b0de93&oe=5EF39A10"),
              ),
              Text(
                "Deibi Ocampo",
                style: TextStyle(fontSize: 25.0),
              ),
              Text(
                "Software Developer",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: Divider(color: Colors.white, height: 30.0),
              ),
              _itemCard(
                title: "3128389642",
                iconData: Icons.call,
              ),
              _itemCard(
                title: "telecentro.lasierra@gmail.com",
                iconData: Icons.email,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _itemCard extends StatelessWidget {
  final String title;
  final IconData iconData;

  _itemCard({this.title, this.iconData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: ListTile(leading: Icon(iconData), title: Text(title)),
      ),
    );
  }
}
