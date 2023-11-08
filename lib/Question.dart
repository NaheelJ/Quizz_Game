import 'package:flutter/material.dart';
import 'package:flutter_application_1/listmodel.dart';
import 'package:flutter_application_1/result.dart';
import 'package:provider/provider.dart';
import 'Provider class/provider.dart';

// ignore: must_be_immutable
class Question extends StatefulWidget {
  List<Quizz> questionlist = [];
  List<Quizz> optionslist = [];

  Question({
    super.key,
    required this.optionslist,
    required this.questionlist,
  });

  @override
  State<Question> createState() => Question1State();
}

class Question1State extends State<Question> {
  //colors of containers with afunction but still not working
  Color containercolora = Color.fromARGB(255, 255, 255, 255);
  Color containercolorb = Color.fromARGB(255, 255, 255, 255);
  Color containercolorc = Color.fromARGB(255, 255, 255, 255);
  Color containercolord = Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 244),
      body: Center(
        child: Consumer<Stateprovider>(
          builder: (context, value, child) {
            return Column(
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
                          widget.questionlist[questionindex].question!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        SizedBox(),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 50)),
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
                            width: .5,
                            color: Color.fromARGB(255, 38, 37, 107))),
                    onPressed: () {
                      corectanswer(0);
                      if (Optionsindex < widget.questionlist.length - 1) {
                        value.OptionIncrement();
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => Resultpage(
                              optionslist: widget.optionslist,
                              questionlist: widget.questionlist,
                            ),
                          ),
                        );
                      }
                    },
                    child: Center(
                      child: Text(
                        widget.optionslist[Optionsindex].option![0],
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
                              width: .5,
                              color: Color.fromARGB(255, 38, 37, 107))),
                      onPressed: () {
                        corectanswer(1);
                        if (Optionsindex < widget.questionlist.length - 1) {
                          value.OptionIncrement();
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => Resultpage(
                                      optionslist: widget.optionslist,
                                      questionlist: widget.questionlist,
                                    )),
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          widget.optionslist[Optionsindex].option![1],
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
                              width: .5,
                              color: Color.fromARGB(255, 38, 37, 107))),
                      onPressed: () {
                        corectanswer(2);
                        if (Optionsindex < widget.questionlist.length - 1) {
                          value.OptionIncrement();
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => Resultpage(
                                optionslist: widget.optionslist,
                                questionlist: widget.questionlist,
                              ),
                            ),
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          widget.optionslist[Optionsindex].option![2],
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
                              width: .5,
                              color: Color.fromARGB(255, 38, 37, 107))),
                      onPressed: () {
                        corectanswer(3);
                        if (Optionsindex < widget.questionlist.length - 1) {
                          value.OptionIncrement();
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => Resultpage(
                                optionslist: widget.optionslist,
                                questionlist: widget.questionlist,
                              ),
                            ),
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          widget.optionslist[Optionsindex].option![3],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
              ],
            );
          },
        ),
      ),
    );
  }

  void corectanswer(int selectedanswer) {
    final index = Provider.of<Stateprovider>(context, listen: false);
    int? rightAnswer = widget.optionslist[Optionsindex].answer;
    if (selectedanswer == rightAnswer) {
      index.scoreincrement();
    }
  }
}
