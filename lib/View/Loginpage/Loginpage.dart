import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constant/size_confgr.dart';
import 'package:flutter_application_1/Constant/sized_box.dart';
import 'package:flutter_application_1/View/Home/home_screen.dart';
import 'package:flutter_application_1/View/Widgets/text_button.dart';
import 'package:flutter_application_1/View/Loginpage/text_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => MyWidgetState();
}

class MyWidgetState extends State<LoginPage> {
  TextEditingController userNamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String userName = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final height = SizeConfig(context).height;
    final width = SizeConfig(context).width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          sizedbox(height / 1.6, width),
          LoginTextfield(
              controller: userNamecontroller,
              hintText: 'Enter Your UserName',
              prefixIcon: Icon(Icons.person_outline),
              obscuretxt: false),
          sizedbox(23, 0),
          LoginTextfield(
              controller: passwordcontroller,
              hintText: 'Enter Your Password',
              prefixIcon: Icon(Icons.lock_outline),
              obscuretxt: true),
          sizedbox(30, 0),
          TextButtondApp(
            text: 'Login',
            circularBorder: 50,
            width: width * .7,
            height: 40,
            onPressed: () {
              if (userNamecontroller.text == userName &&
                  passwordcontroller.text == password) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeCategory()),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
