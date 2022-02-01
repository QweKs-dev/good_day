import 'package:flutter/material.dart';

class OnBoardingContent {
  final String title;
  final String mainIcon;
  final String buttonIcon;
  final Color backgroundColor;

  OnBoardingContent(
      {required this.title,
      required this.mainIcon,
      required this.backgroundColor,
      required this.buttonIcon});
}

final List<OnBoardingContent> contents = [
  OnBoardingContent(
      title: 'Улучшите свое общее\n самочувствие',
      mainIcon: 'assets/images/human_one.svg',
      backgroundColor: Colors.transparent,
      buttonIcon: 'assets/images/next1.svg'),
  OnBoardingContent(
      title: 'Получайте мотивирующие\n уведомления',
      mainIcon: 'assets/images/human_two.svg',
      backgroundColor: Colors.transparent,
      buttonIcon: 'assets/images/next2.svg'),
  OnBoardingContent(
      title: 'Приятные сообщения скрасят\n Ваш день',
      mainIcon: 'assets/images/human_three.svg',
      backgroundColor: Colors.transparent,
      buttonIcon: 'assets/images/next3.svg'),
];
