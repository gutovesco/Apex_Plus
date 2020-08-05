import 'package:apex_plus/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';

Color palleteBlue = Color(0xff010a43);
Color palleteLightPink = Color(0xffffc2c2);
Color palleteMediumPink = Color(0xffff9d9d);
Color palletePink = Color(0xffff2e63);
Color baseColor = Color(0xFFF2F2F2);

var finalScore = 0;
var questionNumber = 0;
var quiz = new InitialQuiz();

class InitialQuiz {
  var choices = [
    ["Verdadeiro", "Falso"],
    ["Verdadeiro", "Falso"],
    [
      "Acredito que estou pronto!",
      "Pelo visto, faltam poucos detalhes para trabalhar",
      "Ainda falta aprender mais, mas estou no caminho certo",
      "Acho que não será possível viabilizar a exportação nem em médio prazo",
      "Não acredito que consiga exportar algum dia"
    ],
  ];

  var correctAnswers = [
    "Falso",
    "Falso",
    "Acredito que estou pronto!",
  ];

  var questions = [
    "A capacidade produtiva de uma empresa não interfere em sua capacidade exportadora.",
    "Os obstáculos impostos ao processo de exportação são provenientes apenas dos entes externos.",
    "Agora é com você! Avaliando apenas os conceitos trabalhados neste módulo, como avalia sua capacidade exportadora:",
  ];
}

class QuizOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new QuizOneState();
  }
}

class QuizOneState extends State<QuizOne> {
  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => new DisplayMessage(
              score: finalScore,
            ),
          ),
        );
      } else {
        questionNumber++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.topCenter,
              child: new Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  new Padding(padding: EdgeInsets.all(20.0)),
                  new Container(
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: new Text(
                      quiz.questions[questionNumber],
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: palleteBlue,
                        fontSize: 18.0,
                        fontFamily: "SpartanRegular",
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //button 1
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            finalScore = 8;
                          });
                          updateQuestion();
                        },
                        child: ClayContainer(
                          width: 256,
                          height: 58,
                          borderRadius: 10,
                          color: baseColor,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Center(
                              child: ClayText(
                                quiz.choices[questionNumber][0],
                                textColor: Colors.black,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "SpartanRegular",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      //button 2
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            finalScore = 8;
                          });
                          updateQuestion();
                        },
                        child: ClayContainer(
                          width: 256,
                          height: 58,
                          borderRadius: 10,
                          color: baseColor,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Center(
                              child: ClayText(
                                quiz.choices[questionNumber][1],
                                textColor: Colors.black,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "SpartanRegular",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  quiz.choices[questionNumber].length >= 3
                      ? new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            //button 3
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  finalScore = 9;
                                });
                                updateQuestion();
                              },
                              child: ClayContainer(
                                width: 256,
                                height: 58,
                                borderRadius: 10,
                                color: baseColor,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Center(
                                    child: ClayText(
                                      quiz.choices[questionNumber][2],
                                      textColor: Colors.black,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: "SpartanRegular",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                          ],
                        )
                      : SizedBox.shrink(),
                  quiz.choices[questionNumber].length >= 3
                      ? new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            //button 4
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  finalScore = 9;
                                });
                                updateQuestion();
                              },
                              child: ClayContainer(
                                width: 256,
                                height: 58,
                                borderRadius: 10,
                                color: baseColor,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Center(
                                    child: ClayText(
                                      quiz.choices[questionNumber][3],
                                      textColor: Colors.black,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: "SpartanRegular",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                          ],
                        )
                      : SizedBox.shrink(),
                  quiz.choices[questionNumber].length >= 3
                      ? new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            //button 5
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  finalScore = 10;
                                });
                                updateQuestion();
                              },
                              child: ClayContainer(
                                width: 256,
                                height: 58,
                                borderRadius: 10,
                                color: baseColor,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Center(
                                    child: ClayText(
                                      quiz.choices[questionNumber][4],
                                      textColor: Colors.black,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: "SpartanRegular",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                          ],
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ));
  }
}

class DisplayMessage extends StatelessWidget {
  DisplayMessage({Key key, @required this.score}) : super(key: key);

  final int score;

  String getMessage() {
    switch (score) {
      case 8:
        return "Excelente! Mas não perca de vista o conhecimento. Ele vai te ajudar a conquistar seus objetivos.";
        break;
      case 9:
        return "Estamos no caminho certo! Continue firme no processo de aprendizado.";
        break;
      case 10:
        return "O início pode assustar, mas conhecimento é uma ferramenta poderosa e transformadora! Parabéns pela determinação de continuar aprendendo!";
        break;
      default:
        return "Excelente! Mas não perca de vista o conhecimento. Ele vai te ajudar a conquistar seus objetivos.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: new Text(
                  getMessage(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: "SpartanRegular",
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Summary(score: score)));
                },
                child: Center(
                  child: ClayContainer(
                    width: 200,
                    height: 50,
                    borderRadius: 10,
                    color: baseColor,
                    child: Center(
                      child: ClayText(
                        'OK!',
                        textColor: Colors.black,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: "SpartanRegular",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Summary extends StatelessWidget {
  Summary({Key key, @required this.score}) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: new Text(
                  "Parabéns! Agora vamos de volta ao Roadmap continuar avançando nesta jornada!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: "SpartanRegular",
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => LoadingPage()));
                },
                child: Center(
                  child: ClayContainer(
                    width: 200,
                    height: 50,
                    borderRadius: 10,
                    color: baseColor,
                    child: Center(
                      child: ClayText(
                        'Finalizar',
                        textColor: Colors.black,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: "SpartanRegular",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
