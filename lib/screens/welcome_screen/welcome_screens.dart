import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:good_day/onboarding/onboarding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:good_day/screens/welcome_screen/registration/registration_screen.dart';

class WelcomeScreens extends StatefulWidget {
  WelcomeScreens({Key? key}) : super(key: key);

  @override
  _WelcomeScreensState createState() => _WelcomeScreensState();
}

class _WelcomeScreensState extends State<WelcomeScreens> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 110.sp, left: 121.sp, right: 120.83.sp),
              child: Container(
                  width: 172.17.sp,
                  height: 46.sp,
                  child: SvgPicture.asset('assets/images/logo.svg')),
            ),
            Container(
              height: 530.sp,
              child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: contents.length,
                  itemBuilder: (_, i) {
                    return Stack(
                      children: [
                        Center(child: setImage(i)),
                        Align(
                          child: Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SeoulNamsan',
                                fontWeight: FontWeight.w400,
                                fontSize: 24.sp,
                                color: Colors.black),
                          ),
                          alignment: Alignment.bottomCenter,
                        ),
                      ],
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.sp, top: 30.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    contents.length, (index) => buildDots(index, context)),
              ),
            ),
            Center(
              child: Container(
                width: 230.sp,
                height: 105.sp,
                child: GestureDetector(
                  child: setButton(currentIndex),
                  onTap: () {
                    if (currentIndex == contents.length - 1) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => RegistrationScreen()));
                    }
                    _controller?.nextPage(
                        duration: const Duration(microseconds: 1000),
                        curve: Curves.bounceIn);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDots(int index, BuildContext context) {
    return Container(
      height: 8.sp,
      width: currentIndex == index ? 29.sp : 8.sp,
      margin: EdgeInsets.only(right: 11.sp, left: 11.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: currentIndex == index ? setColor(currentIndex) : Colors.black,
      ),
    );
  }

  Widget? setButton(int index) {
    switch (index) {
      case 0:
        return SvgPicture.asset(contents[index].buttonIcon);
      case 1:
        return SvgPicture.asset(contents[index].buttonIcon);
      case 2:
        return SvgPicture.asset(contents[index].buttonIcon);
    }
  }

  Color? setColor(int index) {
    switch (index) {
      case 0:
        return Color.fromRGBO(255, 176, 181, 1);
      case 1:
        return Color.fromRGBO(255, 224, 105, 1);
      case 2:
        return Color.fromRGBO(126, 235, 234, 1);
    }
  }

  Widget? setImage(int index) {
    switch (index) {
      case 0:
        return Container(
          width: 382.sp,
          height: 278.sp,
          child: SvgPicture.asset(
            contents[index].mainIcon,
            fit: BoxFit.cover,
          ),
        );
      case 1:
        return Container(
          width: 342.sp,
          height: 222.sp,
          child: SvgPicture.asset(
            contents[index].mainIcon,
            fit: BoxFit.cover,
          ),
        );
      case 2:
        return Container(
          width: 219.sp,
          height: 373.sp,
          child: SvgPicture.asset(
            contents[index].mainIcon,
            fit: BoxFit.cover,
          ),
        );
    }
  }
}
