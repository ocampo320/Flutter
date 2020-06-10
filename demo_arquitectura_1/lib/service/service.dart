import 'dart:convert';

import 'package:demoarquitectura1/modelo/movie_modelo.dart';
import 'package:demoarquitectura1/repository/repository.dart';
import 'package:http/http.dart' as http;

class service implements Repository {
  final _apiKey = '56577d971106a140a0034ec137ad89f1';
  @override
  Future<Movie> getAllMovie() async {
    print("conectado");
    final response = await http
        .get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}

final servicice = service();
