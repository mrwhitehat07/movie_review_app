import 'package:flutter/material.dart';
import 'package:movie_review/utils/colors/colors.dart';

class CustomInputBox extends StatelessWidget {
  const CustomInputBox({
    Key? key,
    required this.controller,
    required this.hint,
    required this.fieldName,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final String fieldName;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: size.width * 0.90,
          decoration: BoxDecoration(
            color: MyColors.secondaryBackground,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 2,
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
            keyboardType: inputType,
            maxLines: 1,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
