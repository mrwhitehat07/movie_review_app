import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_review/widgets/profille_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Settings"
          
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileCardTile(
                title: "Dark Mode",
                icon: Icons.light,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
