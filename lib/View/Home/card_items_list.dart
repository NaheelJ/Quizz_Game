import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/Question/question_screen.dart';
import 'package:flutter_application_1/list.dart';

List<String> cardcategoryText = [
  "Science & Technowledgy",
  "Sports",
  "Logics",
  "Entertainment",
  "General Knowledge",
  "ART",
];

List<String> cardCategoryImages = [
  "assets/images/technolodgy.png",
  "assets/images/sports.png",
  "assets/images/matamatics.png",
  "assets/images/entertaiment.png",
  "assets/images/general.png",
  "assets/images/arts.png",
];

List <String> cardTitleAlert = [
  "Science & Techknowledgy Quizz",
  "Sports Quizz",
  "Logic Quizz",
  "Entertainment Quizz",
  "General Knowledge Quizz",
  "ART Quizz",
];

List <Widget> questionspage = [
  Question(optionslist: scienceoption, questionlist: sciencequestion),
  Question(optionslist: sportsoptions, questionlist: sportsQuestions),
  Question(optionslist: logicoptions, questionlist: logicQuestions),
  Question(optionslist: entertainmentoption, questionlist: entertainmentQuestions),
  Question(optionslist: entertainmentoption, questionlist: entertainmentQuestions),
  Question(optionslist: entertainmentoption, questionlist: entertainmentQuestions),
];
