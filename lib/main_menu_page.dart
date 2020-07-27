import 'package:apex_plus/success_tiles.dart';
import 'package:flutter/material.dart';
import 'community_page.dart';
import 'profile_page.dart';
import 'home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainMenuPage extends StatefulWidget {
  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int _page = 1;
  final ProfilePage _profile = new ProfilePage();
  final CommunityPage _community = new CommunityPage();
  final ShowcaseSuccessTimeline _home = new ShowcaseSuccessTimeline();

  Widget _showPage = new ShowcaseSuccessTimeline();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _profile;
        break;
      case 1:
        return _home;
        break;
      case 2:
        return _community;
        break;
      default:
        return new Container(
          child: Center(
            child: Text('No Page Found!'),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: _showPage,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60.0,
        index: _page,
        color: Color(0xFF4dff4d),
        backgroundColor: Colors.white,
        animationCurve: Curves.linearToEaseOut,
        items: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.person,
                color: Colors.white,
              ),
              Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Text(
                "Home",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.people,
                color: Colors.white,
              ),
              Text(
                "Community",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
    );
  }
}
