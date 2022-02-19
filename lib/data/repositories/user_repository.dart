import 'dart:convert';

import 'package:movie_review/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_review/data/repositories/secure_storage.dart';
import 'package:movie_review/utils/apis/apis.dart';

class UserRepository {
  Future<User> login(User user) async {
    try {
      final url = Uri.parse(API.baseUrl + API.loginUrl);
      final res = await http.post(
        url,
        body: {
          "email": user.email,
          "password": user.password,
        },
      );
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        User userd = User.fromJson(data);
        await TokenStorage.saveToken(userd.accessToken!);
        return userd;
      } else {
        return Future.error("Error occurred");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<User> register(User user) async {
    try {
      final url = Uri.parse(API.baseUrl + API.registerUrl);
      final res = await http.post(url, body: {
        "username": user.username,
        "email": user.email,
        "password": user.password,
      });
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        User userd = User.fromJson(data);
        return userd;
      } else {
        return Future.error("Error occurred");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future logout() async {
    await TokenStorage.deleteToken();
    return "Logged out";
  }

  Future<User> getUser(String token) async {
    try {
      Map<String, String> headers = {"Authorization": "Bearer $token"};
      final url = Uri.parse(API.baseUrl + API.profileUrl);
      final res = await http.get(url, headers: headers);
      print(res.body);
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body)["profile"];
        print(res.body);
        User userd = User.fromProfileJson(data);
        print(userd);
        return userd;
      } else {
        return Future.error("Error occurred");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
