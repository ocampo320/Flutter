import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/model/result.dart';
import 'dart:async';

import 'package:movieapp/movie_usecase/controller.dart';

abstract class MoviApiSource {
  Future<Result<List<Movie>>> getMovie();
}

abstract class MovieDBSource {
  Future<List<Movie>> getMovie();
}

class MovieRepositoryImpl implements MovieRepository {
  final MoviApiSource _apiSource;
  final MovieDBSource _dbSource;

  MovieRepositoryImpl(this._apiSource, this._dbSource);

  @override
  Stream<Result<List<Movie>>> getMovie() {
    StreamController<Result<List<Movie>>> controller =
        StreamController.broadcast();

    _dbSource.getMovie().then((Movie) async {
      controller.add(Result.loading(Movie));
      var result = await _apiSource.getMovie();
      controller.add(result);
      await controller.close();
    });

    return controller.stream;
  }
}
