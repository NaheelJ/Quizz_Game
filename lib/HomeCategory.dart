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
   final pagecontroller = PageController();
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
                child: Consumer<Stateprovider>(
                  builder: (context, value, child) {
                    return Row(
                      children: [
                        SizedBox(width: 15),
                        Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(144, 114, 114, 114),
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: Color.fromARGB(255, 255, 255, 255))),
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
                          usernamelist[0],
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    );
                  },
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) =>
                              History(scores: [], storedTimes: [])),
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
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Question(
                                        optionslist: scienceoption,
                                        questionlist: sciencequestion,
                                      ),
                                    ),
                                  );
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
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Question(
                                          optionslist: sportsoptions,
                                          questionlist: sportsQuestions,
                                        ),
                                      ));
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
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question(
                                                optionslist: logicoptions,
                                                questionlist: logicQuestions,
                                              )));
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
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Question(
                                              optionslist: entertainmentoption,
                                              questionlist:
                                                  entertainmentQuestions,
                                            )));
                                value.scoreclear();
                              },
                              imagepath: "assets/images/entertaiment.png",
                              text: "Entertaiment",
                            );
                          }),
                          SizedBox(width: 15),
                          Consumer<Stateprovider>(
                              builder: (context, value, child) {
                            return CardWidget(
                                onTap: () {
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
            pagecontroller.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.bounceOut);
        },
      ),
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
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 4.8,
                height: MediaQuery.of(context).size.height / 9.23,
                child: Image.asset(imagepath)),
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

// class Curvednavigationbar extends StatefulWidget {
//   const Curvednavigationbar({super.key});

//   @override
//   State<Curvednavigationbar> createState() => CurvednavigationbarState();
// }

// class CurvednavigationbarState extends State<Curvednavigationbar> {
//   final pagecontroller = PageController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: PageView(
//             controller: pagecontroller,
//             children: [HomeCategory(), History(scores: [], storedTimes: [])]),
//         bottomNavigationBar: CurvedNavigationBar(
//           height: MediaQuery.of(context).size.height / 12,
//           backgroundColor: Color.fromARGB(255, 193, 206, 229),
//           items: <Widget>[
//             Icon(Icons.home, size: 30),
//             Icon(Icons.person_search, size: 30),
//             Icon(Icons.list, size: 30),
//           ],
//           onTap: (index) {
//             pagecontroller.animateToPage(index,
//                 duration: Duration(milliseconds: 300), curve: Curves.bounceOut);
//           },
//         ));
//   }
// }
