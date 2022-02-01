import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import 'database/database.dart';

class NotificationTimer {
  final box = GetStorage('MyStorage');

  DateTime? dateTime;
  String? id;

  setTimerOnTime(String notificationTime, DateTime time) async {
    DateTime nowTime = (DateTime.now());
    dateTime = DateTime.parse(box.read(notificationTime));
    if (dateTime!.isAfter(nowTime)) {
      print('time check=======');
      await DatabaseService().getDocId(time);
      box.write(notificationTime, time.toString());
    }
  }
}
