import 'package:flutter/material.dart';
import 'content_page.dart';
import 'commons/collapsing_navigation_drawer_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

            actions: <Widget>[
              //TODO implement action button
              FlatButton(
                child: Text('test'),
                onPressed: () {print('a');},
              )
            ],
            title: Text(
              'Apex Plus',
            )),
        drawer: CollapsingNavigationDrawer(),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Roadmap',
                  style: TextStyle(fontSize: 28.0, color: Colors.green),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
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
                    decoration: BoxDecoration(color: Colors.pink),
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
              SizedBox(
                width: 20.0,
                height: 100.0,
              )
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
                    decoration: BoxDecoration(color: Colors.pink),
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
              Container(
                width: 10,
                height: 100,
                color: Colors.black,
              )
            ],
          ))),
    );
  }
}
