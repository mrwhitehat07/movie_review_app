import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_review/bloc/auth_bloc/auth_bloc.dart';
import 'package:movie_review/screens/navs/profile_screen.dart';
import 'package:movie_review/utils/colors/colors.dart';
import 'package:movie_review/widgets/custom_input_box.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final curPassword = TextEditingController();
  final newPassword = TextEditingController();
  final cnfPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Get.to(() => const ProfileScreen());
          } else if (state is AuthFailed) {
            Get.snackbar("Error", state.message,
                snackPosition: SnackPosition.BOTTOM,
                colorText: Colors.red,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.white);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text("Change Password"),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        CustomInputBox(
                          fieldName: "Current Password",
                          hint: "Current Password",
                          controller: curPassword,
                          isPassword: true,
                        ),
                        const SizedBox(height: 15),
                        CustomInputBox(
                          fieldName: "New Password",
                          hint: "New Password",
                          controller: newPassword,
                          isPassword: true,
                        ),
                        const SizedBox(height: 15),
                        CustomInputBox(
                          fieldName: "Confirm Password",
                          hint: "Confirm Password",
                          controller: cnfPassword,
                          isPassword: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          ChangePassword(
                            id: 1,
                            currentPassword: curPassword.text,
                            newPassword: newPassword.text,
                            confPassword: cnfPassword.text,
                          ),
                        );
                      },
                      child: Container(
                        width: size.width,
                        height: 40,
                        decoration: BoxDecoration(
                          color: MyColors.primaryButtonColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.center,
                        child: (state is AuthLoading)
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                    strokeWidth: 1, color: Colors.black),
                              )
                            : Text(
                                "change password".toUpperCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
