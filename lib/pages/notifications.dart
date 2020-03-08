import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

//The content of the notification tab.
class Notification extends StatefulWidget {
  @override
  _NotificationState createState() => new _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return _buildPostList();
  }

  Widget _buildPostList() {
    return new Scaffold(
        backgroundColor: Colors.blue,
        body: new Scrollbar(
            child: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return new Container(
                child: new Stack(children: <Widget>[
              new Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 0.0, left: 12.0),
                      child: DummyPost()),
                ],
              ),
              replyNotification(),
            ]));
          },
          itemCount: 2,
        )));
  }

  Widget replyNotification() {
    return new Positioned(
      left: 175,
      top: 205.5,
      child: new Container(
          padding: EdgeInsets.only(left: 3.0, right: 3.0),
          decoration: new BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
          constraints: BoxConstraints(
            minWidth: 30,
            minHeight: 30,
          ),
          child: Row(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 0.0),
                  child: new Text(
                    '+',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                    textAlign: TextAlign.center,
                  )),
              Container(
                  padding: EdgeInsets.only(right: 0.0),
                  child: new Text(
                    '3',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )),
            ],
          )),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: new Container(
      child: Text("HomePageStuff"),
    ));
  }
}

//A dummy post in notififications tab
class DummyPost extends StatefulWidget {
  @override
  _DummyPostState createState() => new _DummyPostState();
}

class _DummyPostState extends State<DummyPost> {
  bool monVal = false;
  bool reportPressed = false;

  Widget commentButton() {
    return RaisedButton(
      child: Text("ReplyButton"),
      onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => commentFoundation())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return postList();
  }

  Widget postList() {
    return Column(children: <Widget>[
      new GestureDetector(
          //this type works
          onTap: () => Navigator.pushNamed(context, '/comment'),
          child: new Stack(children: <Widget>[
            Column(children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Container(
                  margin: EdgeInsets.only(top: 35.0),
                  width: 390.0,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        //15?
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: Colors.white,
                      elevation: 2.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Flexible(
                              child: ListTile(
                            // The main post content
                            subtitle: Container(
                              height: 130.0,
                              margin: EdgeInsets.only(
                                  top: 15.0, left: 15.0, right: 15.0),
                              child: Container(
                                  child: Center(
                                      child: Text(
                                "This is a dummy post",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    wordSpacing: 3.0,
                                    color: Colors.black,
                                    fontSize: 18.0),
                              ))),
                            ),
                          )),
                          //button row
                          new Container(
                              width: 400.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 0.0),
                                    width: 190.0,
                                    height: 40.0,
                                    child: commentButton(),
                                  ),
                                  // Text to indicate comment numbers
                                ],
                              )),
                        ],
                      ))),
            ]),
          ]))
    ]);
  }
}

//the entire comment page.
class commentFoundation extends StatefulWidget {
  @override
  _commentFoundationState createState() => new _commentFoundationState();
}

class _commentFoundationState extends State<commentFoundation> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.green,
        appBar: _buildAppBar(),
        body: new Stack(children: <Widget>[
          ListView.builder(
              shrinkWrap: true,
              controller: _scrollController,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return new individualComment();
              }),
        ]));
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text("REPLIES"),
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
    );
  }
}

//Each individual comment you see when you click on a post
class individualComment extends StatefulWidget {
  final String title;

  const individualComment({Key key, this.title}) : super(key: key);

  @override
  _individualCommentState createState() => new _individualCommentState();
}

class _individualCommentState extends State<individualComment> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        Column(children: <Widget>[
          //this used to be an expanded
          new Container(
              child: Card(
                  elevation: 0.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new ListTile(
                        // The avatar
                        leading: Container(
                            child: Icon(
                          Icons.accessibility_new,
                        )),
                        // Title, location, and time

                        // The main post content
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 0.0),
                          child: Text(
                            "This is a reply",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: .0364609 *
                                    MediaQuery.of(context).size.width),
                          ),
                        ),
                      ),
                    ],
                  ))),
        ])
      ],
    );
  }
}

//*****This is just the tabbar.
class MainScreen extends StatefulWidget {
  @override
  _MainScreenstate createState() => new _MainScreenstate();
}

class _MainScreenstate extends State<MainScreen> with TickerProviderStateMixin {
  String _lastSelected = '0';
  final List<Widget> _bodyOptions = [
    HomePage(),
    Notification(),
  ];
  int _selectedIndex = 0;
  bool tab = true;

  _selectedTab(int index) {
    setState(() {
      _lastSelected = '$index';
    });
  }

  Widget __buildTabs() {
    return Scaffold(
        body: _bodyOptions.elementAt(int.parse(_lastSelected)),
        //around the FAB
        backgroundColor: const Color(0xFFF4F4F4),
        bottomNavigationBar: new Stack(
          children: <Widget>[
            FABBottomAppBar(
              height: 45.0,
              centerItemText: '',
              color: Colors.black,
              selectedColor: Colors.blue,
              notchedShape: CircularNotchedRectangle(),
              onTabSelected: _selectedTab,
              items: [
                FABBottomAppBarItem(iconData: Icons.search, text: 'Home'),
                FABBottomAppBarItem(
                    iconData: Icons.notifications, text: 'Notifications'),
              ],
            ),

            //the red "notification" marble
            new Positioned(
              right: 20,
              top: 0.5,
              child: new Container(
                padding: EdgeInsets.all(1),
                decoration: new BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                constraints: BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
                child: new Text(
                  '6',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return __buildTabs();
  }
}

//Everything below is boiler plate tabbar code.
class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text});

  IconData iconData;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    this.items,
    this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }

  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
    return _selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      elevation: 0.0,
      notchMargin: 2.0,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      //color of bottom
      color: Colors.white,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text,
                  style: TextStyle(color: color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
