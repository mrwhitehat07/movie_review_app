import 'package:movie_review/data/models/crew_model.dart';

class Movie {
  final int? id;
  final String? name;
  final String? releaseDate;
  final String? poster;
  final String? trailer;
  final List<String>? genres;
  final List<Crew>? crew;

  Movie({
    this.id,
    this.name,
    this.releaseDate,
    this.poster,
    this.trailer,
    this.genres,
    this.crew,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json["id"],
      name: json["title"],
      poster: json["poster"],
      releaseDate: json["release_date"]
    );
  }

  factory Movie.fromDetailJson(Map<String, dynamic> json) {
    return Movie(
      id: json["id"],
      name: json["title"],
      poster: json["poster"],
      trailer: json["trailer"],
      releaseDate: json["release_date"],
      genres: json["genre"],
      crew: json["crew"]
    );
  }

}
