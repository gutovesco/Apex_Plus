import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double rating = 4.0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Feedback',
            style: GoogleFonts.robotoSlab(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Sua opinião é importante para nós!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SpartanRegular',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                '1) De 0 à 5, qual nota você dá para esta trilha?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SpartanRegular',
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              SmoothStarRating(
                allowHalfRating: false,
                onRated: (v) {},
                starCount: 5,
                rating: rating,
                size: 40.0,
                isReadOnly: false,
                color: Colors.amber,
                borderColor: Colors.amberAccent,
                spacing: 0.0,
              ),
              SizedBox(height: 50),
              Text(
                '2) De 0 à 5, o quão pronto você se sente para começar à exportar depois de concluir esta trilha?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SpartanRegular',
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              SmoothStarRating(
                allowHalfRating: false,
                onRated: (v) {},
                starCount: 5,
                rating: rating,
                size: 40.0,
                isReadOnly: false,
                color: Colors.lightGreenAccent,
                borderColor: Colors.lightGreen,
                spacing: 0.0,
              ),
              SizedBox(height: 50),
              Text(
                '3) O quão satisfeito você está com o nosso App como um todo?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SpartanRegular',
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              SmoothStarRating(
                allowHalfRating: true,
                onRated: (v) {},
                starCount: 5,
                rating: rating,
                size: 40.0,
                isReadOnly: false,
                color: Colors.lightBlueAccent,
                borderColor: Colors.lightBlue,
                spacing: 0.0,
              ),
              SizedBox(height: 60),
              Container(
                height: 45,
                width: 195,
                child: RaisedButton(
                  onPressed: () {
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "Sucesso!",
                      desc: "Agradecemos seu feedback.",
                      buttons: [
                        DialogButton(
                          color: const Color(0xFF4dff4d),
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          width: 120,
                        )
                      ],
                    ).show();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff41ea5d), Color(0xffb5f2bf)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      height: 50,
                      width: 200,
                      alignment: Alignment.center,
                      child: Text(
                        "Enviar",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
