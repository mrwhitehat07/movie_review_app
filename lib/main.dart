import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:movie_review/bloc/internet_bloc/internet_bloc.dart';
import 'package:movie_review/data/hive_models/celeb_model.dart';
import 'package:movie_review/data/hive_models/movie_model.dart';
import 'package:movie_review/routes/route.dart';
import 'package:movie_review/screens/form/change_password.dart';
import 'package:movie_review/screens/form/profile_update.dart';
import 'package:movie_review/screens/home_screen.dart';
import 'package:movie_review/screens/others/settings_screen.dart';
import 'package:movie_review/screens/splash/splash_screen.dart';
import 'package:movie_review/utils/theme/theme.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter(MovieModelAdapter())
    ..registerAdapter(CelebsModelAdapter());
  AwesomeNotifications().initialize(null, // icon for your app notification
      [
        NotificationChannel(
            channelKey: 'key1',
            channelName: 'mychannel',
            channelDescription: "This is notification channel",
            defaultColor: const Color(0XFF9050DD),
            ledColor: Colors.white,
            playSound: true,
            enableLights: true,
            importance: NotificationImportance.High,
            enableVibration: true)
      ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc()..add(CheckInternet()),
      child: BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          print(state.toString());
          if (state is NoInternet) {
            Get.snackbar(
              "Error",
              "No internet connection",
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.red,
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.white,
            );
          } else if (state is InternetOk) {
            Get.snackbar(
              "Connection",
              "Internet connection found",
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.green,
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.white,
            );
          }
        },
        builder: (context, state) {
    return GetMaterialApp(
      title: 'Movie Review',
      initialRoute: MyRoutes.splashPage,
      debugShowCheckedModeBanner: false,
      theme: appThemeData[AppTheme.primaryDark],
      getPages: [
        GetPage(name: MyRoutes.splashPage, page: () => const SplashScreen()),
        GetPage(name: MyRoutes.homePage, page: () => const HomeScreen()),
        GetPage(
            name: MyRoutes.profileEdit, page: () => const ProfileUpdateForm()),
        GetPage(
            name: MyRoutes.changePassword,
            page: () => const ChangePasswordScreen()),
        GetPage(name: MyRoutes.settings, page: () => const SettingsScreen())
      ],
    );
        },
      ),
    );
  }
}
