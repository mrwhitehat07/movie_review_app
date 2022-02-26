import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_review/data/models/celebs_model.dart';
import 'package:movie_review/data/repositories/celebs_repository.dart';
import 'package:movie_review/data/repositories/movie_repository.dart';
import 'package:movie_review/utils/apis/apis.dart';

import 'celebs_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("movie tests", () {

    CelebsRespository celebsRespository = CelebsRespository();
    MovieRespository movieRespository = MovieRespository();

    test('return list of celebs', () async {
      final client = MockClient();
      when(client
          .get(Uri.parse(API.baseUrl + API.allCelebs))
          .then((value) async => http.Response('[]', 200)));

      expect(await movieRespository.getAllCelebs(), isA<List<Celebs>>());
    });

    test('return a celebs by id', () async {
      final client = MockClient();
      when(client
          .get(Uri.parse(API.baseUrl + API.allCelebs + "1"))
          .then((value) async => http.Response('{}', 200)));

      expect(await celebsRespository.getCelebsById(1), isA<Celebs>());
    });
  });
}
