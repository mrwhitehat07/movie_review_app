import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_review/bloc/explore_bloc/explore_bloc.dart';
import 'package:movie_review/data/models/genre_model.dart';
import 'package:movie_review/screens/details/movie_grid_screen.dart';
import 'package:movie_review/screens/others/search_screen.dart';
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
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Theme.of(context).backgroundColor,
                automaticallyImplyLeading: false,
                title: Text(
                  "Discover",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: size.width * 0.90,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: "Search here...",
                              hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                              border: InputBorder.none,
                            ),
                            maxLines: 1,
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            onSubmitted: (value) {
                              Get.to(() =>
                                  SearchScreen(query: searchController.text));
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Genres",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
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
                                right: (index == (genres.length - 1)) ? 20 : 5,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.to(() =>
                                      MovieGridScreen(id: genres[index].id!, title: genres[index].title!));
                                },
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
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your searches",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                fontSize: 20,
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    "Clear all",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .color,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  Icon(
                                    EvaIcons.close,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .color,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is ExploreLoading) {
            return Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              body: const Center(
                child: CircularProgressIndicator(
                  color: MyColors.primaryButtonColor,
                  strokeWidth: 2,
                ),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              body: SafeArea(
                child: Center(
                  child: SizedBox(
                    width: size.width,
                    height: 200,
                    child: Column(
                      children: [
                        Text(
                          "Failed to load",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        OutlinedButton(
                          onPressed: () {
                            BlocProvider.of<ExploreBloc>(context)
                                .add(GetGenre());
                          },
                          child: Text(
                            "Refresh",
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
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
          }
        },
      ),
    );
  }
}
