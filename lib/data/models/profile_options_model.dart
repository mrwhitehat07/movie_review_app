import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movie_review/routes/route.dart';

class ProfileOptions {
  final String title;
  final IconData icon;
  final String route;
  const ProfileOptions({
    required this.title,
    required this.icon,
    required this.route,
  });
}

List<ProfileOptions> options = const [
  ProfileOptions(
    title: "Edit Profile",
    icon: EvaIcons.person,
    route: MyRoutes.profileEdit,
  ),
  ProfileOptions(
    title: "Change Password",
    icon: EvaIcons.lock,
    route: "/",
  ),
  ProfileOptions(
    title: "Settings",
    icon: EvaIcons.settings,
    route: "/",
  ),
];
