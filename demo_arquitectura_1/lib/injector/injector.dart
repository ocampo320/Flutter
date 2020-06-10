import 'dart:developer';

import 'package:demoarquitectura1/modelo/movie_modelo.dart';


abstract class Injector {

  Future<Movie> inject(Service service);
}
