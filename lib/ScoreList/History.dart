import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider%20class/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class History extends StatefulWidget {
  List<int> scores;
  List<String> storedTimes = [];
  History({required this.scores, required this.storedTimes, super.key});

  @override
  State<History> createState() => HistoryState();
}

class HistoryState extends State<History> {
  @override
  void initState() {
    super.initState();
    loadStoredTimes();
    getScores();
  }

  @override
  Widget build(BuildContext context) {
    print(usernamelist[0]);
    print(widget.storedTimes);
    print(widget.scores);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 237, 255),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(50),
                      bottomEnd: Radius.circular(50)),
                  border: Border.all(color: Colors.white),
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 10.5,
                    ),
                    child: Text(
                      "HISTORY",
                      style: TextStyle(
                        fontSize: 50,
                        color: Color.fromARGB(255, 5, 0, 70),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Consumer<Stateprovider>(builder: (context, value, child) {
                    return PopupMenuButton(icon: Icon(Icons.more_vert,size: 36,color: Color.fromARGB(255, 12, 4, 70),),
                      onSelected: (value) {},
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            value: value.removehistory(),
                            child: Text("Clear",style: TextStyle(fontWeight: FontWeight.w400)),
                          ),
                        ];
                      },
                    );
                  })
                ],
              ),
            ),
            Positioned(
              top: 160,
              right: 30,
              left: 30,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.34,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 3, color: Color.fromARGB(255, 255, 255, 255)),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 14.6),
                        child: Text(
                          "${widget.scores[index]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      leading: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            usernamelist[0],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          Text(widget.storedTimes[index]),
                        ],
                      ),
                    );
                  },
                  itemCount: widget.scores.length,
                ),
              ),
            ),
            Positioned(
              top: 130,
              right: 30,
              left: 30,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    border: Border.all(
                      width: 3,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color.fromARGB(255, 6, 2, 57),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      SizedBox(width: 40),
                      Text(
                        "Time&date",
                        style: TextStyle(
                            color: Color.fromARGB(255, 6, 2, 57),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      SizedBox(width: 50),
                      Text(
                        "Score",
                        style: TextStyle(
                            color: Color.fromARGB(255, 6, 2, 57),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getScores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? scoresstring = prefs.getString('scores');
    //await prefs.clear(); //to rest the saved preference
    if (scoresstring != null) {
      widget.scores =
          scoresstring.split(',').map((s) => int.tryParse(s) ?? 0).toList();
      //print(widget.scores);
    }
  }

  Future<void> loadStoredTimes() async {
    final prefs = await SharedPreferences.getInstance();
    final storedTimesList = prefs.getStringList('storedTimes');
    //await prefs.clear(); //to rest the saved preference
    setState(
      () {
        widget.storedTimes =
            storedTimesList ?? []; // Initialize as an empty list if null
      },
    );
  }
}
