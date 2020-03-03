
import 'package:flutter/material.dart';

import 'content_card.dart';
import 'gooey_carousel.dart';

class GooeyEdgeDemo extends StatefulWidget {
  GooeyEdgeDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GooeyEdgeDemoState createState() => _GooeyEdgeDemoState();
}

class _GooeyEdgeDemoState extends State<GooeyEdgeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GooeyCarousel(
        children: <Widget>[
          ContentCard(
            color: 'Red',
            altColor: Color(0xFF4259B2),
            title: "Track you progress \ninside our app.",
            subtitle: 'Easy to understand and fun to use even if you are a beginner.',
          ),
          ContentCard(
            color: 'Yellow',
            altColor: Color.fromRGBO(66,182,66, 100),
            title: "Start exporting \nwith Apex Plus!",
            subtitle:
            'Skip all the boring burocracy and go straight to the fun part.',
          ),
          ContentCard(
            color: 'Blue',
            altColor: Color(0xFFFFB138),
            title: "Get in contact \nwith foreigner investors",
            subtitle:
            'Interact with foreigner investors and boost your profile!.',
          ),
        ],
      ),
    );
  }
}