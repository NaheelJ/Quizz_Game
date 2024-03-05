import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constant/Style/text_style.dart';
import 'package:flutter_application_1/Constant/coloers.dart';

class TextButtondApp extends StatelessWidget {
  final String text;
  final double circularBorder;
  final Color? backgroundcolor;
  final VoidCallback? onPressed;
  final double width;
  final double height;

  const TextButtondApp({
    super.key,
    required this.text,
    required this.circularBorder,
    this.backgroundcolor,
    this.onPressed,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: ColorsQuizz.buttonsColor,
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorder),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: buttonTextStyle,
      ),
    );
  }
}
