import 'package:flutter/material.dart';
import 'package:flutter_application_1/Loginpage/Loginpage.dart';
import 'package:flutter_application_1/Provider%20class/provider.dart';
import 'package:provider/provider.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => ProfilepageState();
}

class ProfilepageState extends State<Profilepage> {
  Stateprovider provider = Stateprovider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: 40),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 72, 74, 84),
                  borderRadius: BorderRadius.circular(100),
                  border:
                      Border.all(width: 5, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                child: Icon(Icons.person, size: 100),
              ),
              SizedBox(height: 50),
              Consumer<Stateprovider>(builder: (context, value, child) {
                return ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (Route<dynamic> route) => false);
                          value.removeLogin();
                    },
                    child: Text("Log out"));
              }),
            ],
          ),
        ],
      ),
    );
  }
}
