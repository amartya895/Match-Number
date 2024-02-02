import 'package:assignment_app/pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(MainPage());
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash.gif',
          width: 300.0,
          height: 300.0,
        ),
      ),
    );
  }
}
