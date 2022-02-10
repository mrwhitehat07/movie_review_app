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

  Future<Movie> getMovieById(int id) async {
    try {
      final res =
          await http.get(Uri.parse(API.baseUrl + API.allMovies + "$id"));
      final data = jsonDecode(res.body);
      print("json");
      print(data);
      Movie movie = Movie.fromDetailJson(data);
      print("dart");
      print(movie);
      return movie;
    } catch (e) {
      return Future.error(e);
    }
  }
}
