import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_review/bloc/notification_bloc/notification_bloc.dart';
import 'package:movie_review/screens/others/favourite_page.dart';
import 'package:movie_review/utils/colors/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => NotificationBloc(),
      child: Scaffold(
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
        ),
        body: BlocConsumer<NotificationBloc, NotificationState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is NotificationLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    ...state.notif.map((e) => ListTile(
                          leading: Icon(
                            EvaIcons.bell,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            size: 20,
                          ),
                          title: Text(
                            e.title!,
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                        ))
                  ],
                ),
              );
            } else if (state is NotificationLoading) {
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
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 20),
                          OutlinedButton(
                            onPressed: () {
                              BlocProvider.of<NotificationBloc>(context)
                                  .add(GetNotif());
                            },
                            child: Text(
                              "Refresh",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
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
      ),
    );
  }
}
