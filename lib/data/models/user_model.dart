class User {
  final String? username;
  final String? email;
  final String? password;
  final String? accessToken;
  final String? message;

  User({
    this.username,
    this.email,
    this.password,
    this.accessToken,
    this.message,
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
}
