import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //This allows us to convert the returned JSON data into something Dart can u

void main() => runApp(MaterialApp(
        home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Consumo Api"),
          backgroundColor: Colors.grey[900],
        ),
        backgroundColor: Colors.grey[700],
        body: Center(child: const Text('Press the button below!')),
        floatingActionButton: FloatingActionButton(
          onPressed: () => GetCountry('canada'),
        ),
      ),
    )));

Future GetCountry(country) {
  String countryUrl = 'https://restcountries.eu/rest/v2/name/$country';
  http
      .get(countryUrl)
      .then((response) => jsonDecode(response.body)[0]['name'])
      .then((decoded) => print(decoded))
      .catchError((error) => throw (error));
}
