import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class OportunidadesPage extends StatefulWidget {
  @override
  _OportunidadesPageState createState() => _OportunidadesPageState();
}

class _OportunidadesPageState extends State<OportunidadesPage> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      home: Oportunidades(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Oportunidades extends StatelessWidget {
  final double cardHeight = 160.0;
  final List<String> titulo = [
    '[Oportunidade] China - Celulose',
    '[Evento] Expo Dubai 2020',
    '[Oportunidade] Estados Unidos - Café',
    '[Evento] ISM 2020',
    '[Oportunidade] Países Baixos - Celulose',
    '[Evento] CIIE 2020',
  ];
  final List<String> desc = [
    'Esta é uma oportunidade visível somente aos assinantes. Atualize para Premium para saber mais detalhes.',
    'Oportunidades, Mobilidade e Sustentabilidade\nData: 01/10/2021 - 31/03/2022\nLocalidade: Dubai - EMIRADOS ÁRABES UNIDOS',
    'Esta é uma oportunidade visível somente aos assinantes. Atualize para Premium para saber mais detalhes.',
    'Chocolates, balas e confeitos em geral\nData: 02/02/2020 - 05/02/2020\nLocalidade: Colônia – ALEMANHA',
    'Esta é uma oportunidade visível somente aos assinantes. Atualize para Premium para saber mais detalhes.',
    '- Geral -\nData: 04/11/2020 - 08/11/2020\nLocalidade: Xangai – CHINA.',
  ];
  final List<String> links = [
    'https://www.expo2020dubai.com/',
    'https://www.ism-cologne.com/',
    'https://www.ciie.org/zbh/en/'
  ];

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Oportunidades'), Icon(Icons.filter_list)],
        ),
        gradient: LinearGradient(
            colors: [Colors.lightGreenAccent, Color(0xFF4dff4d)]),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 280,
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        depth: 8,
                        lightSource: LightSource.topLeft,
                        color: Colors.white),
                    child: ExpansionCard(
                      initiallyExpanded: false,
                      borderRadius: 30,
                      leading: Icon(
                        titulo[index].startsWith('[O')
                            ? Icons.airplanemode_active
                            : Icons.calendar_today,
                        size: 30.0,
                        color: titulo[index].startsWith('[O')
                            ? Color(0xff41ea5d)
                            : Colors.orangeAccent,
                      ),
                      backgroundColor: Colors.lightGreenAccent[300],
                      title: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              titulo[index],
                              style: TextStyle(
                                fontFamily: 'BalooBhai',
                                fontSize: 18,
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
                              child: Text(desc[index],
                                  style: TextStyle(
                                      fontFamily: 'BalooBhai',
                                      fontSize: 14,
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
                                      onPressed: () {
                                        if (titulo[index].startsWith('[E'))
                                          _launchURL(links[index ~/ 2]);
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      padding: EdgeInsets.all(0.0),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                titulo[index].startsWith('[E')
                                                    ? Color(0xff41ea5d)
                                                    : Colors.orange,
                                                titulo[index].startsWith('[E')
                                                    ? Color(0xffb5f2bf)
                                                    : Colors.orangeAccent
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
                                            titulo[index].startsWith('[E')
                                                ? "Detalhes"
                                                : 'Seja Premium',
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
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
