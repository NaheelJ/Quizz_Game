import 'package:flutter/material.dart';
import 'package:flutter_application_1/View%20Model/Provider%20class/provider.dart';
import 'package:flutter_application_1/Splashscreenfd/splashscreen.dart';
import 'package:provider/provider.dart';

void main()  {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Stateprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    );
  }
}
