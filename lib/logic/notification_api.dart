import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        'channel description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future init({bool initSheduled = true}) async {
    final iOS = IOSInitializationSettings();
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final settings = InitializationSettings(android: android, iOS: iOS);
    tz.initializeTimeZones();
    await _configureLocalTimeZone();
    await _notifications.initialize(settings);
    //_notifications.periodicallyShow(id, title, body, repeatInterval, notificationDetails)
  }

  static Future showNotification() async {
    await _notifications.show(
        0, 'Good Day', 'У вас новое сообщение!', await _notificationDetails());
  }

  static Future _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));
  }

  static bool _canShowNotification(DateTime time) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime.from(time, tz.local);
    if (scheduledDate.isAfter(now)) {
      return true;
    }
    return false;
  }

  static Future showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    //required String time,
    required DateTime dateTime,
    //required DateTime scheduledDate,
  }) async {
    if (_canShowNotification(tz.TZDateTime.from(dateTime, tz.local))) {
      await _notifications.zonedSchedule(
        id,
        title,
        body,
        //_nextInstanceOfTenAM(time),
        //tz.TZDateTime.from(dateTime.difference(DateTime.now()), tz.local),

        tz.TZDateTime.now(tz.local).add(dateTime.difference(DateTime.now())),
        await _notificationDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
      );
    }
  }

  initNotification(GetStorage box) {
    NotificationApi.init();
    DateTime dateTimeOne = DateTime.parse(box.read('dateTimeOne'));
    DateTime dateTimeTwo = DateTime.parse(box.read('dateTimeTwo'));
    DateTime dateTimeThree = DateTime.parse(box.read('dateTimeThree'));
    NotificationApi.showScheduledNotification(
      title: 'Good Day',
      body: 'У вас новое сообщение!',
      dateTime: dateTimeOne,
    );
    NotificationApi.showScheduledNotification(
      title: 'Good Day',
      body: 'У вас новое сообщение!',
      dateTime: dateTimeTwo,
    );
    NotificationApi.showScheduledNotification(
      title: 'Good Day',
      body: 'У вас новое сообщение!',
      dateTime: dateTimeThree,
    );
  }
}
