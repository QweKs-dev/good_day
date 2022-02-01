import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:good_day/logic/main_function.dart';
import 'package:good_day/screens/welcome_screen/loading_screen.dart';
import 'package:good_day/screens/welcome_screen/welcome_screens.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init('MyStorage');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AndroidAlarmManager.initialize();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .whenComplete(() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    runApp(ChangeNotifierProvider(
      create: (_) => MainFunction(),
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Good Day',
      home: HomePage(title: 'FlutterScreenUtil Demo'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(414, 896),
      orientation: Orientation.portrait,
    );
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: LoadingScreen(),
      ),
    );
  }
}
