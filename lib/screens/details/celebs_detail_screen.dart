import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_review/bloc/movie_bloc/movie_detail_bloc.dart';
import 'package:movie_review/screens/details/movie_loading_screen.dart';
import 'package:movie_review/utils/apis/apis.dart';
import 'package:movie_review/utils/colors/colors.dart';

class CelebsDetailScreen extends StatefulWidget {
  final int id;
  const CelebsDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  _CelebsDetailScreenState createState() => _CelebsDetailScreenState();
}

class _CelebsDetailScreenState extends State<CelebsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          MovieDetailBloc()..add(LoadMovieDetail(id: widget.id)),
      child: BlocConsumer<MovieDetailBloc, MovieDetailState>(
        listener: (context, state) {
          print(state.toString());
        },
        builder: (context, state) {
          if (state is MovieDetailLoadSuccess) {
            final movie = state.movie;
            return Scaffold(
              backgroundColor: MyColors.background,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: size.height * 0.4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    NetworkImage(API.baseUrl + movie.poster!),
                              ),
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    EvaIcons.arrowBack,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    EvaIcons.heart,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InkWell(
                                onTap: () {
                                  debugPrint("Playing");
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset(
                                          "assets/logos/play_icon.png"),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      "Play",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18,
                          top: 4,
                        ),
                        child: Text(
                          movie.name!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18,
                        ),
                        child: Row(
                          children: [
                            ...movie.genres!.map(
                              (e) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 7,
                                ),
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: MyColors.secondaryBackground,
                                ),
                                child: (Text(
                                  e,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18,
                          right: 18,
                          top: 4,
                        ),
                        child: Text(
                          movie.description!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 18,
                          right: 18,
                          top: 4,
                        ),
                        child: Text(
                          "Crews",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18,
                        ),
                        child: Row(
                          children: [
                            ...movie.crew!.map(
                              (e) => Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          MyColors.secondaryBackground,
                                      radius: 40,
                                    ),
                                    // Text(e.fname),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18,
                          right: 18,
                          top: 4,
                        ),
                        child: RichText(
                          text: TextSpan(
                              text: "Director : ",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              children: [
                                TextSpan(
                                  text: movie.director!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ]),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18,
                          right: 18,
                          top: 4,
                        ),
                        child: RichText(
                          text: TextSpan(
                              text: "Producer : ",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              children: [
                                TextSpan(
                                  text: movie.producer!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is MovieDetailLoadFailed) {
            return Scaffold(
              backgroundColor: MyColors.background,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                          "Failed to load",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        OutlinedButton(
                          onPressed: () {
                            MovieDetailBloc().add(
                              LoadMovieDetail(id: widget.id),
                            );
                          },
                          child: const Text(
                            "Refresh",
                            style: TextStyle(
                              color: Colors.white,
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
          } else {
            return const MovieLoadingScreen();
          }
        },
      ),
    );
  }
}
