import 'package:apex_plus/styleguide/colors.dart';
import 'package:apex_plus/styleguide/text_style.dart';
import 'package:apex_plus/theme.dart';
import 'package:flutter/material.dart';

import 'commons/collapsing_navigation_drawer_widget.dart';

/*child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
           IconButton(
        icon: Icon(Icons.insert_chart),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
            ],
          )
*/

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        elevation: 0.0,
        backgroundColor: drawerBackgroundColor,
        title: Text("Community"),
      ),
      drawer: CollapsingNavigationDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Posts",
              style: headingTextStyle.copyWith(color: Colors.black),
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
                    hintText: "Search",
                    hintStyle: whiteSubHeadingTextStyle.copyWith(color: hintTextColor)),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Text(
                    "Super likes",
                    style: subTitleStyle.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    width: 20,
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
                  Text(
                    "1h",
                    style: subTitleStyle.copyWith(color: Colors.black),
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
                      "Anne",
                      style: titleStyle,
                    ),
                    subtitle: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          "assets/icons/location_pin.png",
                          width: 15.0,
                          height: 15.0,
                          color: Colors.black,
                        ),
                        Text(
                          "  34 kilometers",
                          style: whiteSubHeadingTextStyle.copyWith(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                    leading: ClipOval(
                      child: Image.asset(
                        "assets/images/anne.jpeg",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    trailing: SizedBox(
                      width: 75,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "ONLINE",
                                  style: whiteSubHeadingTextStyle.copyWith(color: Colors.green, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              Icons.star,
                              color: blueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}