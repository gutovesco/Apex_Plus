import 'package:apex_plus/pages/conteudos/feedback.dart';
import 'package:apex_plus/pages/conteudos/pdf_three.dart';
import 'package:apex_plus/pages/conteudos/quiz_three.dart';
import 'package:apex_plus/pages/conteudos/videoaula_three.dart';
import 'package:flutter/material.dart';

class ListTrilhaThree extends StatelessWidget {
  final List<String> title = [
    'Vídeo Aulas',
    'Conteúdo em Texto',
    'Questões',
    'Feedback'
  ];
  final List<String> desc = [
    'Progresso: 0%',
    'Faça download do nosso PDF gratuito',
    'Responda ao Quiz e teste seus conhecimentos',
    'Queremos te ouvir, sua opinião é importante para nós!'
  ];
  final List<String> imagesUrls = [
    'https://www.upinside.com.br/uploads/images/2018/10/criando-o-proprio-player-para-reproducao-de-videos-com-a-tag-video-do-html5-1539347403.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQw52yXGPrcBfXoiBrCxebYlY06inA7FYlIrQ&usqp=CAU',
    'https://www.grupoescolar.com/galeria/fotos/8896A09B9.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR93w3t_jzlSrbmtRjpUs1cLZuVZGOe3PfNug&usqp=CAU',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Classificação da Mercadoria e Mercados"),
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (contex, index) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              maxRadius: 30,
                              child: Image.network(
                                imagesUrls[index],
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      title[index],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "SpartanRegular",
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      desc[index],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "SpartanRegular",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                var route;
                                switch (index) {
                                  case 0:
                                    route = VideoaulaThree();
                                    break;
                                  case 1:
                                    route = PdfThree();
                                    break;
                                  case 2:
                                    route = QuizThree();
                                    break;
                                  case 3:
                                    route = FeedbackPage();
                                    break;
                                  default:
                                    route = VideoaulaThree();
                                }

                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                    builder: (BuildContext context) => route,
                                  ),
                                );
                              },
                              iconSize: 40,
                              icon: Icon(
                                Icons.play_arrow,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      height: 1,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
