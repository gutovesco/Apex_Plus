import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProfilePageDesign extends StatefulWidget {
  @override
  _ProfilePageDesignState createState() => _ProfilePageDesignState();
}

class _ProfilePageDesignState extends State<ProfilePageDesign> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  var cardHeight = 160.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text('Oportunidades'),
          ],
        ),
//        centerTitle: true,
        gradient: LinearGradient(
            colors: [Colors.lightGreenAccent, Color(0xFF4dff4d)]),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice,
                    textAlign: TextAlign.center,
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                  child: Container(
                width: 360,
                child: Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        depth: 8,
                        lightSource: LightSource.topLeft,
                        color: Colors.white),
                    child: ExpansionCard(
                      initiallyExpanded: true,
                      borderRadius: 30,
                      leading: NeumorphicIcon(
                        Icons.airplanemode_active,
                        size: 30.0,
                        style: NeumorphicStyle(color: Color(0xff41ea5d)),
                      ),
                      backgroundColor: Colors.lightGreenAccent[300],
                      title: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Oportunidade - Brasil",
                              style: TextStyle(
                                fontFamily: 'BalooBhai',
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                  "A oportunidade é a gente criar vergonha na cara e parar de ficar usando biblioteca pra fazer tudo igual uns palerma demente IZIIIIII PESADAUM",
                                  style: TextStyle(
                                      fontFamily: 'BalooBhai',
                                      fontSize: 17,
                                      color: Colors.black)),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 30, bottom: 20),
                                  child: Container(
                                    width: 100.0,
                                    height: 35.0,
                                    child: RaisedButton(
                                      onPressed: () {},
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      padding: EdgeInsets.all(0.0),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xff41ea5d),
                                                Color(0xffb5f2bf)
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: 300.0, minHeight: 50.0),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Detalhes",
                                            textAlign: TextAlign.center,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )),
              ))
            ],
          );
        },
      ),
    );
  }
}

void choiceAction(String choice) {
  if (choice == Constants.About) {
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Equipe 9"),
            content: InkWell(
              child: new Text(
                  "Samuel Santos\nAugusto Vesco\nCaio Pedroso\nYves Alvim\nJoão Marcos\nGitRepo: https://github.com/gutovesco/Apex_Plus"),
            ),
            //new Text(),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
        context: null);
  } else if (choice == Constants.Exit) {
    exit(0);
  }
}

class Constants {
  static const String About = 'Sobre';
  static const String Exit = 'Sair';

  static const List<String> choices = <String>[About, Exit];
}
