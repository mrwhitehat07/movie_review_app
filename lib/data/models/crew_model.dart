class Crew {
  final int? id;
  final String? fname;
  final String? lname;
  final String? image;
  final String? role;

  Crew({this.id, this.fname, this.lname, this.image, this.role});

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      id: json["id"],
      fname: json["fname"],
      lname: json["lname"],
      image: json['image'],
      role: json["role"],
    );
  }
}
