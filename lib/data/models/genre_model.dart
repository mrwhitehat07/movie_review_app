class Genre {
  final int? id;
  final String? title;

  Genre({
    this.id,
    this.title,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      title: json['title'],
    );
  }
}
