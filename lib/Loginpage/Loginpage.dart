import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeCategory.dart';
import 'package:flutter_application_1/Provider%20class/provider.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => MyWidgetState();
}

class MyWidgetState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();
   
  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen(
      (event) {
        setState(
          () {
            _user = event;
          },
        );
      },
    );
  }

  String userName = "Naheel";
  String password = "123";

  @override
  Widget build(BuildContext context) {
    final stateprovider = Provider.of<Stateprovider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 249, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.12,
              child: Center(
                child: Text(
                  "QUIZ GAME",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.18,
              child: TextField(
                controller: stateprovider.namecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    filled: true,
                    fillColor: Color.fromARGB(198, 255, 255, 255),
                    labelText: 'Type your User name "Naheel"',
                    contentPadding: EdgeInsets.only(left: 30, top: 40)),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.18,
              child: TextField(
                obscureText: true,
                controller: stateprovider.passwordcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 20, color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(50)),
                    filled: true,
                    fillColor: Color.fromARGB(198, 255, 255, 255),
                    labelText: 'Type your Password "123"',
                    contentPadding: EdgeInsets.only(left: 30, top: 40)),
              ),
            ),
            SizedBox(height: 30),
            Consumer<Stateprovider>(builder: (context, value, child) {
              return TextButton(
                style: TextButton.styleFrom(
                    fixedSize: Size.fromWidth(
                        MediaQuery.of(context).size.width / 1.33),
                    shape: StadiumBorder(),
                    backgroundColor: Color.fromARGB(255, 0, 0, 0)),
                onPressed: () {
                  if (stateprovider.namecontroller.text == userName &&
                      stateprovider.passwordcontroller.text == password) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeCategory(),
                      ),
                    );
                    stateprovider.addlogin(stateprovider.namecontroller.text,
                        stateprovider.passwordcontroller.text);
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              );
            }),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // _user != null ? userInfo() : googleSignIn(),
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    radius: 20,
                    child: Image.asset("assets/images/Google.png",
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Text(
          "POWERED BY\nEDAPT",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }

  Widget userInfo() {
    return Center(
      child: Text("Error"),
    );
  }

  // Widget googleSignIn() {
  //   return SizedBox(
  //     height: 50,
  //     child: SignInButton(Buttons.google, onPressed: () {
  //       handleGoogleSignIn();
  //     }),
  //   );
  // }

  void handleGoogleSignIn() {
    try {
      GoogleAuthProvider googleprovider = GoogleAuthProvider();
      _auth.signInWithProvider(googleprovider);
    } catch (error) {
      print("error");
    }
  }
}
