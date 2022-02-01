import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:good_day/components/list_view_item.dart';
import 'package:good_day/logic/database/database.dart';
import 'package:good_day/logic/notification_api.dart';
import 'package:good_day/logic/timer_for_notification.dart';
import 'package:good_day/logic/user_parameters.dart';
import 'package:good_day/screens/profile_screen/profile_screen.dart';
import 'package:good_day/screens/welcome_screen/loading_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final box = GetStorage('MyStorage');
  var docCollectionRef =
      FirebaseFirestore.instance.collection('MotivationalTexts');

  // var firestoreDocumentsId = [];
  var listUsedDocId = [];
  var listOfTime = [];

  DateTime? dateTimeOne;
  DateTime? dateTimeTwo;
  DateTime? dateTimeThree;

  var time;
  var text;
  String? id;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    UserParamsFunction().setUserParams();
    dateTimeOne = DateTime.parse(box.read('dateTimeOne'));
    dateTimeTwo = DateTime.parse(box.read('dateTimeTwo'));
    dateTimeThree = DateTime.parse(box.read('dateTimeThree'));
    NotificationApi.init();
    NotificationApi().initNotification(box);

    box.writeIfNull('listUsedDocId', ['First']);
    box.writeIfNull('listOfTime',
        [DateFormat.yMMMMd().add_Hm().format(DateTime.now()).toString()]);
    listUsedDocId.addAll(box.read('listUsedDocId'));
    listOfTime.addAll(box.read('listOfTime'));

    NotificationTimer().setTimerOnTime('dateTimeOne', dateTimeOne!);
    NotificationTimer().setTimerOnTime('dateTimeTwo', dateTimeTwo!);
    NotificationTimer().setTimerOnTime('dateTimeThree', dateTimeThree!);
    // getDocId().then((value) => id = value);
    print(id);
  }

  Future<List<String>> getSavedList() async {
    print('start create list ========');
    List<String> res = <String>[];

    for (int i = 0; i < listUsedDocId.length; i++) {
      final item = await docCollectionRef.doc(listUsedDocId[i]).get();
      print(listUsedDocId[i].toString());
      res.add(item.data()?['text']);
    }
    print(listUsedDocId);
    return res;
  }

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 61),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 142, right: 99),
                    child: Container(
                        width: 131,
                        height: 35,
                        child: SvgPicture.asset('assets/images/logo.svg')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ProFileScreen()));
                    },
                    child: Container(
                        width: 29,
                        height: 30,
                        child:
                            SvgPicture.asset('assets/components/settings.svg')),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 29,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (a, b, c) => MainScreen(),
                      transitionDuration: const Duration(microseconds: 800),
                    ));
                return Future.value(false);
              },
              child: FutureBuilder(
                  future: getSavedList(),
                  builder: (context, AsyncSnapshot<List<String>> snapshot) {
                    if (snapshot.hasError) {
                      print('Something went wrong');
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(126, 235, 234, 1),
                        ),
                      );
                    }

                    if (!snapshot.hasData) {
                      print('Document does not exist');
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(126, 235, 234, 1),
                        ),
                      );
                    } else {
                      print(box.read('listUsedDocId'));

                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          int reverseIndex = snapshot.data!.length - 1 - index;
                          return ListViewItem(
                              massageText: snapshot.data![reverseIndex],
                              time: listOfTime[reverseIndex]);
                        },
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    ));
  }
}
