import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider%20class/provider.dart';
import 'package:flutter_application_1/catogary/technowlwdgy&sciense.dart';
import 'package:flutter_application_1/other/History.dart';
import 'package:flutter_application_1/other/HomeCategory.dart';
import 'package:flutter_application_1/other/Loginpage.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class End extends StatefulWidget {
  End(namecontroller, {super.key});

  @override
  State<End> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<End> {
  @override
  Widget build(BuildContext context) {
    Provider.of<Stateprovider>(context, listen: false).saveQuizResult();
    Provider.of<Stateprovider>(context, listen: false).saveTimeAndDate();
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
          child: Consumer<Stateprovider>(builder: (context, value, child) {
            return Column(
              children: [
                value.score < 3
                    ? Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 230,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 255, 255, 255),
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
                                namecontroller.text,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Your Score\n${value.score}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromARGB(255, 0, 0, 0)),
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
                            builder: ((context) =>
                                HomeCategory(Usernamelist: Usernamelist))));
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(width: 68),
                TextButton(
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
                            builder: ((context) =>
                                Question(namecontroller: namecontroller))));
                  },
                  child: Text(
                    "Retry",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => History(
                              namecontroller: namecontroller,
                            )),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.history,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    size: 34,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
