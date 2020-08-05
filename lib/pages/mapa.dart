import 'package:apex_plus/pages/bloqueado.dart';
import 'package:apex_plus/pages/conteudos/quiz_three.dart';
import 'package:apex_plus/utils/image360.dart';
import 'package:flutter/material.dart';
import '../commons/collapsing_navigation_drawer_widget.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

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
  List<String> mylistAcucar = [
    'Índia',
    'Argélia',
    'China',
    'Índia',
    'Argélia',
    'China',
    'Índia',
    'Argélia',
    'China',
  ];
  List<String> mylistCafe = [
    'EUA',
    'Alemanha',
    'Itália',
    'EUA',
    'Alemanha',
    'Itália',
    'EUA',
    'Alemanha',
    'Itália',
  ];
  List<String> mylistCelulose = [
    'China',
    'Holanda',
    'EUA',
    'China',
    'Holanda',
    'EUA',
    'China',
    'Holanda',
    'EUA',
  ];
  List<String> descListAcucar = [
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Açúcar e Álcool\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
  ];
  List<String> descListCafe = [
    'Setor: Café\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Café\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Café\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Café\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Café\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Café\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Café\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Café\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Café\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
  ];
  List<String> descListCelulose = [
    'Setor: Celulose\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Celulose\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Celulose\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Celulose\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Celulose\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Celulose\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Celulose\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Celulose\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
    'Setor: Celulose\nCresc. Médio (2015-2018): xxx\nParticipação do Brasil (2018): xxx\nPrincipal Concorrente: abc',
  ];

  dynamic getCountries() {
    switch (finalScore) {
      case 1:
        return mylistAcucar;
        break;
      case 2:
        return mylistCafe;
        break;
      case 3:
        return mylistCelulose;
        break;
      default:
        return mylistAcucar;
    }
  }

  dynamic getDesc() {
    switch (finalScore) {
      case 1:
        return descListAcucar;
        break;
      case 2:
        return descListCafe;
        break;
      case 3:
        return descListCelulose;
        break;
      default:
        return descListAcucar;
    }
  }

  @override
  void initState() {
    //* To load images from assets after first frame build up.
    WidgetsBinding.instance
        .addPostFrameCallback((_) => updateImageList(context));
    super.initState();
  }

  void updateImageList(BuildContext context) async {
    String imagesPath;
    switch (finalScore) {
      case 1:
        imagesPath = 'acucar';
        break;
      case 2:
        imagesPath = 'cafe';
        break;
      case 3:
        imagesPath = 'celulose';
        break;
      default:
        imagesPath = 'acucar';
    }
    for (int i = 1; i <= 9; i++) {
      countryList.add(AssetImage('assets/img/$imagesPath/${i}country.png'));
      imageList.add(AssetImage('assets/img/$imagesPath/$i.png'));
      //* To precache images so that when required they are loaded faster.
      await precacheImage(AssetImage('assets/img/$imagesPath/$i.png'), context);
      await precacheImage(
          AssetImage('assets/img/$imagesPath/${i}country.png'), context);
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
            Text('Mapa e FitCultural',
                style: GoogleFonts.robotoSlab(color: Colors.white)),
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
                        textList: getCountries(),
                        descList: getDesc(),
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
