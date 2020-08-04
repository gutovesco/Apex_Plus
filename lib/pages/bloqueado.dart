import 'package:flutter/material.dart';

class ShowMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.lock,
              color: Colors.grey,
              size: 95,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Você precisa fazer o Quiz da Trilha de Classificação da Mercadoria e Mercados para desbloquear o mapa!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'SpartanRegular',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Bloqueado extends StatelessWidget {
  Bloqueado({this.map = false});
  final map;
  @override
  Widget build(BuildContext context) {
    return map
        ? ShowMap()
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Bloqueado"),
            ),
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      Icons.lock,
                      color: Colors.grey,
                      size: 95,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Oops!\n\nParece que esse conteúdo ainda não foi liberado :(',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'SpartanRegular',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
