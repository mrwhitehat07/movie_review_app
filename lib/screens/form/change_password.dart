import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            EvaIcons.arrowIosBack,
            // color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Change Password",
          style: TextStyle(
              // color: Colors.black,
              ),
        ),
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
                onTap: () {},
                child: Container(
                  width: size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: MyColors.primaryButtonColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: Text(
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
  }
}
