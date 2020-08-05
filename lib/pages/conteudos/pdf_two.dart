import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class PdfTwo extends StatelessWidget {
  final String pdfUrl =
      'https://drive.google.com/file/d/1GMRu46msgcpak1xCjVZ67w-u-9aT97dz/view?usp=sharing';

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Baixar PDF',
            style: GoogleFonts.robotoSlab(color: Colors.white)),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.file_download,
              size: 128,
              color: Colors.red,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Título: Avaliação da capacidade exportadora - Edição: Maio 2020',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SpartanRegular',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Clique no botão abaixo para baixar o PDF da trilha.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SpartanRegular',
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              height: 45,
              width: 195,
              child: RaisedButton(
                onPressed: () {
                  _launchURL(pdfUrl);
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
                      "Baixar",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
