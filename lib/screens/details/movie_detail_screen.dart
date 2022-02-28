import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_review/bloc/movie_bloc/movie_detail_bloc.dart';
import 'package:movie_review/data/models/review_model.dart';
import 'package:movie_review/screens/details/movie_loading_screen.dart';
import 'package:movie_review/screens/others/video_player.dart';
import 'package:movie_review/utils/apis/apis.dart';
import 'package:movie_review/utils/colors/colors.dart';

class MovieDetailScreen extends StatefulWidget {
  final int id;
  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final reviewController = TextEditingController();
  double rate = 3;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.animateTo(2);
    super.initState();
  }

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
                            left: 10,
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
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => VideoPlayer(
                                            videoUrl:
                                                API.baseUrl + movie.trailer!));
                                      },
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(
                                            "assets/logos/play_icon.png"),
                                      ),
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
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TabBar(
                          controller: tabController,
                          indicatorColor: MyColors.primaryButtonColor,
                          labelPadding: const EdgeInsets.symmetric(vertical: 5),
                          indicator: const BoxDecoration(),
                          tabs: const [
                            Text(
                              "About",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Cast & Crew",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "⭐ & Reviews",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: size.height * 0.5,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color:
                                                  MyColors.secondaryBackground,
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
                                  const SizedBox(height: 15),
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
                                  const SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 18,
                                      right: 18,
                                      top: 4,
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Released : ",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: DateFormat.yMMMd().format(
                                                DateTime.parse(
                                                    movie.releaseDate!)),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...state.crews.map(
                                    (e) => Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                MyColors.secondaryBackground,
                                            backgroundImage: NetworkImage(
                                                API.baseUrl + e.image!),
                                            radius: 30,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            "${e.fname} ${e.lname}",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .color,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0,
                                    ),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    unratedColor:
                                        Theme.of(context).primaryColorLight,
                                    onRatingUpdate: (rating) {
                                      setState(() {
                                        rate = rating;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                      horizontal: 20,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      child: TextField(
                                        maxLines: 3,
                                        controller: reviewController,
                                        decoration: InputDecoration(
                                          hintText: "Write here...",
                                          hintStyle: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .color,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                      horizontal: 20,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        BlocProvider.of<MovieDetailBloc>(
                                                context)
                                            .add(RateReview(
                                                id: movie.id!,
                                                review: Review(
                                                  review: reviewController.text,
                                                  rating: rate,
                                                )));
                                      },
                                      child: Container(
                                        width: size.width,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: MyColors.primaryButtonColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 2,
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Submit",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ...state.review[0]
                                      .map((e) => Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    e.review,
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .color,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    DateFormat.yMMMd().format(
                                                        DateTime.parse(
                                                            e.timestamp)),
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .color,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                ],
                                              ),
                                            ],
                                          ))
                                      .toList(),
                                ],
                              ),
                            )
                          ],
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
                child: Center(
                  child: SizedBox(
                    width: size.width,
                    height: 200,
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
                            BlocProvider.of<MovieDetailBloc>(context)
                                .add(LoadMovieDetail(id: widget.id));
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
