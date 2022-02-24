import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_review/bloc/auth_bloc/auth_bloc.dart';
import 'package:movie_review/data/models/profile_options_model.dart';
import 'package:movie_review/routes/route.dart';
import 'package:movie_review/screens/auth/login_screen.dart';
import 'package:movie_review/utils/apis/apis.dart';
import 'package:movie_review/utils/colors/colors.dart';
import 'package:movie_review/widgets/profille_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AuthBloc()..add(GetUser()),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          debugPrint(state.toString());
          if (state is LoggedOut) {
            Get.toNamed(MyRoutes.homePage);
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
                        const SizedBox(height: 5),
                        Text(
                          "mbishal605@gmail.com",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText2!.color,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ...options.map((option) {
                          return ProfileCardTile(
                            title: option.title,
                            icon: option.icon,
                            onTap: () {
                              Get.toNamed(option.route);
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor:
                                Theme.of(context).primaryColorLight,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Cho Boah",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "choboah@gmail.com",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ...options.map((option) {
                          return ProfileCardTile(
                            title: option.title,
                            icon: option.icon,
                            onTap: () {
                              Get.toNamed(option.route);
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
                              children: const [
                                Icon(
                                  EvaIcons.logOut,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Logout",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
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
