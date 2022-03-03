import 'dart:convert';

import 'package:movie_review/data/models/review_model.dart';
import 'package:movie_review/utils/apis/apis.dart';
import 'package:http/http.dart' as http;

class ReviewRepository {
  Future<List<Review>> getReviews(int id) async {
    try {
      final url = Uri.parse(API.baseUrl + '/movie/$id/reviews');
      final res = await http.get(url);

      List data = jsonDecode(res.body);
      List<Review> reviews =
          data.map((e) => Review.fromJson(e['review'])).toList();

      return reviews;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<String> rateReviewMovie(int id, Review review, String token) async {
    try {
      final url = Uri.parse(API.baseUrl + '/movie/$id/reviews/post');
      Map<String, dynamic> data = {
        "rating": review.rating!.toString(),
        "review": review.review,
      };
      final res = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $token",
        },
        body: data,
      );
      print(res.body);
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
