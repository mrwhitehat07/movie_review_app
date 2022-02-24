import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_review/bloc/home_bloc/home_bloc.dart';
import 'package:movie_review/screens/details/celebs_detail_screen.dart';
import 'package:movie_review/screens/details/movie_detail_screen.dart';
import 'package:movie_review/screens/details/movie_loading_screen.dart';
import 'package:movie_review/utils/apis/apis.dart';
import 'package:movie_review/utils/colors/colors.dart';
import 'package:movie_review/widgets/movie_card.dart';
import 'package:movie_review/widgets/movie_loading_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      lazy: false,
      create: (context) => HomeBloc()..add(LoadHomeData()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          debugPrint(state.toString());
        },
        builder: (context, state) {
          if (state is HomeLoaded) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: RichText(
                          text: const TextSpan(
                            text: "Popular Movies\n",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            children: [
                              TextSpan(
                                text: "from all over the world",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      (state is HomeLoaded)
                          ? SizedBox(
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
                                      right:
                                          (index == (state.movies.length - 1))
                                              ? 20
                                              : 2,
                                    ),
                                    child: MovieCard(
                                        name: state.movies[index].name!,
                                        image: API.baseUrl +
                                            state.movies[index].poster!,
                                        releaseDate:
                                            state.movies[index].releaseDate!,
                                        onTap: () {
                                          Get.to(() => MovieDetailScreen(
                                                id: state.movies[index].id!,
                                              ));
                                        }),
                                  );
                                },
                              ),
                            )
                          : SizedBox(
                              width: size.width,
                              height: 200,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      left: (index == 0) ? 20 : 8,
                                      right: (index == (3 - 1)) ? 20 : 2,
                                    ),
                                    child: const MovieLoadingCard(),
                                  );
                                },
                              ),
                            ),
                      const SizedBox(height: 20),
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Your Celebs",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      (state is HomeLoaded)
                          ? Container(
                              padding: const EdgeInsets.only(left: 18),
                              width: double.infinity,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...state.celebs.map(
                                      (e) => InkWell(
                                        onTap: () {
                                          Get.to(
                                            () => CelebsDetailScreen(
                                              id: e.id!,
                                            ),
                                          );
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: 50,
                                                backgroundImage: NetworkImage(
                                                    API.baseUrl + e.image!),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                "${e.fname} ${e.lname}",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : SizedBox(
                              width: size.width,
                              height: 100,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      left: (index == 0) ? 20 : 8,
                                      right: (index == (3 - 1)) ? 20 : 2,
                                    ),
                                    child: const CircleAvatar(
                                      backgroundColor:
                                          MyColors.secondaryBackground,
                                      radius: 40,
                                    ),
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is HomeLoading) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const LoadingText(width: 125),
                      const SizedBox(height: 5),
                      const LoadingText(width: 100),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: size.width,
                        height: 200,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: (index == 0) ? 20 : 8,
                                right: (index == (3 - 1)) ? 20 : 2,
                              ),
                              child: const MovieLoadingCard(),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const LoadingText(width: 125),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: size.width,
                        height: 100,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: (index == 0) ? 20 : 8,
                                right: (index == (3 - 1)) ? 20 : 2,
                              ),
                              child: const CircleAvatar(
                                backgroundColor: MyColors.secondaryBackground,
                                radius: 40,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: MyColors.background,
              body: SafeArea(
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
                          BlocProvider.of<HomeBloc>(context)
                              .add(LoadHomeData());
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
          }
        },
      ),
    );
  }
}
