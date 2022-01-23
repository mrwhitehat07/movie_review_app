import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  final String fieldName;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  const InputBox({
    Key? key,
    required this.fieldName,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  late bool isPassword;
  @override
  void initState() {
    super.initState();
    setState(() {
      isPassword = widget.isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
              ),
              child: TextFormField(
                controller: widget.controller,
                maxLines: 1,
                obscuringCharacter: '●',
                onChanged: (value) {},
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                validator: (value) {
                  (value == null || value.isEmpty)
                      ? "${widget.fieldName} can't be empty "
                      : null;
                },
                obscureText: isPassword,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText.toString(),
                  // errorText: "${widget.fieldName} can't be empty",
                  // errorStyle: const TextStyle(
                  //   color: Colors.red,
                  //   fontSize: 12,
                  // ),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 5,
              child: (widget.isPassword == true)
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: Icon(
                        (isPassword == true)
                            ? EvaIcons.eyeOffOutline
                            : EvaIcons.eyeOutline,
                        color: Colors.white,
                        size: 16,
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ],
    );
  }
}
