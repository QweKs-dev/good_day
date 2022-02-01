import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class UserParams {
  static final UserParams _singleton = UserParams._();

  factory UserParams() {
    return _singleton;
  }

  UserParams._();

  String? language;
  String? userName;
  DateTime? firstNotification;
  DateTime? secondNotification;
  DateTime? thirdNotification;

  DateTime? birstday;
}

class UserParamsFunction {
  final box = GetStorage('MyStorage');
  void saveUserParams(
      String? valueChoose,
      TextEditingController? textEditingControllerName,
      DateTime dateTimeOne,
      DateTime dateTimeTwo,
      DateTime dateTimeThree,
      DateTime date) {
    box.write('valueChoose', valueChoose);
    box.write('textEditingControllerName', textEditingControllerName!.text);
    box.write('dateTimeOne', dateTimeOne.toString());
    box.write('dateTimeTwo', dateTimeTwo.toString());
    box.write('dateTimeThree', dateTimeThree.toString());
    box.write('date', date.toString());
  }

  void setUserParamsFromStorage(
      String? valueChoose,
      TextEditingController? textEditingControllerName,
      DateTime dateTimeOne,
      DateTime dateTimeTwo,
      DateTime dateTimeThree,
      DateTime date) {
    valueChoose = box.read('valueChoose');
    textEditingControllerName!.text = box.read('textEditingControllerName');
    dateTimeOne = DateTime.parse(box.read('dateTimeOne'));
    dateTimeTwo = DateTime.parse(box.read('dateTimeTwo'));
    dateTimeThree = DateTime.parse(box.read('dateTimeThree'));
    date = DateTime.parse(box.read('date'));
  }

  void setUserParams() {
    UserParams().userName = box.read('textEditingControllerName');
    UserParams().language = box.read('valueChoose');
    UserParams().firstNotification = DateTime.parse(box.read('dateTimeOne'));
    UserParams().secondNotification = DateTime.parse(box.read('dateTimeTwo'));
    UserParams().thirdNotification = DateTime.parse(box.read('dateTimeThree'));
    UserParams().birstday = DateTime.parse(box.read('date'));
  }
}
