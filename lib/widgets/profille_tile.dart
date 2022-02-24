import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ProfileCardTile extends StatelessWidget {
  const ProfileCardTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: size.width,
        height: 60,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  fontSize: 16,
                ),
              ),
            ),
            Icon(
              EvaIcons.arrowIosForwardOutline,
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ],
        ),
      ),
    );
  }
}
