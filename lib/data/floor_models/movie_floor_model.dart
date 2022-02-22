import 'package:floor/floor.dart';

@dao
abstract class MovieDao {
  @Query('SELECT * FROM MovieFloor')
  Future<List<MovieFloor>> getAllMovies();

  @Query('SELECT * FROM MovieFloor WHERE id = :id')
  Stream<MovieFloor?> getMovieById(int id);

  @insert
  Future<void> insertMovie(MovieFloor movie);

  @delete
  Future<void> deleteMovie(MovieFloor movie);
}

@entity
class MovieFloor {
  @primaryKey
  final int? id;
  final String? name;
  final String? releaseDate;
  final String? poster;
  final String? trailer;
  final List<String>? genres;
  final List? crew;
  final String? description;
  final String? director;
  final String? producer;

  MovieFloor({
    this.id,
    this.name,
    this.releaseDate,
    this.poster,
    this.trailer,
    this.genres,
    this.crew,
    this.description,
    this.director,
    this.producer,
  });
}
