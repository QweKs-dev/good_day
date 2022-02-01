import 'dart:isolate';

import 'package:android_alarm_manager/android_alarm_manager.dart';

import 'notification_api.dart';

class Alarm {
  static const int _id = 1;
  static const int _idPer = 2;
  final ReceivePort port = ReceivePort();
  static void cancelAlarmNotific() {
    AndroidAlarmManager.cancel(_id);
    AndroidAlarmManager.cancel(0);
    AndroidAlarmManager.cancel(_idPer);
  }

  static void cancelAlarmNotificShot() {
    AndroidAlarmManager.cancel(_id);
  }

  static void setNotificAlarm(Duration duration) {
    print('==one shot==');
    AndroidAlarmManager.oneShot(
      duration,
      _id,
      notific,
      rescheduleOnReboot: true,
    );
  }

  static void startPeriodic() {
    print('===periodic===');
    AndroidAlarmManager.periodic(
      Duration(hours: 24),
      _id,
      notific,
      rescheduleOnReboot: true,
    );
  }
}

void notific() {
  NotificationApi.showNotification();
  Alarm.cancelAlarmNotificShot();

  print('periodic is start =!!= ${DateTime.now()}');
  Alarm.startPeriodic();
}
