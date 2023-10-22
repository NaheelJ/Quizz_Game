import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Stateprovider extends ChangeNotifier {
  List<int> scores = [];
  List<String> storedTimes = [];
  int score = 0;

  void scoreclear() {
    score = 0;
    print(score);
    notifyListeners();
  }

  Future<void> saveQuizResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userScoresString = prefs.getString('scores');
    if (userScoresString != null) {
      scores = userScoresString.split(',').map((s) => int.tryParse(s) ?? 0).toList();
    }
    scores.add(score);
    //await prefs.clear();
    prefs.setString('scores', scores.join(','));
  }

  Future<void> getScores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? scoresstring = prefs.getString('scores');
    //await prefs.clear(); //to rest the saved preference
    if (scoresstring != null) {
      scores = scoresstring.split(',').map((s) => int.tryParse(s) ?? 0).toList();
    }
  }
  
  Future<void> saveTimeAndDate() async {
    final now = DateTime.now();
    final prefs = await SharedPreferences.getInstance();
    final storedTimes = prefs.getStringList('storedTimes') ?? [];
    storedTimes.add(now.toString());
    await prefs.setStringList('storedTimes', storedTimes);
    //await prefs.clear();
  }

  Future<void> loadStoredTimes() async {
    final prefs = await SharedPreferences.getInstance();
    final storedTimesList = prefs.getStringList('storedTimes');
    //await prefs.clear();
    
      storedTimes = storedTimesList ?? []; // Initialize as an empty list if null
    
  }
}
