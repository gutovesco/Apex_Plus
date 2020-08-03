import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfOne extends StatelessWidget {
  // TODO replace url
  final String pdfUrl =
      'http://ks4.imslp.net/files/imglnks/usimg/c/cf/IMSLP569901-PMLP411511-bach_bwv_807.pdf';

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
        title: Text('Baixar PDF'),
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
              height: 50,
              width: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
              ),
              child: RaisedButton(
                onPressed: () {
                  _launchURL(pdfUrl);
                },
                color: const Color(0xFF4dff4d),
                child: Center(
                  child: Text(
                    'Baixar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
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
