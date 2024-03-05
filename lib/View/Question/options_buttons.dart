import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constant/Style/text_style.dart';
import 'package:flutter_application_1/Constant/coloers.dart';
import 'package:flutter_application_1/Constant/size_confgr.dart';

class OptionsButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const OptionsButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final width = SizeConfig(context).width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, 50),
        elevation: 4,
        backgroundColor: ColorsQuizz.primarycolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: mediumtextstyle,
      ),
    );
  }
}
