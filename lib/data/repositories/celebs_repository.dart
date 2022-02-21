import 'dart:convert';

import 'package:movie_review/data/models/celebs_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_review/data/models/movie_model.dart';
import 'package:movie_review/utils/apis/apis.dart';

class CelebsRespository {
  Future<Celebs> getCelebsById(int id) async {
    try {
      final res =
          await http.get(Uri.parse(API.baseUrl + API.allCelebs + "$id"));
      final data = jsonDecode(res.body);
      Celebs celebs = Celebs.fromDetailJson(data);
      return celebs;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Movie>> getCelebsMovies(int id) async {
    try {
      final res =
          await http.get(Uri.parse(API.baseUrl + API.allCelebs + "$id/movies"));
      List data = jsonDecode(res.body);
      List<Movie> movies = data.map((e) => Movie.fromJson(e)).toList();
      return movies;
    } catch (e) {
      return Future.error(e);
    }
  }
}
