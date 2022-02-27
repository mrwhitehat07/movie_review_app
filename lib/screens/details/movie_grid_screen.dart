import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_review/bloc/explore_bloc/explore_bloc.dart';
import 'package:movie_review/screens/details/movie_detail_screen.dart';
import 'package:movie_review/utils/apis/apis.dart';
import 'package:movie_review/utils/colors/colors.dart';

class MovieGridScreen extends StatefulWidget {
  const MovieGridScreen({
    Key? key,
    required this.id,
    required this.title,
  }) : super(key: key);
  final int id;
  final String title;
  @override
  _MovieGridScreenState createState() => _MovieGridScreenState();
}

class _MovieGridScreenState extends State<MovieGridScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => ExploreBloc()..add(GetMovieByGenre(id: widget.id)),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            widget.title,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        ),
        body: BlocConsumer<ExploreBloc, ExploreState>(
          listener: (context, state) {
            print(state.toString());
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: (state is GenreMovieList)
                  ? Column(
                      children: [
                        (state.movie.isNotEmpty)
                            ? (Column(
                                children: [
                                  Container(
                                    width: size.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      "Movies",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: size.width * 0.5,
                                        mainAxisExtent: 180,
                                        childAspectRatio: 1,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                      ),
                                      itemCount: state.movie.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Get.to(() => MovieDetailScreen(
                                                id: state.movie[index].id!));
                                          },
                                          focusColor: Theme.of(context)
                                              .primaryColorLight,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: size.width / 2,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColorLight,
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        API.baseUrl +
                                                            state.movie[index]
                                                                .poster!),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                state.movie[index].name!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ))
                            : Container()
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: MyColors.primaryButtonColor,
                        strokeWidth: 2,
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
