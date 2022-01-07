import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_review/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie Review',
      home: SplashScreen(),
    );
  }
}

