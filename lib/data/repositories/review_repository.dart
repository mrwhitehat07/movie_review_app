import 'dart:convert';

import 'package:movie_review/data/models/review_model.dart';
import 'package:movie_review/data/models/user_model.dart';
import 'package:movie_review/utils/apis/apis.dart';
import 'package:http/http.dart' as http;

class ReviewRepository {
  Future<List> getReviews(int id) async {
    try {
      final url = Uri.parse(API.baseUrl + '/movie/$id/reviews');
      final res = await http.get(url);

      List data = jsonDecode(res.body);
      List<Review> reviews =
          data.map((e) => Review.fromJson(e['review'])).toList();
      List<User> user =
          data.map((e) => User.fromProfileJson(e['user'])).toList();
      return [reviews, user];
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future rateReview(int id, double value, String review, String token) async {
    try {
    final url = Uri.parse(API.baseUrl + '/movie/$id/reviews/post/');
    Map data = {"rating": value, "review": review};
    final res = await http
        .post(url, body: data, headers: {"Authorization": "Bearer $token"});
    if (res.statusCode == 200) {
      return "success";
    } else {
      return "failed";
    }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
