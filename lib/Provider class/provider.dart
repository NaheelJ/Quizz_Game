import 'package:flutter/material.dart';
import 'package:flutter_application_1/Question.dart';
import 'package:flutter_application_1/ScoreList/History.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> usernamelist = [];
List<String> passwordlist = [];
int Optionsindex = 0;
int questionindex = 0;
int score = 0;

class Stateprovider extends ChangeNotifier {
  Question1State question = Question1State();
  HistoryState historypage = HistoryState();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void scoreclear() {
    score = 0;
    questionindex = 0;
    Optionsindex = 0;
    notifyListeners();
  }

  void scoreincrement() {
    score++;
    notifyListeners();
  }

  void OptionIncrement() {
    Optionsindex++;
    questionindex++;
    notifyListeners();
  }

  addlogin(String user, String pass) {
    usernamelist.add(user);
    passwordlist.add(pass);
    saveLogindata();
    notifyListeners();
  }

  removeLogin() {
    usernamelist.clear();
    passwordlist.clear();
    notifyListeners();
  }
  // void timeAnddate(){
  //   storedTimes = storedTimesList ?? []; 
  //   notifyListeners();
  // }

  Future<void> saveLogindata() async {
    final pref = await SharedPreferences.getInstance();
    pref.setStringList('username', usernamelist);
    pref.setStringList('pasword', passwordlist);
  }

  //  Future<void> removehistory() async {
  //   final pref = await SharedPreferences.getInstance();
  //   await pref.remove('storedTimes');
  //   await pref.remove('scores');
  //   historypage.widget.scores.clear();
  //   notifyListeners();
  // }
}

Future<void> getloginData() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  usernamelist = pref.getStringList('username') ?? [];
  passwordlist = pref.getStringList('pasword') ?? [];
}
