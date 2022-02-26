import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Notifications",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              EvaIcons.heart,
              color: Colors.red,
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
