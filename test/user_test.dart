import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_review/data/models/user_model.dart';
import 'package:movie_review/data/repositories/user_repository.dart';
import 'package:movie_review/utils/apis/apis.dart';

import 'user_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("userTests", () {
      UserRepository userRepository = UserRepository();

    test('return token with success message if login succeed', () async {
      final client = MockClient();
      when(client.post(Uri.parse(API.baseUrl + API.loginUrl), body: {
        "email": "mbishal605@gmail.com",
        "password": "bishal",
      }).then((value) async => http.Response('{}', 200)));

      expect(
          await userRepository
              .login(User(email: 'mbishal605@gmail.com', password: 'bishal')),
          isA<User>());
    });
  });
}
