import 'package:flutter/material.dart';
import 'package:flutter_application_1/other/Loginpage.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => ProfilepageState();
}

class ProfilepageState extends State<Profilepage> {
  MyWidgetState login = MyWidgetState();
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
                  border: Border.all(width: 5, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                child: Icon(Icons.person, size: 100),
              ),
              SizedBox(height: 50),
              ElevatedButton(style: ButtonStyle( 
                backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route<dynamic> route) => false);

                    setState(() {
                      namecontroller.clear();
                      passwordcontroller.clear();
                      login.removeLogin();
                    });
                  },
                  child: Text("log out")),
            ],
          ),
        ],
      ),
    );
  }
}
