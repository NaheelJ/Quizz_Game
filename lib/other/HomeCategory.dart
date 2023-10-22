import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/Provider%20class/provider.dart';
import 'package:flutter_application_1/catogary/Logicquestion.dart';
import 'package:flutter_application_1/catogary/Sportsquistions.dart';
import 'package:flutter_application_1/catogary/entertainment.dart';
import 'package:flutter_application_1/catogary/technowlwdgy&sciense.dart';
import 'package:flutter_application_1/other/History.dart';
import 'package:flutter_application_1/other/Loginpage.dart';
import 'package:flutter_application_1/other/profilepage.dart';
import 'package:provider/provider.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({
    super.key, required List<String> Usernamelist
    
  });

  @override
  State<HomeCategory> createState() => _CategoryState();
}

class _CategoryState extends State<HomeCategory> {
  MyWidgetState login = MyWidgetState();
  @override
  void initState() {
    super.initState();
    login.getloginData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 113, 80, 80),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
              width: MediaQuery.of(context).size.width,
              height: 700,
              decoration: ShapeDecoration(
                color: Color.fromARGB(255, 229, 231, 246),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.50,
              decoration: ShapeDecoration(
                color: Color.fromARGB(255, 6, 22, 51),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height / 9.5),
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(144, 114, 114, 114),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 255, 255, 255))),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profilepage()));
                            },
                            icon: Icon(
                              Icons.person,
                              size: 30,
                            ))),
                    SizedBox(width: 15),
                    Text(
                      namecontroller.text,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 6.69,
              left: 10,
              right: 10,
              child: Container(
                height: MediaQuery.of(context).size.height / 3.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(23))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image(
                    image: AssetImage(
                      "assets/images/diplayimage n.jpg",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2.30,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Quiz Categories",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => History())));
                    },
                    icon: Icon(
                      Icons.history,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.93,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Consumer<Stateprovider>(builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Question(
                                        namecontroller: namecontroller)));
                            value.scoreclear();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3.55,
                            height: MediaQuery.of(context).size.height / 5.82,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 255, 255, 255)),
                            child: Column(
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 4.8,
                                    height: MediaQuery.of(context).size.height /
                                        9.23,
                                    child: Image.asset(
                                        "assets/images/technolodgy.png")),
                                Text(
                                  "Science & Technowledgy",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      SizedBox(width: 15),
                      Consumer<Stateprovider>(builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => sportsQuestions(
                                        namecontroller: namecontroller)));
                            value.scoreclear();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3.55,
                            height: MediaQuery.of(context).size.height / 5.82,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    const Color.fromARGB(255, 255, 255, 255)),
                            child: Column(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 4.8,
                                  height:
                                      MediaQuery.of(context).size.height / 8.1,
                                  child: Image.asset("assets/images/sports.png",
                                      fit: BoxFit.cover),
                                ),
                                Text(
                                  "Sports",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      SizedBox(width: 15),
                      Consumer<Stateprovider>(
                        builder: (context, value, child) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogicQuestion(
                                          namecontroller: namecontroller)));
                              value.scoreclear();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3.55,
                              height: MediaQuery.of(context).size.height / 5.82,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              child: Column(
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          4.8,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              8.1,
                                      child: Image.asset(
                                        "assets/images/matamatics.png",
                                        fit: BoxFit.cover,
                                      )),
                                  Text(
                                    "Logics",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.39,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Consumer<Stateprovider>(builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EntertainmentQuestion(
                                        namecontroller: namecontroller)));
                            value.scoreclear();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3.55,
                            height: MediaQuery.of(context).size.height / 5.82,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    const Color.fromARGB(255, 255, 255, 255)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          4.8,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              9.1,
                                      child: Image.asset(
                                          "assets/images/entertaiment.png",
                                          fit: BoxFit.fill)),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Entertaiment",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3.55,
                          height: MediaQuery.of(context).size.height / 5.82,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 255, 255, 255)),
                          child: Column(
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 4.8,
                                  height:
                                      MediaQuery.of(context).size.height / 9.4,
                                  child: Image.asset(
                                    "assets/images/general.png",
                                    fit: BoxFit.cover,
                                  )),
                              Text(
                                "General Knowledge",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3.55,
                          height: MediaQuery.of(context).size.height / 5.82,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 255, 255, 255)),
                          child: Column(
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 4.8,
                                  height:
                                      MediaQuery.of(context).size.height / 8.4,
                                  child: Image.asset(
                                    "assets/images/arts.png",
                                    fit: BoxFit.cover,
                                  )),
                              Text(
                                "ART",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: MediaQuery.of(context).size.height / 12,
        backgroundColor: Color.fromARGB(255, 193, 206, 229),
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.person_search, size: 30),
          Icon(Icons.list, size: 30),
        ],
        onTap: (index) {},
      ),
    );
  }
}
