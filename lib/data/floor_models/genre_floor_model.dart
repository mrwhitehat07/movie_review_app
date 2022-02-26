// import 'package:floor/floor.dart';

// @dao
// abstract class GenreDao {
//   @Query('SELECT * FROM GenreFloor')
//   Future<List<GenreFloor>> getAllGenres();

//   @Query('SELECT * FROM GenreFloor WHERE id = :id')
//   Stream<GenreFloor?> getGenreById(int id);

//   @insert
//   Future<void> insertGenre(GenreFloor genre);

//   @delete
//   Future<void> deleteGenre(GenreFloor genre);
// }

// @entity
// class GenreFloor {
//   @primaryKey
//   final int? id;
//   final String? title;
  
//   GenreFloor({
//     this.id,
//     this.title,
//   });
// }
