import 'dart:convert';

import 'package:movie_review/data/models/celebs_model.dart';
import 'package:movie_review/data/models/movie_model.dart';
import 'package:movie_review/utils/apis/apis.dart';
import 'package:http/http.dart' as http;

class SearchRepository {
  Future searchMovie(String query) async {
    try {
      final url = Uri.parse(API.baseUrl + API.searchUrl + query);
      final res = await http.get(url);
      final data = jsonDecode(res.body);
      List movie = data["movie"];
      List celeb = data["celebs"];
      List<Movie> movies = movie.map((e) => Movie.fromJson(e)).toList();
      List<Celebs> celebs = celeb.map((e) => Celebs.fromJson(e)).toList();
      return [movies, celebs];
    } catch (e) {
      return Future.error(e.toString());
    }
  }

}
