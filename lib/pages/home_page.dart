import 'package:flutter/material.dart';
import 'content_page.dart';
import '../commons/collapsing_navigation_drawer_widget.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          automaticallyImplyLeading: false,
          title: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Apex Plus'),
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
        drawer: CollapsingNavigationDrawer(),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(height: 20.0),
            umContainer('1', 'Planejamento', 'oi'),
            umContainer('2', 'Processo de Habilitação', 'oi'),
            umContainer('3', 'Análise Financeira e Tributária', 'oi'),
            umContainer('4', 'Determinação do preço de exportação', 'oi'),
            umContainer('5', 'Documentos necessários', 'oi'),
            endContainer('6', 'Procedimento de transporte', 'oi')
          ]),
        ));
  }

  Widget endContainer(String number, String desc, String title) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => ContentPage())),
      child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Center(
              child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.yellow),
                    child: Center(
                      child: Text(
                        number,
                        style: TextStyle(
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3
                            ..color = Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SpartanRegular',
                ),
              ),
              SizedBox(
                width: 20.0,
                height: 100.0,
              ),
            ],
          ))),
    );
  }

  Widget umContainer(String number, String desc, String title) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => ContentPage())),
      child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Center(
              child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.yellow),
                    child: Center(
                      child: Text(
                        number,
                        style: TextStyle(
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3
                            ..color = Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SpartanRegular',
                ),
              ),
              Container(
                width: 10,
                height: 100,
                color: Colors.black,
              )
            ],
          ))),
    );
  }

  void choiceAction(String choice) {
    if (choice == Constants.About) {
      showDialog(
          context: context,
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
          });
    } else if (choice == Constants.Exit) {
      exit(0);
    }
  }
}

class Constants {
  static const String About = 'Sobre';
  static const String Exit = 'Sair';

  static const List<String> choices = <String>[About, Exit];
}
