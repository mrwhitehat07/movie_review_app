import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_review/bloc/explore_bloc/explore_bloc.dart';
import 'package:movie_review/data/models/genre_model.dart';
import 'package:movie_review/utils/colors/colors.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ExploreBloc()..add(GetGenre()),
      child: BlocConsumer<ExploreBloc, ExploreState>(
        listener: (context, state) {
          print(state.toString());
        },
        builder: (context, state) {
          if (state is ExploreLoaded) {
            List<Genre> genres = state.genre;
            return Scaffold(
              backgroundColor: Colors.black,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: size.width * 0.90,
                          decoration: BoxDecoration(
                            color: MyColors.secondaryBackground,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          child: TextField(
                            controller: searchController,
                            decoration: const InputDecoration(
                              hintText: "Search here...",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                            ),
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20),
                        child: const Text(
                          "Genres",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: size.width,
                        height: 100,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: genres.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: (index == 0) ? 20 : 5,
                                  right:
                                      (index == (genres.length - 1)) ? 20 : 5,
                                ),
                                child: Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 3,
                                      color: const Color(0xFF61FFEF),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "#${genres[index].title}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: CircularProgressIndicator(
                  color: MyColors.primaryButtonColor,
                  strokeWidth: 2,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
