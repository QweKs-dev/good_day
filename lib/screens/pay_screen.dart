import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:good_day/components/row_of_textbutton.dart';
import 'package:good_day/logic/database/database.dart';
import 'package:good_day/screens/main_screen/main_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Color.fromRGBO(0, 0, 0, 0.04), BlendMode.darken),
          image: AssetImage('assets/images/background_main.png'),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: 61.sp, left: 121.sp, right: 120.83.sp),
            child: Center(
              child: Container(
                  width: 131.w,
                  height: 35.h,
                  child: SvgPicture.asset('assets/images/logo.svg')),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.sp, left: 41.sp, right: 41.sp),
            child: Container(
                width: 335.w,
                height: 239.h,
                child: SvgPicture.asset(
                  'assets/images/loving.svg',
                  fit: BoxFit.fill,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 42.2.sp, left: 10.sp, right: 10.sp),
            child: Text(
              'Неограниченный доступ',
              style: TextStyle(
                fontFamily: 'Open Sans Bold',
                fontWeight: FontWeight.w700,
                fontSize: 28.sp,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 53.sp, right: 55.sp),
            child: Text(
              'Мотивирующие и приятные\nсообщения в течении дня',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Open Sans Bold',
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
          ),
          SubscriptionButton(),
          Padding(
            padding: EdgeInsets.only(top: 2.sp, left: 81.sp, right: 81.sp),
            child: Text(
              'Отписаться можно в любой момент',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Open Sans Bold',
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 140.sp),
            child: RowOfTextButton(),
          )
        ],
      ),
    ));
  }
}

class SubscriptionButton extends StatelessWidget {
  const SubscriptionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 21.sp, right: 19.sp, top: 42.sp),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => MainScreen()));
        },
        child: Container(
          width: 375.w,
          height: 68.h,
          decoration: BoxDecoration(
              color: Color.fromRGBO(126, 235, 234, 1),
              borderRadius: BorderRadius.circular(10.sp)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '14 дней бесплатно',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Open Sans Bold',
                  fontWeight: FontWeight.w700,
                  fontSize: 28.sp,
                  color: Colors.white,
                ),
              ),
              Text(
                'Затем 2,99\$ в месяц',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Open Sans Bold',
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
