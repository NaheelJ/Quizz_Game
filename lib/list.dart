import 'package:flutter_application_1/listmodel.dart';
 
List<Quizz> sciencequestion = [
  Quizz(question: "What is the largest planet in our solar system"),
  Quizz(question: "Which planet is known as the Red Planet"),
  Quizz(question: "What is the name of the first human to walk on the moon"),
  Quizz(question: "What does 'CPU' stand for in tech terminology")
];

List<Quizz> scienceoption = [
  Quizz(option: ["Earth", "Venus", "Mars", "Jupiter"], answer: 3),
  Quizz(option: ["Venus", "Mars", "Jupiter", "Saturn"], answer: 1),
  Quizz(option: ["Yuri Gagarin", "Neil Armstrong", "Alan Shepard", "John Glenn"],answer: 1),
  Quizz(option: ["Central Processing Unit","Computer Personal Unit","Central Program Utility","Control Processing Unit",], answer: 0),
];

List<Quizz> sportsQuestions = [
  Quizz(question: 'Which country won the FIFA World Cup in 2018?'),
  Quizz(question:'Who holds the record for the most home runs in Major League Baseball (MLB) history'),
  Quizz(question: 'In which sport would you perform a slam dunk'),
  Quizz(question:'Which athlete is often referred to as "The Fastest Man on Earth'),
];

List<Quizz> sportsoptions = [
  Quizz(option: ['Brazil', 'Germany', 'France', 'Spain'], answer: 3),
  Quizz(option: ['Babe Ruth', 'Hank Aaron', 'Barry Bonds', 'Willie Mays'],answer: 3),
  Quizz(option: ['Tennis', 'Basketball', 'Golf', 'Soccer'], answer: 2),
  Quizz(option: ['Usain Bolt', 'Carl Lewis', 'Michael Phelps', 'Jesse Owens'],answer: 1),
];

List<Quizz> logicQuestions = [
  Quizz(question: 'What is the result of (true && false)'),
  Quizz(question: 'Which logic gate performs logical OR operation'),
  Quizz(question: 'What is the output of the following code: (5 > 3) || (2 < 1)'),
  Quizz(question: 'In binary, what is the result of 1101 AND 1010'),
];

List<Quizz> logicoptions = [
  Quizz(option: ['true', 'false', 'true && false', 'false && true'], answer: 1),
  Quizz(option: ['AND', 'OR', 'NOT', 'XOR'], answer: 1),
  Quizz(option: ['true', 'false', '5', '3'], answer: 0),
  Quizz(option: ['1100', '1000', '1010', '1111'], answer: 3),
];

List <Quizz> entertainmentQuestions = [
    Quizz(question: 'Who won the Academy Award for Best Actor in 2020'),
    Quizz(question: 'Which movie features the character "Luke Skywalker"'),
    Quizz(question: 'Who is the lead singer of the band "Queen"'),
    Quizz(question: 'Which actor portrayed "Jack Dawson" in the movie "Titanic"'),
  
];

List <Quizz> entertainmentoption = [
  Quizz(option: ['Joaquin Phoenix', 'Leonardo DiCaprio', 'Brad Pitt', 'Tom Hanks'],answer: 0,),
  Quizz(option: ['Star Trek', 'Star Wars', 'Interstellar', 'Guardians of the Galaxy'],answer: 1,),
  Quizz(option:['Freddie Mercury', 'Elton John', 'David Bowie', 'Mick Jagger'],answer : 0),
  Quizz(option:['Leonardo DiCaprio', 'Brad Pitt', 'Tom Hanks', 'Johnny Depp'],answer: 0),
];