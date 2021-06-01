import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seprojectanimalclassifier/screens/ListScreen.dart';
import 'package:seprojectanimalclassifier/screens/FinalScreen.dart';
import 'package:seprojectanimalclassifier/screens/constants/SColors.dart';
import 'package:seprojectanimalclassifier/screens/preference_shared/screenSizeConfig.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class ListItems {
  int hair;
  int feathers;
  int eggs;
  int milk;
  int airborne;
  int aquatic;
  int predator;
  int toothed;
  int backbone;
  int breathes;
  int venomous;
  int fins;
  int legs;
  int tail;
  int domestic;
  int catsize;

  ListItems(
      {this.hair,
      this.feathers,
      this.eggs,
      this.milk,
      this.airborne,
      this.aquatic,
      this.predator,
      this.toothed,
      this.backbone,
      this.breathes,
      this.venomous,
      this.fins,
      this.legs,
      this.tail,
      this.domestic,
      this.catsize});
}

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List listDetails = [
    0,
    0,
    1,
    0,
    0,
    1,
    1,
    0,
    0,
    1,
    0,
    1,
    0,
    1,
    1,
    0,
  ];
  List<ListItems> listItems = [
    ListItems(
      hair: 0,
      feathers: 0,
      eggs: 1,
      milk: 0,
      airborne: 0,
      aquatic: 1,
      predator: 1,
      toothed: 0,
      backbone: 0,
      breathes: 1,
      venomous: 0,
      fins: 1,
      legs: 0,
      tail: 1,
      domestic: 1,
      catsize: 0,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 30, 5, 10),
                child: Container(
                  alignment: AlignmentDirectional.center,
                  width: ScreenSizeConfig.safeBlockHorizontal * 100,
                  child: Text(
                    "Encountered an animal? Help us figure out it's class",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        //fontsize = 20
                        fontSize: ScreenSizeConfig.safeBlockHorizontal * 10),
                  ),
                ),
              ),
              _updateList('Hair?', 0),
              _updateList('Feathers?', 1),
              _updateList('Eggs?', 2),
              _updateList('Milk?', 3),
              _updateList('Airborne?', 4),
              _updateList('Aquatic?', 5),
              _updateList('Predator?', 6),
              _updateList('Toothed?', 7),
              _updateList('Backbone?', 8),
              _updateList('Breathes?', 9),
              _updateList('Venemous?', 10),
              _updateList('Fins?', 11),
              _updateList('Legs?', 12),
              _updateList('Tail?', 13),
              _updateList('Domestic?', 14),
              _updateList('Catsize?', 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
                              fontSize:
                                  ScreenSizeConfig.safeBlockHorizontal * 5),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FinalScreen()),
                        );
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _updateList(title, index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    //fontsize = 20
                    fontSize: ScreenSizeConfig.safeBlockHorizontal * 5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
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
                              'Yes',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  //fontsize = 20
                                  fontSize:
                                      ScreenSizeConfig.safeBlockHorizontal * 5),
                            ),
                          ),
                          onPressed: () {
                            listDetails[index] = 1;
                          },
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
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
                              'No',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  //fontsize = 20
                                  fontSize:
                                      ScreenSizeConfig.safeBlockHorizontal * 5),
                            ),
                          ),
                          onPressed: () {
                            listDetails[index] = 0;
                          },
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
