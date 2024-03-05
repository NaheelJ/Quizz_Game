import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constant/Style/text_style.dart';
import 'package:flutter_application_1/Constant/sized_box.dart';
import 'package:flutter_application_1/View%20Model/Provider%20class/provider.dart';
import 'package:flutter_application_1/View/Widgets/alert_dialog_box.dart';
import 'package:provider/provider.dart';

class CardWidgets extends StatelessWidget {
  final String text;
  final String imagepath;
  final Widget page;
  final String titleAlert;
  final String buttontext;
  final String yourAlert;
  const CardWidgets({
    super.key,
    required this.text,
    required this.imagepath,
    required this.page,
    required this.titleAlert,
    required this.buttontext,
    required this.yourAlert,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Stateprovider>(
      builder: (context, value, child) => InkWell(
        onTap: () {
          alertDialog(context, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => page,
              ),
            );
            value.scoreclear();
          }, titleAlert, buttontext, yourAlert);
        },
        child: Card(
          elevation: 4,
          shadowColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(imagepath)),
                sizedbox(3, 0),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: smalltextstyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
