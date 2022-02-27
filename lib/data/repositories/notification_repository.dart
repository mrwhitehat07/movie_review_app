import 'dart:convert';

import 'package:movie_review/data/models/notification_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_review/utils/apis/apis.dart';

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
}
