import 'dart:convert';

import 'package:movie_review/data/models/notification_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_review/utils/apis/apis.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationRepository {
  Future<List<Notification>> getNotifications() async {
    try {
      final url = Uri.parse(API.baseUrl + API.notificationUrl);
      var res = await http.get(url);
      List data = jsonDecode(res.body);
      List<Notification> notif =
          data.map((e) => Notification.fromJson(e)).toList();
      return notif;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  void notify() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 3,
          channelKey: 'key1',
          title: 'Just a notification',
          body: 'You just added a new blog',
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture:
              'https://images.idgesg.net/images/article/2019/01/android-q-notification-inbox-100785464-large.jpg?auto=webp&quality=85,70'),
    );
  }
}
