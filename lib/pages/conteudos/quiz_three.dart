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
      "Açúcar e Álcool",
      "Café",
      "Papel e Celulose",
    ],
  ];

  var correctAnswers = [
    "Falso",
    "Falso",
    "Wait, it's all incorrect answers? -Always has been...",
  ];

  var questions = [
    "Classificar a mercadoria significa descrever o produto de forma que se torne atrativo ao comprador.",
    "O Sistema Harmonizado buscou pacificar as relações comerciais entre os países, permitindo que cada um utilizasse a sua própria nomenclatura.",
    "MINHA PERCEPÇÃO:\nConsiderando o conteúdo abordado em aula, como você acredita que seu produto se enquadra no sistema de classificação de mercadorias?",
  ];
}

class QuizThree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new QuizThreeState();
  }
}

class QuizThreeState extends State<QuizThree> {
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
            builder: (context) => new Summary(
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
                          finalScore = 1;
                        });
                        updateQuestion();
                      },
                      child: ClayContainer(
                        width: 230,
                        height: 70,
                        borderRadius: 10,
                        color: baseColor,
                        child: Center(
                          child: ClayText(
                            quiz.choices[questionNumber][0],
                            textColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: "SpartanRegular",
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
                          finalScore = 2;
                        });
                        updateQuestion();
                      },
                      child: ClayContainer(
                        width: 230,
                        height: 70,
                        borderRadius: 10,
                        color: baseColor,
                        child: Center(
                          child: ClayText(
                            quiz.choices[questionNumber][1],
                            textColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: "SpartanRegular",
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
                                finalScore = 3;
                              });
                              updateQuestion();
                            },
                            child: ClayContainer(
                              width: 230,
                              height: 70,
                              borderRadius: 10,
                              color: baseColor,
                              child: Center(
                                child: ClayText(
                                  quiz.choices[questionNumber][2],
                                  textColor: Colors.black,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "SpartanRegular",
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20),
                        ],
                      )
                    : SizedBox.shrink(),
                SizedBox(height: 20),
              ],
            ),
          ),
        )));
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
                  "Excelente!\nVeja agora no Mapa de Fit Cultural os principais mercados que sugerimos para você! Ah! E na aula a seguir vamos entender a importância do conhecimento sobre seus mercados e respectivas culturas ;)",
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
                        'Vamos para o mapa!!!',
                        textColor: Colors.black,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
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
