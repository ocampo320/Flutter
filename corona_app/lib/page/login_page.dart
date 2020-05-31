import 'package:coronaapp/data/User_Data.dart';
import 'package:coronaapp/domain/User_Domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'principal_page.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passController;
  UserData data = UserData();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: (Text("Login")),
        ),
        body: ListView(
          children: <Widget>[
            Expanded(
              child: Image.network(
                  "https://imageog.flaticon.com/icons/png/512/295/295128.png?size=1200x630f&pad=10,10,10,10&ext=png&bg=FFFFFFFF"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'Enter your email', border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _passController,
                decoration: const InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    if (validateData()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaginaPrincipal()));
                    } else {
                      Widget okButton = FlatButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop(false);
                        },
                      );
                      AlertDialog alert = AlertDialog(
                        title: Text("Error"),
                        content: Text("Los datos no corresponden"),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }
                  },
                  child: Text("Ingresar"),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("Recuperar clave")],
            )
          ],
        ),
      ),
    ));
  }

  bool validateData() {
    if (_emailController.text == data.userData[0].email) {
      return true;
    } else {
      return false;
    }
  }
}
