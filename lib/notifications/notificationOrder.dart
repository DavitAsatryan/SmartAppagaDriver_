import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationOrder {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationDetalis() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
          'channel id', 'channel name', 'channel description',
          importance: Importance.max),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future showNotification({
    int? id,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    _notifications.show(id, title, body, await _notificationDetalis(),
        payload: payLoad);
  }
}
