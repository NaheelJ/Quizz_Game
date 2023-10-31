import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeCategory.dart';
import 'package:flutter_application_1/Provider%20class/provider.dart';
import 'package:flutter_application_1/Question.dart';
import 'package:flutter_application_1/ScoreList/History.dart';
import 'package:flutter_application_1/listmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Resultpage extends StatefulWidget {
  List<Quizz> questionlist = [];
  List<Quizz> optionslist = [];
  List<int> scores = [];
  Resultpage(
      {required this.questionlist, required this.optionslist, super.key});

  @override
  State<Resultpage> createState() => MyWidgetState();
}

class MyWidgetState extends State<Resultpage> {
  List<String> storedTimes = [];
  @override
  Widget build(BuildContext context) {
    saveQuizResult();
    saveTimeAndDate();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 226, 246),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.height,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(width: 1, color: Color.fromARGB(197, 34, 34, 53)),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Column(
            children: [
              score < 3
                  ? Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 230,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/lose.jpg",
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 230,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/Win.jpg",
                        ),
                      ),
                    ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Quiz Completed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Mr : ",
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Text(
                              usernamelist[0],
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Your Score\n$score',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color:  Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              TextButton(
                style: TextButton.styleFrom(
                    fixedSize: Size.fromWidth(200),
                    shape: StadiumBorder(),
                    backgroundColor: Color.fromARGB(255, 0, 0, 0)),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => HomeCategory())));
                },
                child: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 5),
              SizedBox(width: 68),
              Consumer<Stateprovider>(
                builder: (context, value, child) {
                  return TextButton(
                    style: TextButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Color.fromARGB(255, 0, 0, 0),
                      fixedSize: Size.copy(
                        Size.fromWidth(200),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Question(
                                  optionslist: widget.optionslist,
                                  questionlist: widget.questionlist))));
                      value.scoreclear();
                    },
                    child: Text(
                      "Retry",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => History(scores: widget.scores, storedTimes: storedTimes)),
                    ),
                  );
                },
                icon: Icon(
                  Icons.history,
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 34,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveQuizResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userScoresString = prefs.getString('scores');
    if (userScoresString != null) {
      widget.scores =
          userScoresString.split(',').map((s) => int.tryParse(s) ?? 0).toList();
    }
    widget.scores.add(score);
    //await prefs.clear();
    prefs.setString('scores', widget.scores.join(','));
    //print(widget.scores);
  }
  Future<void> saveTimeAndDate() async {
    final now = DateTime.now();
    final prefs = await SharedPreferences.getInstance();
    storedTimes = prefs.getStringList('storedTimes') ?? [];
    storedTimes.add(now.toString());
    await prefs.setStringList('storedTimes', storedTimes);
    //await prefs.clear(); //to rest the saved preference
    //print(storedTimes);
  }
}
