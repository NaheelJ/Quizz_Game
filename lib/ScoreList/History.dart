import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constant/Style/text_style.dart';
import 'package:flutter_application_1/Constant/coloers.dart';
import 'package:flutter_application_1/View%20Model/Provider%20class/provider.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  History({super.key});

  @override
  State<History> createState() => HistoryState();
}

class HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Stateprovider>(context, listen: false);
    provider.loadStoredTimes();
    provider.getScores();
    return Scaffold(
      backgroundColor: ColorsQuizz.backgroundcolor,
      appBar: AppBar(
        title: Text("History", style: largetextstyle),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorsQuizz.backgroundcolor,
        iconTheme: IconThemeData(color: ColorsQuizz.buttonsColor),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert, color: ColorsQuizz.buttonsColor),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    provider.removehistory();
                  },
                  child: Text("Clear", style: smalltextstyle),
                ),
              ];
            },
          ),
        ],
      ),
      body: Consumer<Stateprovider>(
        builder: (context, provider, child) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.34,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    width: 3, color: Color.fromARGB(255, 255, 255, 255)),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: provider.storedTimes.isEmpty || provider.scores.isEmpty
                  ? Center(
                      child: Text("Score Not Found!", style: mediumtextstyle),
                    )
                  : ListView.builder(
                      itemCount: provider.scores.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width / 14.6),
                              child: Text(
                                "${provider.scores[index]}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            leading: Text(
                              provider.storedTimes[index],
                              style: mediumtextstyle,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
