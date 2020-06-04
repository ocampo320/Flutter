import 'dart:convert';

import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/model/tmdb.dart';

import 'movies_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class movieRepositoryImpl implements movieRepository {
  @override
  Future<Movie> fetchNowPlayingMovies() async {
    var response = await http.get(Tmdb.nowPlayingUrl);
    var decodeJson = jsonDecode(response.body);
    Movie.fromJson(decodeJson);
    print(decodeJson);
  }

  @override
  Movie getMoviesByID(String id) {
    // TODO: implement getMoviesByID
    throw UnimplementedError();
  }
}
