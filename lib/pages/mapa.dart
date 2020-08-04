import 'package:apex_plus/pages/bloqueado.dart';
import 'package:apex_plus/pages/conteudos/quiz_three.dart';
import 'package:apex_plus/utils/image360.dart';
import 'package:flutter/material.dart';
import '../commons/collapsing_navigation_drawer_widget.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Mapa extends StatefulWidget {
  @override
  _Mapa createState() => _Mapa();
}

class _Mapa extends State<Mapa> {
  List<AssetImage> imageList = List<AssetImage>();
  List<AssetImage> countryList = List<AssetImage>();
  int index = 0;
  bool autoRotate = false;
  int rotationCount = 2;
  int swipeSensitivity = 2;
  bool allowSwipeToRotate = true;
  RotationDirection rotationDirection = RotationDirection.anticlockwise;
  Duration frameChangeDuration = Duration(milliseconds: 50);
  bool imagePrecached = false;
  bool countryPrecached = false;
  List<String> mylist = [
    'EUA',
    'Japão',
    'China',
    'EUA',
    'Japão',
    'China',
    'EUA',
    'Japão',
    'China',
  ];
  List<String> descList = [
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: batman',
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: batman',
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: batman',
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: batman',
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: batman',
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: batman',
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: batman',
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: batman',
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: batman',
  ];

  @override
  void initState() {
    //* To load images from assets after first frame build up.
    WidgetsBinding.instance
        .addPostFrameCallback((_) => updateImageList(context));
    super.initState();
  }

  void updateImageList(BuildContext context) async {
    for (int i = 1; i <= 9; i++) {
      countryList.add(AssetImage('images/${i}country.png'));
      imageList.add(AssetImage('images/$i.png'));
      //* To precache images so that when required they are loaded faster.
      await precacheImage(AssetImage('images/$i.png'), context);
      await precacheImage(AssetImage('images/${i}country.png'), context);
    }
    setState(() {
      imagePrecached = true;
      countryPrecached = true;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text('Mapa e FitCultural'),
          ],
        ),
//        centerTitle: true,
        gradient: LinearGradient(
            colors: [Colors.lightGreenAccent, Color(0xFF4dff4d)]),
      ),
      drawer: CollapsingNavigationDrawer(),
      body: finalScore != 0
          ? Column(
              children: <Widget>[
                (imagePrecached == true)
                    ? ImageView360(
                        key: UniqueKey(),
                        textList: mylist,
                        descList: descList,
                        imageList: imageList,
                        countryList: countryList,
                        autoRotate: autoRotate,
                        rotationCount: rotationCount,
                        rotationDirection: RotationDirection.anticlockwise,
                        frameChangeDuration: Duration(milliseconds: 30),
                        swipeSensitivity: swipeSensitivity,
                        allowSwipeToRotate: allowSwipeToRotate,
                      )
                    : Center(
                        child: Text("Carregando..."),
                      ),
              ],
            )
          : Bloqueado(map: true),
    );
  }
}
