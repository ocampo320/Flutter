import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

Client client = Client();
final _apiKey = '56577d971106a140a0034ec137ad89f1';

abstract class MovieRepository {
  Future<ItemModel> getMovie();
}

abstract class MovieUseCase {
  Future<ItemModel> getMovie();
}

class MovieUseCaseImpl implements MovieUseCase {
  @override
  Future<ItemModel> getMovie() async {
    print("conectado");
    final response = await client
        .get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
