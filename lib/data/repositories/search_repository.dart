import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:movie_review/data/hive_models/search_model.dart';
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

  Future getSearchList() async {
    try {
      var box = await Hive.openBox('search');
      var data = box.values.toList();
      if (data.isNotEmpty) {
        return data;
      } else {
        return [];
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future addSearchQuery(SearchModel search) async {
    try {
      var box = await Hive.openBox('search');
      var data = box.values.toList();
      if (data.isEmpty) {
        box.add(search);
      } else if (data.length == 1) {
        if (data[0].query != search.query) {
          box.add(search);
        }
      } else {
        for (int i = 0; i < data.length; i++) {
          if (data[i].query != search.query) {
            box.add(search);
            break;
          }
        }
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future clearAll() async {
    var box = await Hive.openBox('search');
    box.clear();
  }
}
