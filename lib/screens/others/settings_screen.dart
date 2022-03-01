import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_review/bloc/theme_bloc/theme_bloc.dart';
import 'package:movie_review/utils/colors/colors.dart';
import 'package:movie_review/utils/theme/theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider.value(
      value: BlocProvider.of<ThemeBloc>(context)..add(ThemeCheckEvent()),
      child: BlocConsumer<ThemeBloc, ThemeState>(
        listener: (context, state) {
          // if (state is ThemeChanged) {
          //       if (state.themeData == appThemeData[AppTheme.primaryDark]) {
          //         setState(() {
          //           isDark = true;
          //         });
          //       } else {
          //         setState(() {
          //           isDark = false;
          //         });
          //       }
          //     }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              elevation: 0,
              title: Text(
                "Settings",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              backgroundColor: Theme.of(context).backgroundColor,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  EvaIcons.arrowBack,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    // Container(
                    //   width: size.width,
                    //   height: 60,
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   alignment: Alignment.center,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         "Dark mode",
                    //         style: TextStyle(
                    //           color:
                    //               Theme.of(context).textTheme.bodyText1!.color,
                    //           fontSize: 16,
                    //         ),
                    //       ),
                    //       Switch(
                    //         value: isDark,
                    //         onChanged: (value) {
                    //           if (isDark) {
                    //         BlocProvider.of<ThemeBloc>(context)
                    //           .add(
                    //             ThemeChangedEvent(
                    //                 themeData:
                    //                     appThemeData[AppTheme.primaryLight]!),
                    //           );
                    //       } else {
                    //         BlocProvider.of<ThemeBloc>(context)
                    //           .add(
                    //             ThemeChangedEvent(
                    //                 themeData:
                    //                     appThemeData[AppTheme.primaryDark]!),
                    //           );
                    //       }
                    //         },
                    //         activeColor: MyColors.primaryButtonColor,
                    //         activeTrackColor: MyColors.secondaryBackground,
                    //         inactiveThumbColor: Colors.grey,
                    //         inactiveTrackColor: MyColors.secondaryBackground,
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
