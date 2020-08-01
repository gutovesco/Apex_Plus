import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ConteudoTrilha extends StatefulWidget {
  @override
  _ConteudoTrilhaState createState() => _ConteudoTrilhaState();
}

class _ConteudoTrilhaState extends State<ConteudoTrilha> {

  YoutubePlayerController _controller;

  List<Map<String, dynamic>> listaComentarios = [
    {"usuario" : "Lengueen", "selecionado" : false, "comentario": "Eu sou uma foca"},
    {"usuario" : "Julinho", "selecionado" : true, "comentario" : "To com depressão"}
  ];

  final List<String> videosId = [
    YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=1_FXVjf46T8"),
  ];

  bool visibleYoutube = true;

  PlayerState estadoPlay;
  YoutubeMetaData dadosVideo;
  bool _videoIniciado = false;

  List<String> _data = ["Comentários"];
  bool isExpanded =false;

  void listener() {
    if (_videoIniciado && mounted && !_controller.value.isFullScreen) {
      setState(() {
        estadoPlay = _controller.value.playerState;
        dadosVideo = _controller.metadata;
      });
    }
  }

  @override
  void initState() {

    _controller = YoutubePlayerController(
      initialVideoId: videosId.first,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);

    super.initState();
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
                  color: Colors.red,
                  child:  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blueAccent,
                    topActions: <Widget>[],),
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
