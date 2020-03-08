import 'package:apex_plus/styleguide/colors.dart';
import 'package:apex_plus/styleguide/text_style.dart';
import 'package:flutter/material.dart';
import 'commons/collapsing_navigation_drawer_widget.dart';


class CommunityPage extends StatefulWidget {
  @override 
  _CommunityPage createState() => _CommunityPage();
}

class _CommunityPage extends State<CommunityPage> {

  final List<String> subjects = ["Date", "Views", "Name", "User", "Filter"];
  String selectedSubject = "Filter";

  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF4dff4d),
        title: Text("Community", 
        style: TextStyle(
          fontFamily: "SpartanRegular",
          color: Colors.white 
          ),
        ),
      ),
      drawer: CollapsingNavigationDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Posts",
              textAlign: TextAlign.center,
              style: headingTextStyle.copyWith(color: Colors.black, fontFamily: "SpartanRegular",),
            ),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search for a post",
                    hintStyle: whiteSubHeadingTextStyle.copyWith(color: Colors.grey[600], fontFamily: "SpartanRegular", fontSize: 14.0)),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
            SizedBox(
             width: 10,
             ),
                  Text(
                    "New posts",
                    style: TextStyle(color: Colors.black, fontFamily: "SpartanRegular",),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: primaryColor),
                    child: Center(
                      child: Text(
                        "5",
                        style: whiteSubHeadingTextStyle, 
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Spacer(),
                  DropdownButton<String>(
          focusColor: Colors.black,
        iconSize: 24,
        elevation: 6,
        style: TextStyle(color: Colors.black, fontFamily: "SpartanRegular",),
        value: selectedSubject,
        onChanged: (value) {
          setState(() {
            selectedSubject = value;
          });
        },
        items: subjects.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem(
            child: Text(value),
            value: value,
          );
        }).toList(),
      ),
                ],
              )),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: ListTile(
                    title: Text(
                       "Where to get packing list?",
                      style: titleStyle.copyWith(color: Colors.black, fontFamily: "SpartanRegular", fontSize: 14,),
                    ),
                    subtitle: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                         "Made by: Gutro",
                          style: whiteSubHeadingTextStyle.copyWith(color: Colors.black, fontSize: 11.5, fontFamily: "SpartanRegular",),
                        ),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 105,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Spacer(),
                                
                                Text(
                                  "1,506 views",
                                  style: TextStyle(fontFamily: "SpartanRegular", fontSize: 11, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "1h ago",
                              style: TextStyle(fontFamily: "SpartanRegular", fontSize: 11, color: Colors.grey[600]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
          SizedBox(height: 30)
        ],
      ),
    );
  }
}
