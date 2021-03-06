class User {
  final int? id;
  final String? username;
  final String? email;
  final String? password;
  final String? accessToken;
  final String? message;
  final String? fname;
  final String? lname;
  final int? phone;
  final String? avatar;

  User({
    this.id,
    this.username,
    this.email,
    this.password,
    this.accessToken,
    this.message,
    this.fname,
    this.lname,
    this.phone,
    this.avatar,
  });

  Map<String, dynamic> toJsonLogin(User user) {
    return {
      "email": user.email,
      "password": user.password,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      accessToken: json["access_token"],
      message: json["messsage"],
    );
  }

  factory User.fromProfileJson(Map<String, dynamic> json) {
    return User(
        id: (json['id'] != null) ? json['id'] : 0,
        fname: json['fname'],
        lname: json['lname'],
        phone: json['phone'],
        avatar: json['avatar']);
  }

  factory User.fromReviewUser(Map<String, dynamic> json) {
    return User(
        username: json['username'],
    );
  }
}
