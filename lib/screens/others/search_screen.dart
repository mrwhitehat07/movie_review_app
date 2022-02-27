import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_review/bloc/explore_bloc/explore_bloc.dart';
import 'package:movie_review/screens/details/celebs_detail_screen.dart';
import 'package:movie_review/screens/details/movie_detail_screen.dart';
import 'package:movie_review/utils/apis/apis.dart';
import 'package:movie_review/utils/colors/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
    required this.query,
  }) : super(key: key);
  final String query;
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  @override
  void initState() {
    setState(() {
      searchController.text = widget.query;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ExploreBloc()..add(Search(query: widget.query)),
      child: BlocConsumer<ExploreBloc, ExploreState>(
        listener: (context, state) {
          print(state.toString());
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).backgroundColor,
              title: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search here...",
                  hintStyle: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                  border: InputBorder.none,
                ),
                maxLines: 1,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
                onSubmitted: (value) {
                  BlocProvider.of<ExploreBloc>(context)
                      .add(Search(query: searchController.text));
                },
              ),
            ),
            body: SafeArea(
              child: (state is SearchList)
                  ? SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          (state.celebs.isNotEmpty)
                              ? (Column(
                                  children: [
                                    Container(
                                      width: size.width,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        "Celebrity",
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
                                    Container(
                                      padding: const EdgeInsets.only(left: 18),
                                      width: double.infinity,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                  margin: const EdgeInsets.only(
                                                      right: 10),
                                                  child: Column(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 50,
                                                        backgroundImage:
                                                            NetworkImage(
                                                                API.baseUrl +
                                                                    e.image!),
                                                        backgroundColor: Theme
                                                                .of(context)
                                                            .primaryColorLight,
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        "${e.fname} ${e.lname}",
                                                        style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .color,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                              : Container(),
                          const SizedBox(height: 20),
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
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  state.movie[index].name!,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                      ),
                    )
                  : Scaffold(
                      backgroundColor: Theme.of(context).backgroundColor,
                      body: const Center(
                        child: CircularProgressIndicator(
                          color: MyColors.primaryButtonColor,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
