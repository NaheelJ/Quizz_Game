import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> usernamelist = [];
List<String> passwordlist = [];
int Optionsindex = 0;
int questionindex = 0;
int score = 0;

class Stateprovider extends ChangeNotifier {
  List<int> scores = [];
  List<String> storedTimes = [];
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

  void ptionIncrement() {
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

  Future<void> removeLogin() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('username');
    await pref.remove('pasword');
    usernamelist.clear();
    passwordlist.clear();
    notifyListeners();
  }

  Future<void> saveLogindata() async {
    final pref = await SharedPreferences.getInstance();
    pref.setStringList('username', usernamelist);
    pref.setStringList('pasword', passwordlist);
  }

  Future<void> removehistory() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('storedTimes');
    await pref.remove('scores');
    scores.clear();
    notifyListeners();
  }

  Future<void> saveQuizResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userScoresString = prefs.getString('scores');
    if (userScoresString != null) {
      scores =
          userScoresString.split(',').map((s) => int.tryParse(s) ?? 0).toList();
    }
    scores.add(score);
    prefs.setString('scores', scores.join(','));
  }

  Future<void> getScores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? scoresstring = prefs.getString('scores');
    if (scoresstring != null) {
      scores =
          scoresstring.split(',').map((s) => int.tryParse(s) ?? 0).toList();
    }
  }

  Future<void> saveTimeAndDate() async {
    final now = DateTime.now();
    // final timeformat = "${now.day}:${now.minute}";
    final prefs = await SharedPreferences.getInstance();
    storedTimes = prefs.getStringList('storedTimes') ?? [];
    storedTimes.add(now.toString());
    await prefs.setStringList('storedTimes', storedTimes);
  }

  Future<void> loadStoredTimes() async {
    final prefs = await SharedPreferences.getInstance();
    final storedTimesList = prefs.getStringList('storedTimes');
    storedTimes = storedTimesList ?? []; // Initialize as an empty list if null
  }
}

Future<void> getloginData() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  usernamelist = pref.getStringList('username') ?? [];
  passwordlist = pref.getStringList('pasword') ?? [];
}
