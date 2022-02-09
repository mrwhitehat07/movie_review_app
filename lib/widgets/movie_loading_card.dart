import 'package:flutter/material.dart';
import 'package:movie_review/utils/colors/colors.dart';

class MovieLoadingCard extends StatelessWidget {
  const MovieLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 160,
          height: 150,
          decoration: BoxDecoration(
            color: MyColors.secondaryBackground,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: 125,
          height: 15,
          decoration: BoxDecoration(
            color: MyColors.secondaryBackground,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: 100,
          height: 15,
          decoration: BoxDecoration(
            color: MyColors.secondaryBackground,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
