import 'dart:convert';

import 'package:movie_review/data/models/genre_model.dart';
import 'package:movie_review/data/models/movie_model.dart';
import 'package:movie_review/utils/apis/apis.dart';
import 'package:http/http.dart' as http;

class GenreRepository {
  Future<List<Genre>> getGenreList() async {
    try {
      final url = Uri.parse(API.baseUrl + API.genres);
      final res = await http.get(url);
      List data = jsonDecode(res.body);
      List<Genre> genres = data.map((e) => Genre.fromJson(e)).toList();
      return genres;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<List<Movie>> getMovieByGenre(int id) async {
    try {
      final url = Uri.parse(API.baseUrl + API.genres + "$id/movies");
      final res = await http.get(url);
      List data = jsonDecode(res.body);
      List<Movie> movies = data.map((e) => Movie.fromJson(e)).toList();
      return movies;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
