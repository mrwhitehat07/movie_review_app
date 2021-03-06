import 'dart:convert';

import 'package:movie_review/data/models/celebs_model.dart';
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

  Future<List<Movie>> getActionMovies() async {
    try {
      final res = await http.get(Uri.parse(API.baseUrl + API.actionMovies));
      List data = jsonDecode(res.body);
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Celebs>> getAllCelebs() async {
    try {
      final res = await http.get(Uri.parse(API.baseUrl + API.allCelebs));
      List data = jsonDecode(res.body);
      List<Celebs> celebs =
          data.map((celebs) => Celebs.fromJson(celebs)).toList();
      return celebs;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future getMovieById(int id) async {
    try {
      final res =
          await http.get(Uri.parse(API.baseUrl + API.allMovies + "$id"));
      final data = jsonDecode(res.body);
      List crew = data["crew"];
      Movie movie = Movie.fromDetailJson(data);
      List<Celebs> crews = crew.map((e) => Celebs.fromJson(e)).toList();
      return [movie, crews];
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Celebs>> getMovieCrew(int id) async {
    try {
      final res =
          await http.get(Uri.parse(API.baseUrl + API.allMovies + "$id/crew"));
      List data = jsonDecode(res.body);
      List<Celebs> crews = data.map((e) => Celebs.fromJson(e)).toList();
      return crews;
    } catch (e) {
      return Future.error(e);
    }
  }
}
