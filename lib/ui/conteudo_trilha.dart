import 'package:apex_plus/ui/play_pause_overlay.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ConteudoTrilha extends StatefulWidget {
  @override
  _ConteudoTrilhaState createState() => _ConteudoTrilhaState();
}

class _ConteudoTrilhaState extends State<ConteudoTrilha> {

  List<Map<String, dynamic>> listaComentarios = [
    {"usuario" : "Lengueen", "selecionado" : false, "comentario": "Eu sou uma foca"},
    {"usuario" : "Julinho", "selecionado" : true, "comentario" : "To com depressão"}
  ];


  bool visibleYoutube = true;

  List<String> _data = ["Comentários"];
  bool isExpanded =false;

  /*YoutubePlayerController _controller;

  @override
  void initState() {
    String url = YoutubePlayerController.convertUrlToId("https://www.youtube.com/watch?v=etOxVzWo5NQ&t=82s");
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: url,
      params: const YoutubePlayerParams(
        startAt: const Duration(minutes: 1, seconds: 36),
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
      ),
    )..listen((value) {
      if (value.isReady && !value.hasPlayed) {
        _controller
          ..hidePauseOverlay()
          ..hideTopMenu();
      }
    });
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      //log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      Future.delayed(const Duration(seconds: 1), () {
        _controller.play();
      });
      Future.delayed(const Duration(seconds: 5), () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      });
      //log('Exited Fullscreen');
    };
  }*/

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
        title: Text("Trilha X"),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: ( context,  constraints){
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child:  Stack(
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
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Descrição", style: TextStyle(
                          fontFamily: "SpartanRegular",
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child:  Text("awdawdawdawdaawdawdawdawdawdawdwadawdawdawdawdawdawdwadwadawdawdawdawdawdwadawdawdawdawd",
                                style: TextStyle(fontFamily: "SpartanRegular",)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width * 0.20),
                  child: RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(30.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff41ea5d),
                            Color(0xffb5f2bf)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius:
                        BorderRadius.circular(30.0)),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width * 0.20), minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Detalhes",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),),
                SizedBox(height: 10,),
                ExpansionPanelList(
                  expansionCallback: (int index, bool expanded){
                    this.setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  children: _data.map<ExpansionPanel>((String item) {
                    return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(item, style: TextStyle(
                          fontFamily: "SpartanRegular",
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          )),
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
                              itemBuilder: (BuildContext context, int index){

                                Map<String, dynamic> usuario = listaComentarios[index];

                                return ListTile(
                                    leading: CircleAvatar(

                                    ),
                                    title: Text(usuario["usuario"]),
                                    subtitle: Text(usuario["comentario"]),
                                    trailing: usuario["selecionado"] ? Icon(Icons.star) : Icon(Icons.star_border),
                                    onTap: () {
                                      setState(() {
                                        listaComentarios[index]["selecionado"] = !listaComentarios[index]["selecionado"];
                                      });
                                    });
                              },)
                          ],
                        ),
                      ),

                      /*Container(
                        width: 100,
                        child: ListView.builder(
                          itemCount: 2,
                            itemBuilder: (context, index){
                          return ListTile(
                              leading: CircleAvatar(

                              ),
                              title: Text("Lengueen"),
                              subtitle: Text('Eu sou uma foca'),
                              trailing: Icon(Icons.star_border),
                              onTap: () {
                                setState(() {
                                  _data.removeWhere((currentItem) => item == currentItem);
                                });
                              });
                        }),
                      )*/
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

  //bool


  /*

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle: Text('To delete this panel, tap the trash can icon'),
              trailing: Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );

  */

}
