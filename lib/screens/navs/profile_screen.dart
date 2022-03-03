import 'dart:async';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_review/bloc/auth_bloc/auth_bloc.dart';
import 'package:movie_review/data/models/profile_options_model.dart';
import 'package:movie_review/data/repositories/local_auth.dart';
import 'package:movie_review/screens/auth/login_screen.dart';
import 'package:movie_review/screens/form/profile_update.dart';
import 'package:movie_review/screens/home_screen.dart';
import 'package:movie_review/utils/apis/apis.dart';
import 'package:movie_review/widgets/profille_tile.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  LocalAuth auth = LocalAuth();
  late List<double> _accelerometerValues;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    super.initState();
    _streamSubscriptions.add(
      userAccelerometerEvents.listen(
        (UserAccelerometerEvent event) {
          setState(() {
            _accelerometerValues = <double>[event.x, event.y, event.z];
          });
          if (_accelerometerValues.isNotEmpty) {
            if (_accelerometerValues[1] > 1 && _accelerometerValues[1] < 3) {
              Get.to(() => const ProfileUpdateForm());
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AuthBloc()..add(GetUser()),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          debugPrint(state.toString());
          if (state is LoggedOut) {
            Get.to(() => const HomeScreen(currentIndex: 3));
            Get.snackbar(
              "Error",
              "Logged out",
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.red,
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.white,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              body: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                              API.baseUrl + state.user.avatar!,
                            ),
                            backgroundColor:
                                Theme.of(context).primaryColorLight,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${state.user.fname} ${state.user.lname}",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // const SizedBox(height: 5),
                        // Text(
                        //   "mbishal605@gmail.com",
                        //   style: TextStyle(
                        //     color: Theme.of(context).textTheme.bodyText2!.color,
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.normal,
                        //   ),
                        // ),
                        const SizedBox(height: 20),
                        ...options.map((option) {
                          return ProfileCardTile(
                            title: option.title,
                            icon: option.icon,
                            onTap: () async {
                              bool isUser = await auth.authenticate();
                              if (isUser == true) {
                                Get.toNamed(option.route);
                              } else {
                                Get.snackbar(
                                  "Error",
                                  "Only owner can visit page",
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.red,
                                  duration: const Duration(seconds: 1),
                                  backgroundColor: Colors.white,
                                );
                              }
                            },
                          );
                        }).toList(),
                        InkWell(
                          onTap: () {
                            BlocProvider.of<AuthBloc>(context)
                                .add(LogoutUser());
                          },
                          child: Container(
                            width: size.width,
                            height: 60,
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Icon(
                                  EvaIcons.logOut,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Logout",
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is NoUser) {
            return const LoginScreen();
          } else {
            return Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              body: SafeArea(
                child: Center(
                  child: SizedBox(
                    width: size.width,
                    height: 200,
                    child: Column(
                      children: [
                        Text(
                          "Failed to load",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        OutlinedButton(
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context).add(GetUser());
                          },
                          child: Text(
                            "Refresh",
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
