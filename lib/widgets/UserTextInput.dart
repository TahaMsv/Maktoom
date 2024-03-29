import 'package:flutter/material.dart';

import '../core/utils/MultiLanguages.dart';

class UserTextInput extends StatelessWidget {
  const UserTextInput({
    Key? key,
    required this.controller,
    required this.hint,
    this.height = 40,
    this.errorText = "",
    this.isEmpty = false,
    this.obscureText = false,
    this.width = 400,
    this.fontSize = 15,
    this.hintColor = Colors.black,
    this.textColor = Colors.black,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final String errorText;
  final bool isEmpty;
  final double height;
  final double width;
  final bool obscureText;
  final double fontSize;
  final Color hintColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    // String languageCode = MultiLanguages.of(context)!.locale.languageCode;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffeaeaea),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Center(
        child: TextField(
          obscureText: obscureText,
          textAlignVertical: TextAlignVertical.center,
          controller: controller,
          style: TextStyle(fontSize: fontSize, color: textColor),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10.0),
            border: InputBorder.none,
            hintStyle: TextStyle(color: hintColor),
            hintText: hint,
            errorText: isEmpty ? errorText : null,
          ),
        ),
      ),
    );
  }
}
