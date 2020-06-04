import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/model/result.dart';

abstract class MovieRepository {
  Stream<Result<List<Movie>>> getMovie();
}

abstract class MovieUsecase{
  Stream<Result<List<Movie>>> getMovie();
}
class MovieUsecaseImpl implements MovieUsecase{
  final MovieRepository _repository;

  MovieUsecaseImpl(this._repository);

  @override
  Stream<Result<List<Movie>>> getMovie() {
  return _repository.getMovie();
  }

}