import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:movie_review/data/models/profile_options_model.dart';
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
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body)["profile"];
        User userd = User.fromProfileJson(data);
        return userd;
      } else {
        return Future.error("Error occurred");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<String> changePassword(
      String token, String curPassword, String newPass, String confPass) async {
    try {
      Map<String, String> headers = {"Authorization": "Bearer $token"};
      Map data = {
        "currentPassword": curPassword,
        "newPassword": newPass,
        "validatePassword": confPass,
      };
      final url = Uri.parse(API.baseUrl + API.changePassword);
      final res = await http.post(url, headers: headers, body: data);
      if (res.statusCode == 200) {
        return res.body;
      } else {
        return res.body;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<String> updateUser(
    String token, {
    String? fname,
    String? lname,
    int? phone,
    File? image,
  }) async {
    try {
      Map<String, String> headers = {"Authorization": "Bearer $token"};
      final datas = <String, dynamic>{};
      if (fname != "") {
        datas['fname'] = fname!;
      }
      if (lname != "") {
        datas['lname'] = lname!;
      }
      if (phone != 0) {
        datas['phone'] = phone;
      }
      if (image != null) {
        datas['avatar'] =
            await http.MultipartFile.fromPath('avatar', image.path);
      }
      var data = FormData.fromMap(datas);
      print(data.fields);
      Dio dio = Dio();
      final url = API.baseUrl + API.updateProfile;
      final res =
          await dio.post(url, options: Options(headers: headers), data: data);
      print(res);
      if (res.statusCode == 200) {
        return res.data;
      } else {
        return res.data;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
