import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_review/data/models/movie_model.dart';
import 'package:movie_review/data/repositories/movie_repository.dart';
import 'package:movie_review/utils/apis/apis.dart';

import 'movie_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("movie tests", () {
    MovieRespository movieRespository = MovieRespository();

    test('return list of movies', () async {
      final client = MockClient();
      when(client
          .get(Uri.parse(API.baseUrl + API.allMovies))
          .then((value) async => http.Response('[]', 200)));

      expect(await movieRespository.getAllMovies(), isA<List<Movie>>());
    });

    // test('return a movie by id', () async {
    //   final client = MockClient();
    //   when(client
    //       .get(Uri.parse(API.baseUrl + API.allMovies + "1"))
    //       .then((value) async => http.Response('{}', 200)));

    //   expect(await movieRespository.getMovieById(1), isA<Movie>());
    // });
  });
}
