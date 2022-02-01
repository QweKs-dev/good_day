import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:good_day/logic/user_parameters.dart';

import 'database/database.dart';
import 'notification_api.dart';

class MainFunction extends ChangeNotifier {
  void onSaveButtonTap(
    TextEditingController? userName,
    String? languageChooise,
    DateTime firstNotification,
    DateTime secondNotification,
    DateTime thirdNotification,
    DateTime date,
  ) {
    //настройка singleton'а
    UserParams userParams = UserParams();

    userParams.userName =
        userName!.text.isEmpty ? 'Пользователь' : userName.text;

    userParams.language = languageChooise;

    userParams.firstNotification = firstNotification;
    userParams.secondNotification = secondNotification;
    userParams.thirdNotification = thirdNotification;

    userParams.birstday = date;
  }
}
