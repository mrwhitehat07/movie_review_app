import 'package:movie_review/data/models/user_model.dart';

class Review {
  final int? id;
  final String? rating;
  final String? review;
  final String? timestamp;
  final User? user;

  Review({
    this.id,
    this.rating,
    this.review,
    this.timestamp,
    this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      rating: json['rating'],
      review: json['review'],
      timestamp: json['timestamp'],
      user: User.fromReviewUser(json['user']),
    );
  }
}
