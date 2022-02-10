import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_review/bloc/movie_bloc/movie_detail_bloc.dart';
import 'package:movie_review/utils/apis/apis.dart';
import 'package:movie_review/utils/colors/colors.dart';

class MovieDetailScreen extends StatefulWidget {
  final int id;
  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
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
                                  image: NetworkImage(
                                      API.baseUrl + state.movie.poster!),
                                ),
                              ),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  EvaIcons.heart,
                                  size: 30,
                                  color: Colors.white,
                                ),
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
                            state.movie.name!,
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
                            top: 4,
                          ),
                          child: Text(
                            state.movie.description!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          } else if (state is MovieDetailLoadFailed) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
