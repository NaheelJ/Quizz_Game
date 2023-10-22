import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/other/HomeCategory.dart';
import 'package:flutter_application_1/other/Loginpage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  bool isloading = false;
  MyWidgetState login = MyWidgetState();
  @override
  void initState() {
    super.initState();
    login.getloginData();

    Timer(
      Duration(seconds: 2),
      () {
        if (Usernamelist.isEmpty && passwordlist.isEmpty) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  HomeCategory(Usernamelist: Usernamelist),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/splashsingle.png"),
                  fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height / 10),
                  width: 400,
                  height: 230,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Quizzforsplash.png'),fit: BoxFit.fill)),
                ),
                Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height / 5.6),
                  child: CircularProgressIndicator(color: Color.fromARGB(255, 255, 255, 255)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
