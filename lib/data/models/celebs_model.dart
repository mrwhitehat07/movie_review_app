class Celebs {
  final int? id;
  final String? fname;
  final String? lname;
  final String? image;
  final String? dob;
  final String? bio;
  final List<String>? role;

  Celebs({this.id, this.fname, this.lname, this.dob, this.image, this.role, this.bio,});

  factory Celebs.fromJson(Map<String, dynamic> json) {
    return Celebs(
      id: json["id"],
      fname: json["fname"],
      lname: json["lname"],
      dob: json["dob"],
      image: json['image'],
      // bio: json['bio'],
      // role: List<String>.from(json["role"]),
    );
  }

  factory Celebs.fromDetailJson(Map<String, dynamic> json) {
    return Celebs(
      id: json["id"],
      fname: json["fname"],
      lname: json["lname"],
      dob: json["dob"],
      image: json['image'],
      bio: json['bio'],
      role: List<String>.from(json["role"]),
    );
  }
}
