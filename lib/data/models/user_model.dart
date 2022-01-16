class User {
  final String? username;
  final String? email;
  final String? password;
  final String? accessToken;

  User({
    this.username,
    this.email,
    this.password,
    this.accessToken,
  });

  Map<String, dynamic> toJsonLogin(User user) {
    return {
      "email": user.email,
      "password": user.password,
    };
  }
}
