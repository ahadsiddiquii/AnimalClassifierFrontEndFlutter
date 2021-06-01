import 'package:flutter/material.dart';
import 'package:seprojectanimalclassifier/screens/constants/SColors.dart';
import 'package:seprojectanimalclassifier/screens/StartScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Classifier',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: SColors.PrimaryColorPurple),
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}
