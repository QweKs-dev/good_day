import 'package:flutter/material.dart';
import 'package:good_day/components/pop_up_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowOfTextButton extends StatelessWidget {
  const RowOfTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              showDialog(context: context, builder: (context) => PopUpWidget());
            },
            child: Text(
              'Terms of Service',
              style: TextStyle(
                  fontFamily: 'Open Sans Regular',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color.fromRGBO(47, 128, 237, 1)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: VerticalDivider(
              color: Color.fromRGBO(123, 135, 148, 1),
              thickness: 1,
              width: 10,
              indent: 10,
              endIndent: 2,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Pryvacy Policy',
              style: TextStyle(
                  fontFamily: 'Open Sans Regular',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color.fromRGBO(47, 128, 237, 1)),
            ),
          ),
        ],
      ),
    );
  }
}
