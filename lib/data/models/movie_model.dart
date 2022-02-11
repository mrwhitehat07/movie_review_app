
class Movie {
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

  Movie({
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

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json["id"],
        name: json["title"],
        poster: json["poster"],
        releaseDate: json["release_date"]);
  }

  factory Movie.fromDetailJson(Map<String, dynamic> json) {
    return Movie(
      id: json["id"],
      name: json["title"],
      poster: json["poster"],
      trailer: json["trailer"],
      releaseDate: json["release_date"],
      genres: List<String>.from(json["genre"]),
      description: (json["description"] != null) ? json["description"] : "",
      crew: json["crew"],
      director: json["director"],
      producer: json["producer"],
    );
  }
}
