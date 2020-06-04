import 'package:movieapp/bloc/provider/bloc.dart';
import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/model/result.dart';
import 'package:movieapp/movie_usecase/controller.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc extends Bloc {
  final MovieUsecase _movieUsecase;

  MovieBloc(this._movieUsecase);

  final _movieSubject = BehaviorSubject<List<Movie>>();

  ValueStream<List<Movie>> get movies => _movieSubject.stream;

  Stream<Result<List<Movie>>> getMovie() {
    var result = _movieUsecase.getMovie();
    result.listen((result) {
      if (result.data != null &&
          (result.status != Status.error || !result.data.isEmpty)) {}
    });

    return result;
  }

  @override
  void dispose() {
    _movieSubject?.close();
  }
}
