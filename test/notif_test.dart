import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_review/data/models/notification_model.dart';
import 'package:movie_review/data/repositories/notification_repository.dart';
import 'package:movie_review/utils/apis/apis.dart';

import 'celebs_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("notif from backend tests", () {

    NotificationRepository notificationRepository = NotificationRepository();

    test('return list of celebs', () async {
      final client = MockClient();
      when(client
          .get(Uri.parse(API.baseUrl + API.notificationUrl))
          .then((value) async => http.Response('[]', 200)));

      expect(await notificationRepository.getNotifications(), isA<List<Notification>>());
    });
  });
}
