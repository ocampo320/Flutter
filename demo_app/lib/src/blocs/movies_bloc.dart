import 'package:demoapp/src/usecase/movie_UseCaseRepository.dart';
import 'package:demoapp/src/usecase/movie_usecase.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class MoviesBloc extends MovieRepository {
  //arreglar-->
  final _movieUseCaseRepository = MovieUseCaseRepository();

  final _moviesFetcher = PublishSubject<ItemModel>();
  Stream<ItemModel> get allMovies => _moviesFetcher.stream;
  fetchAllMovies() async {
    ItemModel itemModel = await _movieUseCaseRepository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }

  @override
  Future<ItemModel> getMovie() {
    Future<ItemModel> fetchAllMovies() => getMovie();
  }
}

final bloc = MoviesBloc();
