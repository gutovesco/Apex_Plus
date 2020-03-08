import 'package:apex_plus/main_menu_page.dart';
import 'package:apex_plus/pages/color_loader.dart';
import 'package:apex_plus/pages/questions.dart';
import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            ColorLoader2(
                color1: Colors.green,
                color2: Colors.yellow,
                color3: Colors.blue,
              ),
              SizedBox(height: 15),
              Text(
                'Fetching data...',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
               fontFamily: "SpartanRegular",
                ),
              ),
              AnimatedOpacity(
                curve: Curves.linear,
                duration: Duration(seconds: 1),
                opacity: 1,
                child: Text(
                'Choosing best options...',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
               fontFamily: "SpartanRegular",
                ),
              ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              MainMenuPage()));
                },
               child: Center(
                 child: ClayContainer(
          width: 200,
              height: 50,
              borderRadius: 10,
          color: baseColor,
          child: Center(
            child: ClayText('Continue',
            textColor: Colors.black,
            style: TextStyle(
             color: Colors.black,
              fontSize: 16,
               fontFamily: "SpartanRegular",),
            ),
          ),
        ),
               ),
              ),
            ],
          ),
        ),
      );
  }
}
/*
ColorLoader2(
                color1: Colors.green,
                color2: Colors.yellow,
                color3: Colors.blue,
              )*/