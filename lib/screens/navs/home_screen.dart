import 'package:flutter/material.dart';
import 'package:movie_review/widgets/movie_card.dart';

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
              SizedBox(
                width: size.width,
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _popMovies.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: (index == 0) ? 20 : 2,
                          right: (index == (_popMovies.length - 1)) ? 20 : 2,
                        ),
                        child: MovieCard(
                          name: _popMovies[index],
                          releaseDate: _popMovies[index],
                        ),
                      );
                    }),
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
                    // const CircleAvatar(
                    //   radius: 40,
                    //   backgroundImage: AssetImage(
                    //     "assets/images/profile.jpg",
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
