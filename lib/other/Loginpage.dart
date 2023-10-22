import 'package:flutter/material.dart';
import 'package:flutter_application_1/other/HomeCategory.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> Usernamelist = [];
List<String> passwordlist = [];

class LoginPage extends StatefulWidget {
  final namecontroller = TextEditingController();
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => MyWidgetState();
}

final namecontroller = TextEditingController();
final passwordcontroller = TextEditingController();

class MyWidgetState extends State<LoginPage> {
  String UserName = "Naheel";
  String Password = "123";
  @override
  void initState() {
    super.initState();
    getloginData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 249, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                controller: namecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    filled: true,
                    fillColor: Color.fromARGB(198, 255, 255, 255),
                    labelText: "User Name",
                    contentPadding: EdgeInsets.only(left: 30, top: 40)),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.18,
              child: TextField(
                obscureText: true,
                
                controller: passwordcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 20, color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(50)),
                    filled: true,
                    fillColor: Color.fromARGB(198, 255, 255, 255),
                    labelText: "Password",
                    contentPadding: EdgeInsets.only(left: 30, top: 40)),
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              style: TextButton.styleFrom(
                  fixedSize: Size.fromWidth(MediaQuery.of(context).size.width / 1.33),
                  shape: StadiumBorder(),
                  backgroundColor: Color.fromARGB(255, 0, 0, 0)),
              onPressed: () {
                if (namecontroller.text == UserName &&
                    passwordcontroller.text == Password) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HomeCategory(Usernamelist: Usernamelist),
                    ),
                  );
                  addlogin(namecontroller.text, passwordcontroller.text);
                }
              },
              child: Text(
                "Login",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
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
          style: TextStyle(fontSize: 11, 
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }

  removeLogin() {
    Usernamelist.removeAt(0);
    passwordlist.removeAt(0);
  }

  Future<void> SaveLogindata() async {
    final pref = await SharedPreferences.getInstance();
    pref.setStringList('username', Usernamelist);
    pref.setStringList('pasword', passwordlist);
  }

  Future<void> getloginData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Usernamelist = pref.getStringList('username') ?? [];
    passwordlist = pref.getStringList('pasword') ?? [];
    print(Usernamelist);
    print(passwordlist);
    //await pref.clear();
  }

  addlogin(String user, String Pass) {
    Usernamelist.add(user);
    passwordlist.add(Pass);
    SaveLogindata();
  }
}
