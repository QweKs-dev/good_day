import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:good_day/logic/user_parameters.dart';
import 'package:good_day/screens/main_screen/main_screen.dart';
import 'package:good_day/screens/welcome_screen/welcome_screens.dart';

final docCollectionRef =
    FirebaseFirestore.instance.collection('MotivationalTexts');

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final box = GetStorage('MyStorage');

  @override
  void initState() {
    super.initState();

    print(box.read('displayed'));

    box.writeIfNull('displayed', false);

    print(box.read('displayed'));

    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) =>
              box.read('displayed') ? MainScreen() : WelcomeScreens()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/loading_screen_new.png'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
