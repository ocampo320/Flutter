import 'package:demoarquitectura1/modelo/movie_modelo.dart';

abstract class Repository {
  Future<Movie> getAllMovie();
}
