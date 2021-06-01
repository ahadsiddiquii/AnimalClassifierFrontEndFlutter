import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seprojectanimalclassifier/screens/ListScreen.dart';
import 'package:seprojectanimalclassifier/screens/constants/SColors.dart';
import 'package:seprojectanimalclassifier/screens/preference_shared/screenSizeConfig.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig().init(context);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: ScreenSizeConfig.safeBlockVertical * 100,
          width: ScreenSizeConfig.safeBlockHorizontal * 100,
          color: Colors.white,
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.all(ScreenSizeConfig.safeBlockHorizontal * 3),
                child: Container(
                  child: Column(
                    children: [
                      Image.asset('assets/images/animalclassifierlogo.png'),
                      Text(
                        'Animal Classifier',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            //fontsize = 20
                            fontSize: ScreenSizeConfig.safeBlockHorizontal * 5),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  height: ScreenSizeConfig.safeBlockVertical * 8,
                  width: ScreenSizeConfig.safeBlockHorizontal * 35,
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: RaisedButton(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70.0)),
                    textColor: Colors.purple,
                    color: SColors.PrimaryColorPurple,
                    child: Container(
                      width: ScreenSizeConfig.safeBlockHorizontal * 20,
                      alignment: Alignment.center,
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            //fontsize = 20
                            fontSize: ScreenSizeConfig.safeBlockHorizontal * 5),
                      ),
                    ),
                    onPressed: () {
                      _buildmodel();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListScreen()),
                      );
                    },
                  )),
            ],
          ),
        )
      ],
    ));
  }

  _buildmodel() async {
    final String endPoint = "http://192.168.100.7:5000/model";
    var client = new http.Client();
    var response = await client.post(Uri.encodeFull(endPoint),
        body: json.encode({'runmodel': 'model'}),
        headers: {"Content-Type": "application/json"});
  }
}
