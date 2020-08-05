import 'package:apex_plus/ui/play_pause_overlay.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoaulaThree extends StatefulWidget {
  @override
  _VideoaulaThreeState createState() => _VideoaulaThreeState();
}

class _VideoaulaThreeState extends State<VideoaulaThree> {
  List<Map<String, dynamic>> listaComentarios = [
    {
      "usuario": "Jubileu",
      "foto": "assets/img/jubileu.png",
      "selecionado": true,
      "comentario": "Ótimo conteúdo!"
    },
    {
      "usuario": "Mariazinha",
      "foto": "assets/img/mariazinha.png",
      "selecionado": false,
      "comentario": "Amei o vídeo, mudou minha forma de encarar a exportação."
    }
  ];

  List<String> _data = ["Comentários"];
  bool isExpanded = false;

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/video.mp4',
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Aula 3", style: GoogleFonts.robotoSlab(color: Colors.white)),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      VideoPlayer(_controller),
                      ClosedCaption(text: _controller.value.caption.text),
                      PlayPauseOverlay(controller: _controller),
                      VideoProgressIndicator(_controller, allowScrubbing: true),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Descrição",
                        style: TextStyle(
                            fontFamily: "SpartanRegular",
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                                "Nesta lição, mostramos como xyz funciona, além de apresentarmos exemplos reais de mercado e como você pode aplicar esses conceitos em seu próprio negócio.",
                                style: TextStyle(
                                  fontFamily: "SpartanRegular",
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 45,
                  width: 195,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                          "Próxima Aula",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpansionPanelList(
                  expansionCallback: (int index, bool expanded) {
                    this.setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  children: _data.map<ExpansionPanel>((String item) {
                    return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(item,
                              style: TextStyle(
                                  fontFamily: "SpartanRegular",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        );
                      },
                      body: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Divider(),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: 2,
                              itemBuilder: (BuildContext context, int index) {
                                Map<String, dynamic> usuario =
                                    listaComentarios[index];

                                return ListTile(
                                    leading: CircleAvatar(
                                      child: Image.asset(
                                        usuario["foto"],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text(usuario["usuario"]),
                                    subtitle: Text(usuario["comentario"]),
                                    trailing: usuario["selecionado"]
                                        ? Icon(Icons.star)
                                        : Icon(Icons.star_border),
                                    onTap: () {
                                      setState(() {
                                        listaComentarios[index]["selecionado"] =
                                            !listaComentarios[index]
                                                ["selecionado"];
                                      });
                                    });
                              },
                            )
                          ],
                        ),
                      ),
                      isExpanded: isExpanded,
                    );
                  }).toList(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
