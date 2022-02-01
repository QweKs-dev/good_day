import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:good_day/logic/massege_item.dart';

class ListViewItem extends StatelessWidget {
  String? time;
  String? massageText;

  ListViewItem({Key? key, required this.massageText, required this.time})
      : super(key: key);

  // final massageItem = MassageItem(massageText: massageText, dateTime: time);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 13, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time!,
              style: TextStyle(
                fontFamily: 'Open Sans Regular',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color.fromRGBO(96, 120, 124, 0.5),
              )),
          Container(
            width: 379,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.14),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(6, 6),
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 9,
                    top: 9,
                    right: 17,
                    bottom: 10,
                  ),
                  child: Container(
                    height: 55,
                    width: 55,
                    child: SvgPicture.asset('assets/images/icon_item.svg'),
                  ),
                ),
                Center(
                  child: Container(width: 280.sp, child: Text(massageText!)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
