import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:apex_plus/main_menu_page.dart';

class CountryOptions extends StatefulWidget {
  @override
  _CountryOptionsState createState() => _CountryOptionsState();
}

class _CountryOptionsState extends State<CountryOptions> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl =
        'https://www.suapesquisa.com/uploads/site/bandeira_argentina_media.jpg';

    return new Stack(
      children: <Widget>[
        new Container(
          color: Colors.white,
        ),
        new Image.network(
          imgUrl,
          fit: BoxFit.fill,
        ),
        new BackdropFilter(
            filter: new ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: new Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.9),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            )),
        new Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "Resultado",
              style: TextStyle(fontFamily: "BellotaText"),
            ),
            leading: BackButton(
              color: Colors.black,
            ),
          ),
          body: new Center(
            child: new Column(
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child:
                      Text(
                        "Sua cara metade é:",
                        style: TextStyle(
                          fontFamily: "SpartanRegular",
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                new SizedBox(
                  height: _height / 16,
                ),
                new CircleAvatar(
                  radius: _width < _height ? _width / 4 : _height / 4,
                  backgroundImage: NetworkImage(imgUrl),
                ),
                new SizedBox(
                  height: _height / 25.0,
                ),
                new Text(
                  'Argentina',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "SpartanRegular",
                      fontSize: _width / 15,
                      color: Colors.white),
                ),
                new Padding(
                  padding: new EdgeInsets.only(
                      top: _height / 30, left: _width / 8, right: _width / 8),
                  child: new Text(
                    'Baseado nas suas respostas,\na Argentina é a opção mais recomendada\npara se considerar exportar.',
                    style: new TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: "SpartanRegular",
                        fontSize: _width / 25,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                new Divider(
                  height: _height / 30,
                  color: Colors.white,
                ),
                new Container(
                  color: Colors.redAccent,
                  child: Row(
                    children: <Widget>[
                      rowCell("88%", ' MATCH'),
                    ],
                  ),
                ),
                new Divider(height: _height / 30, color: Colors.white),
                new Padding(
                  padding:
                  new EdgeInsets.only(left: _width / 8, right: _width / 8),
                  child: new FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MainMenuPage()));
                    },
                    child: new Container(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(Icons.check),
                            new SizedBox(
                              width: _width / 30,
                            ),
                            new Text('Vamos lá!')
                          ],
                        )),
                    color: Colors.green[50],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget rowCell(String count, String type) => new Expanded(
      child: new Column(
        children: <Widget>[
          new Text(
            '$count',
            style: new TextStyle(color: Colors.white),
          ),
          new Text(type,
              style: new TextStyle(
                  color: Colors.white, fontWeight: FontWeight.normal))
        ],
      ));
}
