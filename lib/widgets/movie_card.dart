import 'package:flutter/material.dart';
import 'package:movie_review/utils/colors/colors.dart';
import 'package:intl/intl.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.name,
    required this.image,
    required this.releaseDate,
    required this.onTap,
  }) : super(key: key);

  final String name;
  final String releaseDate;
  final String image;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      focusColor: Theme.of(context).primaryColorLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 150,
            decoration: BoxDecoration(
              color: MyColors.secondaryBackground,
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            DateFormat.yMMMd().format(DateTime.parse(releaseDate)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
