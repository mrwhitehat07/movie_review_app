import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_review/routes/route.dart';
import 'package:movie_review/screens/form/profile_update.dart';
import 'package:movie_review/screens/home_screen.dart';
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
      initialRoute: MyRoutes.splashPage,
      getPages: [
        GetPage(name: MyRoutes.splashPage, page: () => const SplashScreen()),
        GetPage(name: MyRoutes.homePage, page: () => const HomeScreen()),
        GetPage(
            name: MyRoutes.profileEdit, page: () => const ProfileUpdateForm()),
      ],
    );
  }
}
