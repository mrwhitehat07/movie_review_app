import 'package:flutter/material.dart';
import 'package:movie_review/utils/colors/colors.dart';

class MovieLoadingScreen extends StatelessWidget {
  const MovieLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.4,
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColorLight),
              ),
              const SizedBox(height: 10),
              const LoadingText(width: 125),
              const SizedBox(height: 10),
              LoadingText(width: size.width * 0.8),
              const SizedBox(height: 10),
              LoadingText(width: size.width * 0.7),
              const SizedBox(height: 10),
              LoadingText(width: size.width * 0.6),
              const SizedBox(height: 40),
              const LoadingText(width: 125),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColorLight,
                      radius: 40,
                    ),
                    const SizedBox(width: 5),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColorLight,
                      radius: 40,
                    ),
                    const SizedBox(width: 5),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColorLight,
                      radius: 40,
                    ),
                    const SizedBox(width: 5),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColorLight,
                      radius: 40,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              LoadingText(width: size.width * 0.5),
              const SizedBox(height: 10),
              LoadingText(width: size.width * 0.5),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingText extends StatelessWidget {
  const LoadingText({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        top: 4,
      ),
      child: Container(
        width: width,
        height: 20,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
