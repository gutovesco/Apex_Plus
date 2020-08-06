import 'package:apex_plus/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:confetti/confetti.dart';

Color palleteBlue = Color(0xff010a43);
Color palleteLightPink = Color(0xffffc2c2);
Color palleteMediumPink = Color(0xffff9d9d);
Color palletePink = Color(0xffff2e63);
Color baseColor = Color(0xFFF2F2F2);

var finalScore = 0;
var questionNumber = 0;
var quiz = new InitialQuiz();
var clicked = false;

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
    Future.delayed(const Duration(seconds: 2), () {
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
        clicked = false;
      });
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
                new Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.orange,
                    child: Text(
                      (questionNumber + 1).toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                      ),
                    ),
                  ),
                ),
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
                          clicked = true;
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
                          clicked = true;
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
                                clicked = true;
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
                                clicked = true;
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
                                clicked = true;
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
                questionNumber < 2
                    ? Opacity(
                        opacity: clicked ? 1.0 : 0.0,
                        child: Column(
                          children: [
                            Text(
                              'Resposta correta:',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              quiz.correctAnswers[questionNumber],
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
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
              Icon(
                Icons.trending_up,
                color: Colors.blueAccent,
                size: 48,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: new Text(
                  'DICA\n\n' + getMessage(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
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

class Summary extends StatefulWidget {
  Summary({Key key, @required this.score}) : super(key: key);

  final int score;

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  ConfettiController _controllerCenterRight;
  ConfettiController _controllerCenterLeft;

  @override
  void initState() {
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 5));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 5));
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.insert_emoticon,
                    color: Colors.pink,
                    size: 48,
                  ),
                  onTap: () {
                    _controllerCenterLeft.play();
                    _controllerCenterRight.play();
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: new Text(
                    "Parabéns!\n\nAgora vamos de volta para o Roadmap continuar avançando nesta jornada!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
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
          Align(
            alignment: Alignment.topRight,
            child: ConfettiWidget(
              confettiController: _controllerCenterRight,
              blastDirection: 3.14, // radial value - LEFT
              particleDrag: 0.05, // apply drag to the confetti
              emissionFrequency: 0.02, // how often it should emit
              numberOfParticles: 10, // number of particles to emit
              gravity: 0.05, // gravity - or fall speed
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink
              ], // manually specify the colors to be used
            ),
          ),

          //CENTER LEFT - Emit right
          Align(
            alignment: Alignment.topLeft,
            child: ConfettiWidget(
              confettiController: _controllerCenterLeft,
              blastDirection: 0.0, // radial value - RIGHT
              emissionFrequency: 0.02,
              minimumSize: const Size(10,
                  10), // set the minimum potential size for the confetti (width, height)
              maximumSize: const Size(50,
                  50), // set the maximum potential size for the confetti (width, height)
              numberOfParticles: 1,
              gravity: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
