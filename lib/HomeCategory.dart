import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/Provider%20class/provider.dart';
import 'package:flutter_application_1/Question.dart';
import 'package:flutter_application_1/ScoreList/History.dart';
import 'package:flutter_application_1/list.dart';
import 'package:flutter_application_1/profilepage.dart';
import 'package:provider/provider.dart';

class HomeCategory extends StatefulWidget {
  HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _CategoryState();
}

class _CategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;
    final String? photoUrl = user?.photoURL;
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
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height / 9.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profilepage(),
                                ));
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor:  Color.fromARGB(255, 255, 255, 255),
                              child: user != null
                                  ? CircleAvatar(
                                      radius: 23.5,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(photoUrl!))
                                  : CircleAvatar(
                                      radius: 23.5,
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage(
                                        "assets/images/person.png",
                                      ))),
                        ),
                        SizedBox(width: 15),
                        if (user != null || usernamelist.isNotEmpty)
                          Text(
                            user?.displayName ?? usernamelist[0],
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        else
                          Text(
                            "Username isempty",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 6.69,
              left: 15,
              right: 15,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => History()),
                        ),
                      );
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
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Consumer<Stateprovider>(
                              builder: (context, value, child) {
                            return CardWidget(
                                onTap: () {
                                  alertDialog(context, () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Question(
                                          optionslist: scienceoption,
                                          questionlist: sciencequestion,
                                        ),
                                      ),
                                    );
                                  },"Science & Techknowledgy Quizz", "START","Do You Want To Start Quizz!");

                                  value.scoreclear();
                                },
                                imagepath: "assets/images/technolodgy.png",
                                text: "Science & Technowledgy");
                          }),
                          SizedBox(width: 15),
                          Consumer<Stateprovider>(
                              builder: (context, value, child) {
                            return CardWidget(
                                onTap: () {
                                  alertDialog(context, () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Question(
                                                  optionslist: sportsoptions,
                                                  questionlist: sportsQuestions,
                                                )));
                                  },"Sports Quizz", "START","Do You Want To Start Quizz!");
                                  value.scoreclear();
                                },
                                imagepath: "assets/images/sports.png",
                                text: "Sports");
                          }),
                          SizedBox(width: 15),
                          Consumer<Stateprovider>(
                              builder: (context, value, child) {
                            return CardWidget(
                                onTap: () {
                                  alertDialog(context, () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Question(
                                                  optionslist: logicoptions,
                                                  questionlist: logicQuestions,
                                                )));
                                  },"Logic Quizz", "START","Do You Want To Start Quizz!");

                                  value.scoreclear();
                                },
                                imagepath: "assets/images/matamatics.png",
                                text: "Logics");
                          }),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Consumer<Stateprovider>(
                              builder: (context, value, child) {
                            return CardWidget(
                              onTap: () {
                                alertDialog(context, () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question(
                                                optionslist:
                                                    entertainmentoption,
                                                questionlist:
                                                    entertainmentQuestions,
                                              )));
                                },"Entertainment Quizz", "START","Do You Want To Start Quizz!");

                                value.scoreclear();
                              },
                              imagepath: "assets/images/entertaiment.png",
                              text: "Entertainment",
                            );
                          }),
                          SizedBox(width: 15),
                          Consumer<Stateprovider>(
                              builder: (context, value, child) {
                            return CardWidget(
                                onTap: () {
                                 alertDialog(context, () { }, "General Knowledge Quizz", "START","Do You Want To Start Quizz!"
                                  );
                                  value.scoreclear();
                                },
                                imagepath: "assets/images/general.png",
                                text: "General Knowledge");
                          }),
                          SizedBox(width: 15),
                          Consumer<Stateprovider>(
                              builder: (context, value, child) {
                            return CardWidget(
                                onTap: () {
                                  alertDialog(context, () { }, "ART Quizz", "START","Do You Want To Start Quizz!",
                                  );
                                  value.scoreclear();
                                },
                                imagepath: "assets/images/arts.png",
                                text: "ART");
                          })
                        ],
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
        onTap: (index) {
          // pagecontroller.animateToPage(index,
          //     duration: Duration(milliseconds: 300), curve: Curves.bounceOut);
        },
      ),
    );
  }

  Future alertDialog(BuildContext context, VoidCallback onpressed,titleAlert,buttontext,yourAlert) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            backgroundColor: Color.fromARGB(255, 13, 13, 18),
            title: Text(
              titleAlert,
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              yourAlert,
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                onPressed: onpressed,
                child: Text(
                  buttontext,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CardWidget extends StatelessWidget {
  final String imagepath;
  final String text;
  final VoidCallback onTap;
  CardWidget({
    super.key,
    required this.imagepath,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.55,
        height: MediaQuery.of(context).size.height / 5.82,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 255, 255, 255)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 4.8,
                height: MediaQuery.of(context).size.height / 9.23,
                child: Image.asset(imagepath)),
            SizedBox(height: 5),
            Text(
              text,
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
  }
}
