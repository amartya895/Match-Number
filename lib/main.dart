import 'package:assignment_app/bindings/InitialBinding.dart';
import 'package:assignment_app/pages/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    initialBinding: InitialBinding(),
    home: SplashPage(),
  ));
}

