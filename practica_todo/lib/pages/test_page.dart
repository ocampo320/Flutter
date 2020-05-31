import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicatodo/platform_widgets/platform_appbar.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool isPassword;
  TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    isPassword = true;
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAppBar(
        title: 'Prueba',
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.close),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 2.66,
            child: Image.network(
              'https://compass-ssl.xbox.com/assets/5f/57/5f5705b8-8e82-474b-b1e5-b25101748c95.jpg?n=GTA-V_Multi-Feature-1084_Diamond-Heist_1600x600.jpg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0)
                .copyWith(top: 16.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(hintText: 'Correo'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0)
                .copyWith(top: 16.0),
            child: TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  icon: Icon(
                      isPassword ? Icons.visibility_off : Icons.visibility),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              onPressed: () {},
              child: Text('Ingresar'),
            ),
          )
        ],
      ),
    );
  }

  bool validateData() {
    if (_emailController.text == 'paco@hotmail.com') {
      return true;
    } else {
      return false;
    }
  }
}
