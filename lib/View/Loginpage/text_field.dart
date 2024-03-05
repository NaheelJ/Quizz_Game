import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constant/Style/text_style.dart';
import 'package:flutter_application_1/Constant/coloers.dart';

class LoginTextfield extends StatelessWidget {
  final TextEditingController controller;
  final bool obscuretxt;
  final String hintText;
  final Icon? prefixIcon;
  const LoginTextfield({
    super.key,
    required this.controller,
    required this.obscuretxt,
    required this.hintText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        obscureText: obscuretxt,
        controller: controller,
        decoration: InputDecoration(
          fillColor: ColorsQuizz.primarycolor,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 20, color: Color.fromARGB(255, 0, 0, 0)),
              borderRadius: BorderRadius.circular(50)),
          hintText: hintText,
          hintStyle: mediumtextstyle,
          labelStyle: mediumtextstyle,
        ),
      ),
    );
  }
}