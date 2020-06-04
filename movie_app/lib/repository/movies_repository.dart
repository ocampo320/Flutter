import 'package:movieapp/model/movie_model.dart';

abstract class movieRepository {
  Future<Movie> fetchNowPlayingMovies();
  Movie getMoviesByID(String id);
}
