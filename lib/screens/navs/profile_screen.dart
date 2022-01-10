import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_review/data/models/profile_options_model.dart';
import 'package:movie_review/utils/colors/colors.dart';
import 'package:movie_review/widgets/profille_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(
                      "assets/images/profile.jpg",
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Cho Boah",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "choboah@gmail.com",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 20),
                ...options.map((option) {
                  return ProfileCardTile(
                    title: option.title,
                    icon: option.icon,
                    onTap: () {},
                  );
                }).toList(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: size.width,
                    height: 40,
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: const [
                        Icon(
                          EvaIcons.logOut,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
