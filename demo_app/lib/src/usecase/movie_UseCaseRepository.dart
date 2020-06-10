import 'dart:async';
import 'movie_usecase.dart';
import '../models/item_model.dart';


class MovieUseCaseRepository extends MovieUseCaseImpl {
  Future<ItemModel> fetchAllMovies() => getMovie();
}
