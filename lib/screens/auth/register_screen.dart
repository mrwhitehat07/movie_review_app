import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_review/bloc/auth_bloc/auth_bloc.dart';
import 'package:movie_review/data/models/user_model.dart';
import 'package:movie_review/screens/auth/login_screen.dart';
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
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Get.to(() => const LoginScreen());
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
            backgroundColor: Theme.of(context).backgroundColor,
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
                        icon: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Create\n",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                                children: const [
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
                              child: (state is AuthLoading)
                                  ? SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color),
                                    )
                                  : Text(
                                      "sign up".toUpperCase(),
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                              callBack: () {
                                (state is AuthLoading)
                                    ? null
                                    : BlocProvider.of<AuthBloc>(context).add(
                                        RegisterBegin(
                                          user: User(
                                            username: _usernameController.text,
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                          ),
                                        ),
                                      );
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
        },
      ),
    );
  }
}
