import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeCategory.dart';
import 'package:flutter_application_1/Loginpage/Loginpage.dart';
import 'package:flutter_application_1/Provider%20class/provider.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  
  @override
  void initState() {
    super.initState();
    getloginData();

    Timer(
      Duration(seconds: 2),
      () {
        if (usernamelist.isNotEmpty && passwordlist.isNotEmpty) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeCategory(),
              ));
          } else if (auth.currentUser != null) {
           Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeCategory(),
              ));
       }
         else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage()
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 30,
          height: 30,
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 5.6),
          child: CircularProgressIndicator(
            color: Color.fromARGB(255, 0, 238, 255)),
        ),
      ),
    );
  }
}
