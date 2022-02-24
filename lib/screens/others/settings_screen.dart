import 'package:flutter/material.dart';
import 'package:movie_review/utils/colors/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Dark mode",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Switch(
                      value: isDark,
                      onChanged: (value) {
                        setState(() {
                          isDark = !isDark;
                        });
                      },
                      activeColor: MyColors.primaryButtonColor,
                      activeTrackColor: MyColors.secondaryBackground,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: MyColors.secondaryBackground,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
