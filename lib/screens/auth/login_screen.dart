import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_review/bloc/auth_bloc/auth_bloc.dart';
import 'package:movie_review/data/models/user_model.dart';
import 'package:movie_review/screens/auth/register_screen.dart';
import 'package:movie_review/screens/home_screen.dart';
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

    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Get.to(() => const HomeScreen());
          } else if (state is AuthFailed) {
            Get.snackbar("Error", state.message,
                snackPosition: SnackPosition.BOTTOM,
                colorText: Colors.red,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.white);
          }
        },
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: Scaffold(
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
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "Welcome\n",
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
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
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
                                                .color,
                                          ),
                                        )
                                      : Text(
                                          "sign in".toUpperCase(),
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
                                        : BlocProvider.of<AuthBloc>(context)
                                            .add(LoginBegin(
                                                user: User(
                                                    email:
                                                        _emailController.text,
                                                    password:
                                                        _passwordController
                                                            .text)));
                                  },
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => const RegisterScreen());
                                    },
                                    child: Text(
                                      "Don't have an account",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
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
            ),
          );
        },
      ),
    );
  }
}
