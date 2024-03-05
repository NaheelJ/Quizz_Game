import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constant/Style/text_style.dart';
import 'package:flutter_application_1/Constant/coloers.dart';
import 'package:flutter_application_1/Constant/size_confgr.dart';
import 'package:flutter_application_1/Constant/sized_box.dart';
import 'package:flutter_application_1/View%20Model/Provider%20class/provider.dart';
import 'package:flutter_application_1/View/Question/options_buttons.dart';
import 'package:flutter_application_1/listmodel.dart';
import 'package:flutter_application_1/result.dart';
import 'package:provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
    final height = SizeConfig(context).height;
    final width = SizeConfig(context).width;
    return Scaffold(
      backgroundColor: ColorsQuizz.backgroundcolor,
      body: Consumer<Stateprovider>(
        builder: (context, value, child) {
          return Column(
            children: [
              sizedbox(height / 6, width),
              Container(
                margin: EdgeInsets.only(bottom: 40, left: 20, right: 20),
                width: width,
                height: height / 3.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: ColorsQuizz.bordercolor),
                  color: ColorsQuizz.primarycolor,
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: widget.questionlist[questionindex].question!,
                            style: largetextstyle),
                        TextSpan(text: '\n?', style: largetextstyle)
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  sizedbox(20, 0),
                  OptionsButton(
                    text: widget.optionslist[Optionsindex].option![0],
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
                  ),
                  sizedbox(height / 20, 0),
                  OptionsButton(
                    text: widget.optionslist[Optionsindex].option![1],
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
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  sizedbox(height / 20, 0),
                  OptionsButton(
                    text: widget.optionslist[Optionsindex].option![2],
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
                  ),
                  sizedbox(height / 20, 0),
                  OptionsButton(
                    text: widget.optionslist[Optionsindex].option![3],
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
                  )
                ]),
              ),
            ],
          );
        },
      ),
    );
  }

  void corectanswer(
    int selectedanswer,
  ) {
    final index = Provider.of<Stateprovider>(context, listen: false);
    int? rightAnswer = widget.optionslist[Optionsindex].answer;
    if (selectedanswer == rightAnswer) {
      index.scoreincrement();
    }
  }
}
