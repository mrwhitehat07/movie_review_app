import 'package:flutter/material.dart';
import 'package:movie_review/utils/colors/colors.dart';
import 'package:movie_review/widgets/custom_input_box.dart';
import 'package:movie_review/widgets/movie_card.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final searchController = TextEditingController();
  List _popMovies = ["Kalle", "Vaale", "Salle", "Taale"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              )),
              const SizedBox(height: 20),
              SizedBox(
                width: size.width,
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _popMovies.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: (index == 0) ? 20 : 2,
                          right: (index == (_popMovies.length - 1)) ? 20 : 2,
                        ),
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: MyColors.primary,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.home,
                                color: Colors.white,
                              ),
                              Text(
                                "#action",
                                style: TextStyle(
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
  }
}
