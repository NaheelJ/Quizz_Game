import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider%20class/provider.dart';
import 'package:flutter_application_1/other/Loginpage.dart';
import 'package:flutter_application_1/other/list.dart';
import 'package:flutter_application_1/resultspages/result.dart';
import 'package:provider/provider.dart';

class LogicQuestion extends StatefulWidget {
  LogicQuestion({super.key, required namecontroller});

  @override
  State<LogicQuestion> createState() => _Question1State();
}

class _Question1State extends State<LogicQuestion> {
  int logicQuestionsindex = 0;
  int logicoptionsindex = 0;
  Color containercolora = Color.fromARGB(255, 255, 255, 255);
  Color containercolorb = Color.fromARGB(255, 255, 255, 255);
  Color containercolorc = Color.fromARGB(255, 255, 255, 255);
  Color containercolord = Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 244),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              width: 380,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color.fromARGB(255, 38, 37, 107)),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: ListView(
                  padding: EdgeInsets.symmetric(
                    vertical: 120,
                  ),
                  children: [
                    Text(
                      logicQuestions[logicQuestionsindex]
                          .question!, //question
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                    Text(
                      "?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ]),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: containercolora,
                  fixedSize: Size(330, 50),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: BorderSide(
                      width: .5, color: Color.fromARGB(255, 38, 37, 107))),
              onPressed: () {
                corectanswer(0);
              },
              child: Center(
                child: Text(
                  logicoptions[logicoptionsindex].option![0],
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: containercolorb,
                  fixedSize: Size(330, 50),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: BorderSide(
                      width: .5, color: Color.fromARGB(255, 38, 37, 107))),
              onPressed: () {
                corectanswer(1);
              },
              child: Center(
                child: Text(
                  logicoptions[logicoptionsindex].option![1],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: containercolorb,
                  fixedSize: Size(330, 50),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: BorderSide(
                      width: .5, color: Color.fromARGB(255, 38, 37, 107))),
              onPressed: () {
                corectanswer(2);
              },
              child: Center(
                child: Text(
                  logicoptions[logicoptionsindex].option![2],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: containercolorb,
                  fixedSize: Size(330, 50),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: BorderSide(
                      width: .5, color: Color.fromARGB(255, 38, 37, 107))),
              onPressed: () {
                corectanswer(3);
              },
              child: Center(
                child: Text(
                  logicoptions[logicoptionsindex].option![3],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void corectanswer(int selectedanswer) {
    int? rightAnswer = logicoptions[logicoptionsindex].answer;
    if (selectedanswer == rightAnswer) {
      setState(() {
        Provider.of<Stateprovider>(context,listen: false).score++;
        nextquestion(namecontroller);
      });
    } else {
      nextquestion(namecontroller);
    }
  }

  void nextquestion(namecontroller) {
    if (logicQuestionsindex < question.length - 1) {
      setState(
        () {
          logicQuestionsindex++;
          logicoptionsindex++;
        },
      );
    } else {
      setState(
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (ctx) => End(namecontroller)),
          );
        },
      );
    }
  }
}
