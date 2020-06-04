import 'file:///C:/Users/deibi.ocampo/Desktop/ESCRITORIO/flutter/movie_app/lib/data_source/api/api_base_source.dart';
import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/model/result.dart';
import 'package:movieapp/model/tmdb.dart';
import 'package:movieapp/repository/movie_repository.dart';
import 'package:movieapp/utils/connectivity/my_connectivity.dart';
import 'package:http/http.dart' as http;

class MovieApiSourceImpl extends ApiBaseSource implements MoviApiSource {

  MovieApiSourceImpl(String baseUrl, MyConnectivity connectivity,
      {http.Client client, String token})
      : super(baseUrl, client, connectivity, token);

  @override
  Future<Result<List<Movie>>> getMovie() {
    var url = Tmdb.baseUrl;
    return get<List<Movie>>(url, (value) {
      return (value as List).map((value) {
        return Movie.fromJson(value);
      });
    });

  }
}
