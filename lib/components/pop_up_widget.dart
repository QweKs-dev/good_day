import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopUpWidget extends StatelessWidget {
  const PopUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10.sp),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp)), //this right here
      child: Container(
        height: 246.h,
        width: 391.w,
        child: Padding(
          padding: EdgeInsets.only(bottom: 30.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 11.sp,
                  right: 12.sp,
                  bottom: 45.sp,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 16.w,
                    height: 16.h,
                    child: SvgPicture.asset('assets/images/cross.svg'),
                  ),
                ),
              ),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text:
                          'Если у Вас возникли какие-нибудь\nвопросы, напишите нам на почту',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Open Sans Regular',
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: '\n@dgrhrw.',
                      style: TextStyle(
                        color: Color.fromRGBO(47, 128, 237, 1),
                        fontSize: 18.sp,
                        fontFamily: 'Open Sans Regular',
                      ),
                    ),
                    TextSpan(
                      text:
                          '\nНаши разработчики\nнезамедлительно свяжутся с Вами ;)',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Open Sans Regular',
                        color: Colors.grey,
                      ),
                    )
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
    // return Dialog(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //   child: Container(
    //     width: 391,
    //     height: 246,
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.only(
    //               top: 11, right: 12, bottom: 45, left: 363),
    //           child: GestureDetector(
    //             onTap: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: Container(
    //               width: 16,
    //               height: 16,
    //               child: SvgPicture.asset('assets/images/cross.svg'),
    //             ),
    //           ),
    //         ),
    //         Center(
    //           child: RichText(
    //             text: TextSpan(children: [
    //               TextSpan(
    //                 text:
    //                     'Если у Вас возникли какие-нибудь\nвопросы, напишите нам на почту',
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                   fontFamily: 'Open Sans Regular',
    //                   color: Colors.grey,
    //                 ),
    //               ),
    //               TextSpan(
    //                 text: '\n@dgrhrw.',
    //                 style: TextStyle(
    //                   color: Color.fromRGBO(47, 128, 237, 1),
    //                   fontSize: 18,
    //                   fontFamily: 'Open Sans Regular',
    //                 ),
    //               ),
    //               TextSpan(
    //                 text:
    //                     '\nНаши разработчики незамедлительно свяжутся с Вами ;)',
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                   fontFamily: 'Open Sans Regular',
    //                   color: Colors.grey,
    //                 ),
    //               )
    //             ]),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
