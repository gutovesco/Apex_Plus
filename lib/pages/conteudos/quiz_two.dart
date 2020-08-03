import 'package:apex_plus/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:dropdownfield/dropdownfield.dart';

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
    ["Verdadeiro", "Falso"],
    [
      'EXW – “Na origem”',
      'FCA – “Livre no transportador”',
      'FAS – “Livre ao lado do navio”',
      'FOB – “Livre a bordo”',
      'CPT – “Transporte pago até”',
      'CIP – “Transporte e seguro pagos até”',
      'CFR – “Custo e frete”',
      'CIF – “Custo, seguro e frete”',
      'DAP – “Entregue no local”',
      'DPU – “Entregue no local desembarcado”',
      'DDP – “Entregue com direitos pagos”',
    ]
  ];

  var correctAnswers = [
    "Falso",
    "Falso",
    "Verdadeiro",
    "Acredito que estou pronto!",
  ];

  var questions = [
    "Os INCOTERMS compõem a totalidade do contrato entre comprador e vendedor. ",
    "Os INCOTERMS são apenas convenções, sem relação com as leis internacionais de comércio.",
    "Os INCOTERMS apenas regulam a como e onde é feita entrega do bem, seus custos e riscos.",
    "MINHA PERCEPÇÃO:\nConsiderando o conteúdo abordado em aula, qual dos INCOTERMS a seguir você considera ser o que melhor atenderia as necessidades do seu negócio?",
  ];
}

class QuizTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new QuizTwoState();
  }
}

class QuizTwoState extends State<QuizTwo> {
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
    String value = 'N/A';
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: new Container(
            color: Colors.green,
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
                quiz.choices[questionNumber].length >= 4
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropDownField(
                            value: value,
                            itemsVisibleInDropdown: 3,
                            labelText: 'Selecione',
                            labelStyle: TextStyle(color: Colors.white),
                            icon: Icon(Icons.airplanemode_active),
                            items: quiz.choices[3],
                            setter: (dynamic newValue) {
                              value = newValue;
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Explique sua escolha...',
                            ),
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              updateQuestion();
                            },
                            child: Container(
                              color: Colors.amber,
                              height: 50,
                              width: 200,
                              child: Center(
                                child: Text(
                                  'Enviar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : new Column(
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
                          quiz.choices[questionNumber].length >= 4
                              ? SizedBox.shrink()
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      finalScore = 8;
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
              ],
            ),
          ),
        ));
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
          color: Colors.green,
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
