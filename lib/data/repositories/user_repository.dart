import 'dart:convert';

import 'package:movie_review/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_review/utils/apis/apis.dart';

class UserRepository {
  Future login(User user) async {
    final url = Uri.parse(API.baseUrl + API.loginUrl);
    final res = await http.post(url, body: {
      "email": user.email,
      "password": user.password,
    });
    final data = jsonDecode(res.body);
    User userd = User.fromJson(data);
    print(userd.accessToken);
    return userd;
  }
}
