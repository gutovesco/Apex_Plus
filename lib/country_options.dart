import 'package:apex_plus/main_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:snaplist/snaplist.dart';

class CountryOptions extends StatefulWidget {
  @override
  _CountryOptionsState createState() => _CountryOptionsState();
}

class _CountryOptionsState extends State<CountryOptions> {
  final List<String> images = ['s', 'a', 'd'];
  final Size cardSize = Size(250.0, 250.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TODO snaplist
            GestureDetector(
              child: FlatButton(
                  child: Center(
                    child: Text('To do snap list with countries'),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new MainMenuPage()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
