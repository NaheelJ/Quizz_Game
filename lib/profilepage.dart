import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/Loginpage/Loginpage.dart';
import 'package:flutter_application_1/View%20Model/Provider%20class/provider.dart';
import 'package:provider/provider.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => ProfilepageState();
}

class ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: 40),
              CircleAvatar(
                  radius: 75,
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  child: CircleAvatar(
                      radius: 72.5,
                      backgroundImage: AssetImage(
                        "assets/images/person.png",
                      ))),
              SizedBox(height: height / 30),
              Column(
                children: [
                  Text("user not found", style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: height / 30),
              Consumer<Stateprovider>(
                builder: (context, value, child) {
                  return ElevatedButton(
                      style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(Size(width / 1.2, 35)),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 255, 255, 255))),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (Route<dynamic> route) => false);
                          value.removeLogin();
                      },
                      child: Text(
                        "Log out",
                        style: TextStyle(color: Colors.black),
                      ));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
