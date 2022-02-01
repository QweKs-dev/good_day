import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:good_day/components/row_of_textbutton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:good_day/components/utils.dart';
import 'package:good_day/logic/main_function.dart';
import 'package:good_day/logic/notification_api.dart';
import 'package:good_day/logic/timer_for_notification.dart';
import 'package:good_day/logic/user_parameters.dart';
import 'package:good_day/screens/main_screen/main_screen.dart';
import 'package:good_day/screens/pay_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final box = GetStorage('MyStorage');

  dynamic languageItemList = [
    'Русский',
    'Беларуссий',
    'English',
    'Franch',
    'Polsci'
  ];
  String? valueChoose = UserParams().language;
  bool? isFirstStart;

  TextEditingController? textEditingControllerName =
      TextEditingController(text: UserParams().userName);

  DateTime dateTimeOne = UserParams().firstNotification ?? DateTime.now();
  DateTime dateTimeTwo = UserParams().secondNotification ?? DateTime.now();
  DateTime dateTimeThree = UserParams().thirdNotification ?? DateTime.now();

  DateTime date = UserParams().birstday ?? DateTime.now();

  Widget buildTimePickerOne() => SizedBox(
        height: 260.sp,
        width: 350.sp,
        child: CupertinoDatePicker(
          use24hFormat: true,
          mode: CupertinoDatePickerMode.time,
          initialDateTime: dateTimeOne,
          onDateTimeChanged: (dateTime) {
            setState(() {
              dateTimeOne = DateTime(DateTime.now().year, DateTime.now().month,
                  DateTime.now().day, dateTime.hour, dateTime.minute);
            });
          },
        ),
      );

  Widget buildTimePickerTwo() => SizedBox(
        height: 260.sp,
        width: 350.sp,
        child: CupertinoDatePicker(
          use24hFormat: true,
          mode: CupertinoDatePickerMode.time,
          initialDateTime: dateTimeTwo,
          onDateTimeChanged: (dateTime) {
            setState(() {
              dateTimeTwo = DateTime(DateTime.now().year, DateTime.now().month,
                  DateTime.now().day, dateTime.hour, dateTime.minute);
            });
          },
        ),
      );
  Widget buildTimePickerThree() => SizedBox(
        height: 260.sp,
        width: 350.sp,
        child: CupertinoDatePicker(
          use24hFormat: true,
          mode: CupertinoDatePickerMode.time,
          initialDateTime: dateTimeThree,
          onDateTimeChanged: (dateTime) {
            setState(() {
              dateTimeThree = DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                dateTime.hour,
                dateTime.minute,
              );
            });
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(0, 0, 0, 0.04), BlendMode.darken),
              image: AssetImage('assets/images/background_main.png'),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _LogoWidget(),
                Padding(
                  padding: EdgeInsets.only(left: 25.sp, top: 34.sp),
                  child: Text(
                    'ЯЗЫК',
                    style: TextStyle(
                        fontFamily: 'Open Sans Bold',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: Color.fromRGBO(50, 63, 75, 1),
                        letterSpacing: 1.5.sp),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 7.sp, left: 16.sp, right: 16.sp),
                  child: Container(
                    padding: EdgeInsets.only(left: 18.sp, right: 20.sp),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(126, 235, 234, 1)),
                        borderRadius: BorderRadius.circular(8.sp),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.14),
                            spreadRadius: 5.sp,
                            blurRadius: 7.sp,
                            offset: Offset(6.sp, 6.sp),
                          )
                        ]),
                    child: DropdownButton(
                      hint: Text(
                        'Выберите язык',
                        style: TextStyle(
                          fontFamily: 'Open Sans Regular',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: Color.fromRGBO(50, 63, 75, 1),
                        ),
                      ),
                      value: valueChoose,
                      dropdownColor: Colors.white,
                      icon: SvgPicture.asset(
                          'assets/components/drop_down_arrow.svg'),
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                        color: Color.fromRGBO(50, 63, 75, 1),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          valueChoose = newValue!;
                        });
                      },
                      items: languageItemList
                          .map<DropdownMenuItem<String>>((String valueItem) {
                        return DropdownMenuItem<String>(
                          value: valueItem,
                          child: Text(valueItem.toString(),
                              style: TextStyle(
                                  fontFamily: 'Open Sans Regular',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                  color: Color.fromRGBO(50, 63, 75, 1))),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.sp, top: 26.sp),
                  child: Text(
                    'ВВЕДИТЕ ВАШЕ ИМЯ',
                    style: TextStyle(
                        fontFamily: 'Open Sans Bold',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: Color.fromRGBO(50, 63, 75, 1),
                        letterSpacing: 1.5.sp),
                  ),
                ),
                _NameFieldWidget(controller: textEditingControllerName),
                Padding(
                  padding: EdgeInsets.only(left: 25.sp, top: 26.sp),
                  child: Text(
                    'ВРЕМЯ УВЕДОМЛЕНИЙ',
                    style: TextStyle(
                        fontFamily: 'Open Sans Bold',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromRGBO(50, 63, 75, 1),
                        letterSpacing: 1.5.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 7.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Utils.showSheet(
                            context,
                            child: buildTimePickerOne(),
                            onClicked: () {
                              Navigator.pop(context);
                            },
                          );
                        },
                        child: Container(
                          width: 121.w,
                          height: 48.h,
                          padding: EdgeInsets.only(left: 16.sp, right: 9.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.14),
                                  spreadRadius: 5.sp,
                                  blurRadius: 7.sp,
                                  offset: Offset(6.sp, 6.sp),
                                )
                              ]),
                          child: Center(
                              child: Text(
                                  '${dateTimeOne.hour.toString()}:${dateTimeOne.minute.toString()}')),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Utils.showSheet(
                            context,
                            child: buildTimePickerTwo(),
                            onClicked: () {
                              Navigator.pop(context);
                            },
                          );
                        },
                        child: Container(
                          width: 121.w,
                          height: 48.h,
                          padding: EdgeInsets.only(left: 16.sp, right: 9.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.14),
                                  spreadRadius: 5.sp,
                                  blurRadius: 7.sp,
                                  offset: Offset(6.sp, 6.sp),
                                )
                              ]),
                          child: Center(
                              child: Text(
                                  '${dateTimeTwo.hour.toString()}:${dateTimeTwo.minute.toString()}')),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Utils.showSheet(
                            context,
                            child: buildTimePickerThree(),
                            onClicked: () {
                              Navigator.pop(context);
                            },
                          );
                        },
                        child: Container(
                          width: 121.w,
                          height: 48.h,
                          padding: EdgeInsets.only(left: 16.sp, right: 9.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.14),
                                  spreadRadius: 5.sp,
                                  blurRadius: 7.sp,
                                  offset: Offset(6.sp, 6.sp),
                                )
                              ]),
                          child: Center(
                              child: Text(
                                  '${dateTimeThree.hour.toString()}:${dateTimeThree.minute.toString()}')),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    width: 353.w,
                    height: 280.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 31.sp, top: 26.sp),
                          child: Text(
                            'ДАТА РОЖДЕНИЯ',
                            style: TextStyle(
                                fontFamily: 'Open Sans Bold',
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp,
                                color: Color.fromRGBO(50, 63, 75, 1),
                                letterSpacing: 1.5.sp),
                          ),
                        ),
                        Center(
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 91.sp),
                                child: Center(
                                  child: Container(
                                    height: 48.sp,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(top: 0),
                                          child: Divider(
                                            color: Color.fromRGBO(
                                                123, 135, 148, 1),
                                            thickness: 0.5,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          child: Divider(
                                            color: Color.fromRGBO(
                                                123, 135, 148, 1),
                                            thickness: 0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              DatePickerWidget(
                                looping: false, // default is not looping
                                firstDate: DateTime(1990, 01, 01),
                                lastDate: DateTime(2030, 1, 1),
                                initialDate: DateTime(1991, 10, 12),
                                dateFormat: "dd-MMMM-yyyy",
                                locale: DatePicker.localeFromString('en'),
                                onChange: (DateTime newDate, _) =>
                                    date = newDate,
                                pickerTheme: DateTimePickerTheme(
                                  backgroundColor: Colors.transparent,
                                  pickerHeight: 230.h,
                                  itemTextStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19.sp,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400),
                                  dividerColor: Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                RowOfTextButton(),
                _SaveButtonWidget(
                  onTap: () {
                    Provider.of<MainFunction>(context, listen: false)
                        .onSaveButtonTap(
                      textEditingControllerName,
                      valueChoose,
                      dateTimeOne,
                      dateTimeTwo,
                      dateTimeThree,
                      date,
                    );

                    UserParamsFunction().saveUserParams(
                      valueChoose,
                      textEditingControllerName,
                      dateTimeOne,
                      dateTimeTwo,
                      dateTimeThree,
                      date,
                    );
                    NotificationTimer()
                        .setTimerOnTime('dateTimeOne', dateTimeOne);
                    NotificationTimer()
                        .setTimerOnTime('dateTimeTwo', dateTimeTwo);
                    NotificationTimer()
                        .setTimerOnTime('dateTimeThree', dateTimeThree);

                    NotificationApi().initNotification(box);
                    box.write('displayed', true);

                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => MainScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SaveButtonWidget extends StatelessWidget {
  final void Function() onTap;

  const _SaveButtonWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 84.sp, right: 83.sp, top: 62.sp),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 247,
          height: 52,
          decoration: BoxDecoration(
              color: Color.fromRGBO(126, 235, 234, 1),
              borderRadius: BorderRadius.circular(50.sp),
              border: Border.all(width: 2.w, color: Colors.black)),
          child: Center(
              child: Text(
            'СОХРАНИТЬ',
            style: TextStyle(
                fontFamily: 'Open Sans Bold',
                fontWeight: FontWeight.w800,
                fontSize: 15.sp,
                color: Colors.black,
                letterSpacing: 1.25.sp),
          )),
        ),
      ),
    );
  }
}

class _NameFieldWidget extends StatelessWidget {
  const _NameFieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 7.sp, left: 16.sp, right: 16.sp),
      child: Container(
        padding: EdgeInsets.only(left: 18.sp, right: 20.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.14),
                spreadRadius: 5.sp,
                blurRadius: 7.sp,
                offset: Offset(6.sp, 6.sp),
              )
            ]),
        child: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          cursorColor: Color.fromRGBO(126, 235, 234, 1),
          style: TextStyle(
              fontFamily: 'Open Sans Bold',
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: Color.fromRGBO(50, 63, 75, 1)),
          controller: controller,
        ),
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 61.sp, left: 121.sp, right: 120.83.sp),
      child: Container(
          width: 131.sp,
          height: 35.sp,
          child: SvgPicture.asset('assets/images/logo.svg')),
    );
  }
}
