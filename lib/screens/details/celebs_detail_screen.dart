import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_review/bloc/celebs_bloc/celebs_detail_bloc.dart';
import 'package:movie_review/bloc/movie_bloc/movie_detail_bloc.dart';
import 'package:movie_review/screens/details/movie_detail_screen.dart';
import 'package:movie_review/screens/details/movie_loading_screen.dart';
import 'package:movie_review/utils/apis/apis.dart';
import 'package:movie_review/utils/colors/colors.dart';
import 'package:movie_review/widgets/movie_card.dart';

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
          CelebsDetailBloc()..add(LoadCelebsDetail(id: widget.id)),
      child: BlocConsumer<CelebsDetailBloc, CelebsDetailState>(
        listener: (context, state) {
          print(state.toString());
        },
        builder: (context, state) {
          if (state is CelebsDetailLoadSuccess) {
            final celebs = state.celebs;
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
                                    NetworkImage(API.baseUrl + celebs.image!),
                              ),
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                EvaIcons.arrowBack,
                                size: 30,
                                color: Colors.white,
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
                          "${celebs.fname} ${celebs.lname}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18,
                          top: 4,
                        ),
                        child: Text(
                          DateFormat.yMMMd()
                              .format(DateTime.parse(celebs.dob!)),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
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
                            ...celebs.role!.map(
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
                          celebs.bio!,
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
                          "Movies",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: size.width,
                        height: 200,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.movies.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: (index == 0) ? 20 : 5,
                                right: (index == (state.movies.length - 1))
                                    ? 20
                                    : 2,
                              ),
                              child: MovieCard(
                                  name: state.movies[index].name!,
                                  image:
                                      API.baseUrl + state.movies[index].poster!,
                                  releaseDate: state.movies[index].releaseDate!,
                                  onTap: () {
                                    Get.to(() => MovieDetailScreen(
                                          id: state.movies[index].id!,
                                        ));
                                  }),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else if (state is CelebsDetailLoadFailed) {
            return Scaffold(
              backgroundColor: MyColors.background,
              body: Center(
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
                          BlocProvider.of<CelebsDetailBloc>(context)
                              .add(LoadCelebsDetail(id: widget.id));
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
            );
          } else {
            return const MovieLoadingScreen();
          }
        },
      ),
    );
  }
}
