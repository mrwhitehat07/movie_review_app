class Celebs {
  final int? id;
  final String? fname;
  final String? lname;
  final String? image;
  final String? dob;
  final List<String>? role;

  Celebs({this.id, this.fname, this.lname, this.dob, this.image, this.role});

  factory Celebs.fromJson(Map<String, dynamic> json) {
    return Celebs(
      id: json["id"],
      fname: json["fname"],
      lname: json["lname"],
      dob: json["dob"],
      image: json['image'],
      role: List<String>.from(json["role"]),
    );
  }
}
