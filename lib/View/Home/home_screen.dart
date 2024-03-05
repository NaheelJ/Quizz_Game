import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constant/Style/text_style.dart';
import 'package:flutter_application_1/Constant/coloers.dart';
import 'package:flutter_application_1/Constant/size_confgr.dart';
import 'package:flutter_application_1/Constant/sized_box.dart';
import 'package:flutter_application_1/ScoreList/History.dart';
import 'package:flutter_application_1/View%20Model/Provider%20class/provider.dart';
import 'package:flutter_application_1/View/Home/card_items_list.dart';
import 'package:flutter_application_1/View/Home/category_cards.dart';
import 'package:flutter_application_1/profilepage.dart';
import 'package:provider/provider.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    final height = SizeConfig(context).height;
    final width = SizeConfig(context).width;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              sizedbox(height / 2.1, width),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                //Category Cards with gridview builder
                child: GridView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Set the number of columns in the grid
                    mainAxisSpacing: 20, // Space between rows
                    childAspectRatio:
                        .74, // The ratio of the width to the height of
                    crossAxisSpacing: 5, // Space between column
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Consumer<Stateprovider>(
                      builder: (context, value, child) {
                        return CardWidgets(
                          text: cardcategoryText[index],
                          imagepath: cardCategoryImages[index],
                          page: questionspage[index],
                          titleAlert: cardTitleAlert[index],
                          buttontext: "START",
                          yourAlert: "Do You Want To Start Quizz!",
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          // The Grey card of the Top on the ui
          Positioned(
            child: Container(
              width: width,
              height: height / 3.30,
              decoration: ShapeDecoration(
                color: Color(0xFF302c34),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          // personal Information on the top
          Positioned(
            top: height / 15,
            left: 15,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profilepage(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 27,
                    foregroundImage: AssetImage("assets/images/person.png"),
                  ),
                ),
                sizedbox(0, 10),
                Text(
                  "Personal Information",
                  style: buttonTextStyle,
                )
              ],
            ),
          ),
          //The black image card
          Positioned(
            top: height / 6,
            right: 15,
            left: 15,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    height: height / 3.7,
                    image: AssetImage(
                      "assets/images/diplayimage n.jpg",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                // "Top Quizz Categoris" Text & history icon
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Top Quiz Categories", style: largetextstyle),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => History()),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.history,
                          color: ColorsQuizz.buttonsColor,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
