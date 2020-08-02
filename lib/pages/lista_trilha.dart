import 'package:apex_plus/pages/licao.dart';
import 'package:apex_plus/pages/nao_liberado.dart';
import 'package:flutter/material.dart';

class ListTrilhaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Avaliação da Capacidade Exportadora"),
      ),
      body: ListView.builder(
          itemCount: 10,
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
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Title",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "SpartanRegular",
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          "Descriçãoawdawdhwaudhawiudhwadiuwahdiawuhiawuhwauawdawdawdawwadawdawdawdwadawdawgggggggdua",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: "SpartanRegular",
                                          ))
                                    ],
                                  ),
                                )),
                            IconButton(
                              onPressed: () {
                                if (index != 0) {
                                  Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          NaoLiberado(),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Licao(),
                                    ),
                                  );
                                }
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
