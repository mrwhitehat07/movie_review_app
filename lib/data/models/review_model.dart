class Review {
  final int? id;
  final double? rating;
  final String? review;
  final String? timestamp;

  Review({
    this.id,
    this.rating,
    this.review,
    this.timestamp,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      rating: json['rating'],
      review: json['review'],
      timestamp: json['timestamp'],
    );
  }
}
