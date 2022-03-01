import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_review/data/models/review_model.dart';
import 'package:movie_review/data/repositories/review_repository.dart';
import 'package:movie_review/utils/apis/apis.dart';

import 'celebs_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("reviews from backend tests", () {

    ReviewRepository reviewRepository = ReviewRepository();

    test('return list of reviews', () async {
      final client = MockClient();
      when(client
          .get(Uri.parse(API.baseUrl + API.allMovies + "/1/reviews"))
          .then((value) async => http.Response('[]', 200)));

      expect(await reviewRepository.getReviews(1), isA<List<Review>>());
    });
  });
}
