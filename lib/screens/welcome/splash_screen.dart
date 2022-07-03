import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../../controller/login_controller/introduction_controller.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  IntroductionController introductionController =
      Get.put(IntroductionController());
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Stack(children: [
        Image.asset('assets/images/logo.png'),
      ]),
      nextScreen: introductionController.checkiflogged(),
      splashTransition: SplashTransition.scaleTransition,
      // pageTransitionType: PageTransitionType.scale,
      backgroundColor: Colors.white,
    );
  }
}
