import 'package:apex_plus/pages/cursos.dart';
import 'package:apex_plus/widgets/success_tiles.dart';
import 'package:flutter/material.dart';
import 'mapa.dart';
import 'oportunidades.dart';
import 'home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class MainMenuPage extends StatefulWidget {
  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int _page = 1;
  final Oportunidades _oportunidades = new Oportunidades();
  final Mapa _mapa = new Mapa();
  final Widget _roadmap = new SuccessTimeline();
  final Cursos _premium = new Cursos();

  // Necessary this redundance of Home Screen
  Widget _showPage = new SuccessTimeline();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _oportunidades;
        break;
      case 1:
        return _roadmap;
        break;
      case 2:
        return _mapa;
        break;
      case 3:
        return _premium;
      default:
        return new Container(
          child: Center(
            child: Text('No Page Found!'),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _showPage,
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        color: Color(0xFF4dff4d),
        backgroundColor: Colors.white,
        animationCurve: Curves.linear,
        items: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.next_week,
                color: Colors.white,
              ),
              Text(
                "Oportunidades",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Text(
                "Roadmap",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.map,
                color: Colors.white,
              ),
              Text(
                "Mapa",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.white,
              ),
              Text(
                "Premium",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
    );
  }
}
