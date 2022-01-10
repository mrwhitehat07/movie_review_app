import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_review/screens/home_screen.dart';
import 'package:movie_review/utils/colors/colors.dart';
import 'package:movie_review/widgets/custom_button.dart';
import 'package:movie_review/widgets/input_box.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confPasswordController = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "Create\n",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                          children: [
                            TextSpan(
                              text: "Account.",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      InputBox(
                        fieldName: "Username",
                        controller: _usernameController,
                        hintText: "batas12",
                      ),
                      const SizedBox(height: 20),
                      InputBox(
                        fieldName: "Your Email",
                        controller: _emailController,
                        hintText: "someone@example.com",
                      ),
                      const SizedBox(height: 20),
                      InputBox(
                        fieldName: "Password",
                        controller: _passwordController,
                        hintText: "●●●●●●●●",
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      InputBox(
                        fieldName: "Confirm Password",
                        controller: _confPasswordController,
                        hintText: "●●●●●●●●",
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        title: "SIGN UP",
                        callBack: () {
                          Get.to(() => const HomeScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
