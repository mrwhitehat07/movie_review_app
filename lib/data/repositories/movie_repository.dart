import 'dart:convert';

import 'package:movie_review/data/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_review/utils/apis/apis.dart';

class MovieRespository {
  Future<List<Movie>> getAllMovies() async {
    try {
      final res = await http.get(Uri.parse(API.baseUrl + API.allMovies));
      List data = jsonDecode(res.body);
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } catch (e) {
      return Future.error(e);
    }
  }
}
