import 'package:apex_plus/post.dart';
import 'package:flutter/material.dart';
import 'community_page.dart';
//import 'profile_page.dart';
import 'home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainMenuPage extends StatefulWidget {
  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int _page = 0;
  //final ProfilePage _profile = new ProfilePage();
  final NewPost _newPost = new NewPost();
  final CommunityPage _community = new CommunityPage();
  final HomePage _home = new HomePage();

  Widget _showPage = new NewPost();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _newPost;
        break;
      case 1:
        return _home;
        break;
      case 2:

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
        color: Colors.green,
        backgroundColor: Colors.blue,
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
                "Post",
                style: TextStyle(color: Colors.white, fontSize: 10, ),
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
                "View",
                style: TextStyle(color: Colors.white, fontSize: 10, ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.attach_money,
                color: Colors.white,
              ),
              Text(
                "Publish",
                style: TextStyle(color: Colors.white, fontSize: 10, ),
              ),
            ],
          ),
        ],
        onTap: (int tappedIndex) {
          if(tappedIndex == 2){
            _neverSatisfied();
          }else{
            setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
          }
          
        },
      ),
    );
  }

  Future<void> _neverSatisfied() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Rewind and remember'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('You will never be satisfied.'),
              Text('You\’re like me. I’m never satisfied.'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

}
