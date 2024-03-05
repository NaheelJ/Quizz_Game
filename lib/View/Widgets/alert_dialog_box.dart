import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constant/Style/text_style.dart';
import 'package:flutter_application_1/Constant/coloers.dart';

Future alertDialog(BuildContext context, VoidCallback onpressed, titleAlert,
    buttontext, yourAlert) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: AlertDialog(
          backgroundColor: ColorsQuizz.primarycolor,
          title: Text(titleAlert, style: largetextstyle),
          content: Text(yourAlert, style: mediumtextstyle),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel", style: mediumtextstyle),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: onpressed,
              child: Text(buttontext, style: mediumtextstyle),
            ),
          ],
        ),
      );
    },
  );
}