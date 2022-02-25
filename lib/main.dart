import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:movie_review/routes/route.dart';
import 'package:movie_review/screens/form/change_password.dart';
import 'package:movie_review/screens/form/profile_update.dart';
import 'package:movie_review/screens/home_screen.dart';
import 'package:movie_review/screens/others/settings_screen.dart';
import 'package:movie_review/screens/splash/splash_screen.dart';
import 'package:movie_review/utils/theme/theme.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'bloc/theme_bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  // Hive
  //   ..init(appDocumentDir.path)
  //   ..registerAdapter(ThemeAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc()..add(ThemeCheckEvent()),
      child: BlocConsumer<ThemeBloc, ThemeState>(
        listener: (context, state) {
          if (state is ThemeChanged) {
            print("theme : " + state.themeData.toString());
          } else {
            print("done nothing");
          }
        },
        builder: (context, state) {
          return GetMaterialApp(
            title: 'Movie Review',
            initialRoute: MyRoutes.splashPage,
            debugShowCheckedModeBanner: false,
            theme: (state is ThemeChanged)
                ? state.themeData
                : appThemeData[AppTheme.primaryLight],
            getPages: [
              GetPage(
                  name: MyRoutes.splashPage, page: () => const SplashScreen()),
              GetPage(name: MyRoutes.homePage, page: () => const HomeScreen()),
              GetPage(
                  name: MyRoutes.profileEdit,
                  page: () => const ProfileUpdateForm()),
              GetPage(
                  name: MyRoutes.changePassword,
                  page: () => const ChangePasswordScreen()),
              GetPage(
                  name: MyRoutes.settings, page: () => const SettingsScreen())
            ],
          );
        },
      ),
    );
  }
}
