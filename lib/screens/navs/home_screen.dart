import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_review/bloc/home_bloc/home_bloc.dart';
import 'package:movie_review/screens/other/movie_detail_screen.dart';
import 'package:movie_review/utils/apis/apis.dart';
import 'package:movie_review/widgets/movie_card.dart';
import 'package:movie_review/widgets/movie_loading_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _popMovies = ["Kalle", "Vaale", "Salle", "Taale"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadHomeData()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          debugPrint(state.toString());
        },
        builder: (context, state) {
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
                                    right: (index == (state.movies.length - 1))
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ..._popMovies.map(
                            (e) => const CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                "assets/images/profile.jpg",
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
