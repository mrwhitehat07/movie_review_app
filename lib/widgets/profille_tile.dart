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
        // color: AstralColor.black,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                EvaIcons.arrowIosForwardOutline,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}