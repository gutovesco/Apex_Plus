import 'package:apex_plus/country_options.dart';
import 'package:apex_plus/main_menu_page.dart';
import 'package:apex_plus/pages/color_loader.dart';
import 'package:apex_plus/pages/questions.dart';
import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:shimmer/shimmer.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 8)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CountryOptions()));
    });
  }

  List<String> loadingPhrases = [
    'Fetching market data...',
    'Analyzing your profile...',
    'Matching the best scenarios...',
    'All done! Get ready to export!'
  ];
  int i = -1;

  void increaseCounter() {
    i++;
  }

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(Duration(seconds: 2), builder: (context) {
      if (i < 3) {
        increaseCounter();
      }
      return Scaffold(
        body: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ColorLoader2(
                    color1: Colors.green,
                    color2: Colors.yellow,
                    color3: Colors.blue,
                  ),
                ],
              ),
              SizedBox(width: 50.0, height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    loadingPhrases[i],
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontFamily: "BellotaText",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
/*
ColorLoader2(
                color1: Colors.green,
                color2: Colors.yellow,
                color3: Colors.blue,
              )*/