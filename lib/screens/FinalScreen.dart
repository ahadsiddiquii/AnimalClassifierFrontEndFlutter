import 'package:flutter/material.dart';
import 'package:seprojectanimalclassifier/screens/preference_shared/screenSizeConfig.dart';

class FinalScreen extends StatefulWidget {
  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        height: ScreenSizeConfig.safeBlockVertical * 100,
        width: ScreenSizeConfig.safeBlockHorizontal * 100,
        child: Center(
          child: Container(
            alignment: AlignmentDirectional.topCenter,
            height: ScreenSizeConfig.safeBlockVertical * 30,
            width: ScreenSizeConfig.safeBlockHorizontal * 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Text(
                "You have encountered a Fish",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    //fontsize = 20
                    fontSize: ScreenSizeConfig.safeBlockHorizontal * 10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
