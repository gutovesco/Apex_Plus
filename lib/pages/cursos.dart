import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart' as neo;
import 'package:expansion_card/expansion_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class _HeaderCursos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Cursos Premium',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.architectsDaughter(
                    fontSize: 26,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Cursos extends StatelessWidget {
  final List<String> descCurso = [
    'Duração: 54 horas.',
    'Duração: 40 horas.',
    'Duração: 36 horas.',
  ];
  final List<String> tituloCurso = [
    'Logística para Exportação',
    'Plano de Negócios Internacionais',
    'Exportação de Serviços',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Seja um Assinante'), Icon(Icons.monetization_on)],
        ),
//        centerTitle: true,
        gradient: LinearGradient(
            colors: [Colors.lightGreenAccent, Color(0xFF4dff4d)]),
      ),
      body: Column(
        children: [
          _HeaderCursos(),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Center(
                        child: Container(
                      width: 300,
                      child: neo.Neumorphic(
                        style: neo.NeumorphicStyle(
                            shape: neo.NeumorphicShape.concave,
                            depth: 8,
                            lightSource: neo.LightSource.topLeft,
                            color: Colors.white),
                        child: ExpansionCard(
                          initiallyExpanded: false,
                          borderRadius: 30,
                          leading: Icon(
                            Icons.star_border,
                            size: 30.0,
                            color: Colors.blueAccent,
                          ),
                          backgroundColor: Colors.lightGreenAccent[300],
                          title: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  tituloCurso[index],
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
                                  child: Text(descCurso[index],
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
                                      padding: EdgeInsets.only(
                                          right: 30, bottom: 20),
                                      child: Container(
                                        width: 100.0,
                                        height: 35.0,
                                        child: RaisedButton(
                                          onPressed: () {},
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          padding: EdgeInsets.all(0.0),
                                          child: Ink(
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.orange,
                                                    Colors.orangeAccent
                                                  ],
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0)),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                  maxWidth: 300.0,
                                                  minHeight: 50.0),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Assinar",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white),
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
                    )),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
