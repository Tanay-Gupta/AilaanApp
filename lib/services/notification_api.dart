import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  static final _notifiations = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'It alerts user about upcoming contest',
        'Contest Alert',
        enableLights: true,
        icon: '@mipmap/notif',
        showWhen: true,
        importance: Importance.max,
        styleInformation: BigTextStyleInformation(''),
      ),
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    _notifiations.show(
      id,
      title,
      body,
      await _notificationDetails(),
      payload: payload,
    );
  }

  static Future showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    var schedule,
  }) async {
    // ignore: deprecated_member_use
    _notifiations.schedule(
        id, title, body, schedule, await _notificationDetails());
  }
}
