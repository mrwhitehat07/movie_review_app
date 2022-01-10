import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_review/screens/auth/register_screen.dart';
import 'package:movie_review/screens/home_screen.dart';
import 'package:movie_review/utils/colors/colors.dart';
import 'package:movie_review/widgets/custom_button.dart';
import 'package:movie_review/widgets/input_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isVisible = false;
  final _formKey = GlobalKey<FormState>();

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: "Welcome\n",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            children: [
                              TextSpan(
                                text: "Back.",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
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
                        Container(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          title: "SIGN IN",
                          callBack: () {
                            _formKey.currentState!.validate();
                          },
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const RegisterScreen());
                            },
                            child: const Text(
                              "Don't have an account",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
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
  }
}
