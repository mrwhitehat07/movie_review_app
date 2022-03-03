import 'package:hive/hive.dart';
import 'package:movie_review/data/hive_models/celeb_model.dart';
import 'package:movie_review/data/hive_models/movie_model.dart';
import 'package:movie_review/data/models/celebs_model.dart';
import 'package:movie_review/data/models/movie_model.dart';

class HiveRepository {
  Future addMovies(MovieModel movie) async {
    var box = await Hive.openBox('movie');
    box.add(movie);
  }

  Future addCelebs(CelebsModel movie) async {
    var box = await Hive.openBox('celebs');
    box.add(movie);
  }

  Future getData() async {
    var box1 = await Hive.openBox('movie');
    var box2 = await Hive.openBox('celebs');
    List movie = box1.values.toList();
    List celebs = box2.values.toList();
    return [movie, celebs];
  }

  Future clearAll() async {
    var celeb = await Hive.openBox('celebs');
    var movie = await Hive.openBox('movies');
    celeb.clear();
    movie.clear();
  }
}
