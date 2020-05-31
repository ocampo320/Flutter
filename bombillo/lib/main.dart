import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Mi bombillo"),
            backgroundColor: Colors.grey[900],
          ),
          backgroundColor: Colors.grey[700],
          body: Center(
            child: Image.asset('assets/bombillo.png'),
          ),
        ),
      ),
    ));
