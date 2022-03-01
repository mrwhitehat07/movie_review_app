import 'package:hive/hive.dart';
import 'package:movie_review/data/models/movie_model.dart';

class HiveRepository {
  Future addMovies(Movie movie) async {
    var box = await Hive.openBox('movie');
    box.add(movie);
  }

    Future addCelebs(Movie movie) async {
    var box = await Hive.openBox('celebs');
    box.add(movie);
  }

  Future clearAll() async {
    var celeb = await Hive.box('celebs');
    var movie = await Hive.box('movies');
    celeb.clear();
    movie.clear();
  }
}
