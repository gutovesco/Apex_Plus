import 'package:apex_plus/ui/login_page.dart';
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
    [
      "Beginner",
      "Intermediate",
      "Advanced",
      "Master"
    ],
    [
      "IT",
      "Health",
      "Real State",
      "Education"
    ],
    [
      "Yes",
      "No",
      "I used to",
      "More than one"
    ],
    [
      "0-4 years",
      "4-7 years",
      "More than 8 years",
      "Never"
    ]
  ];

  var correctAnswers = [
    [
      "Beginner",
      "Intermediate",
      "Advanced",
      "Master"
    ],
        [
      "IT",
      "Health",
      "Real State",
      "Education"
    ],
        [
      "Yes",
      "No",
      "I used to",
      "More than one"
    ],
    "Pessoas que começaram a trabalhar cedo e acabaram criando grandes empresas"
  ];

  var questions = [
    "What is your experience level in this area?",
    "What's your business's niche?",
    "Do you own a company?",
    "For how long have you owned a company?",
  ];
}

class Quiz1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {
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
                    )));
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
          body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                SizedBox(
                  height: 120,
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
                      fontSize: 20.0,
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
                          if (quiz.choices[questionNumber][0] ==
                              quiz.correctAnswers[questionNumber]) {
                            debugPrint("Correct");
                            finalScore++;
                          } else {
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
            child: ClayContainer(
              width: 200,
              height: 50,
              borderRadius: 10,
          color: baseColor,
          child: Center(
            child: ClayText(quiz.choices[questionNumber][0],
            textColor: Colors.black,
            style: TextStyle(
             color: Colors.black,
              fontSize: 16,
               fontFamily: "SpartanRegular",),
            ),
          ),
        ),),
                    SizedBox(height: 20),

                    //button 2
                    GestureDetector(
                        onTap: () {
                          if (quiz.choices[questionNumber][1] ==
                              quiz.correctAnswers[questionNumber]) {
                            debugPrint("Correct");
                            finalScore++;
                          } else {
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
           child: ClayContainer(
           width: 200,
              height: 50,
              borderRadius: 10,
          color: baseColor,
          child: Center(
            child: ClayText(quiz.choices[questionNumber][1],
            textColor: Colors.black,
            style: TextStyle(
             color: Colors.black,
              fontSize: 16,
               fontFamily: "SpartanRegular",),
            ),
          ),
        ),),
                  ],
                ),
                SizedBox(height: 20),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button 3
                    GestureDetector(
                        onTap: () {
                          if (quiz.choices[questionNumber][2] ==
                              quiz.correctAnswers[questionNumber]) {
                            debugPrint("Correct");
                            finalScore++;
                          } else {
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
          child: ClayContainer(
          width: 200,
              height: 50,
              borderRadius: 10,
          color: baseColor,
          child: Center(
            child: ClayText(quiz.choices[questionNumber][2],
            textColor: Colors.black,
            style: TextStyle(
             color: Colors.black,
              fontSize: 16,
               fontFamily: "SpartanRegular",),
            ),
          ),
        ),),

                    SizedBox(height: 20),

                    //button 4
                    GestureDetector(
                        onTap: () {
                          if (quiz.choices[questionNumber][3] ==
                              quiz.correctAnswers[questionNumber]) {
                            debugPrint("Correct");
                            finalScore++;
                          } else {
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
           child: ClayContainer(
          width: 200,
              height: 50,
              borderRadius: 10,
          color: baseColor,
          child: Center(
            child: ClayText(quiz.choices[questionNumber][3],
            textColor: Colors.black,
            style: TextStyle(
             color: Colors.black,
              fontSize: 16,
               fontFamily: "SpartanRegular",),
            ),
          ),
        ),),
                  ],
                ),
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
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Finished!",
                style: new TextStyle(fontSize: 35.0),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              LoginPage()));
                },
               child: Center(
                 child: ClayContainer(
          width: 200,
              height: 50,
              borderRadius: 10,
          color: baseColor,
          child: Center(
            child: ClayText('Continue',
            textColor: Colors.black,
            style: TextStyle(
             color: Colors.black,
              fontSize: 16,
               fontFamily: "SpartanRegular",),
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
