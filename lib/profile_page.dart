import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class ProfilePageDesign extends StatefulWidget {
  @override
  _ProfilePageDesignState createState() => _ProfilePageDesignState();
}

class _ProfilePageDesignState extends State<ProfilePageDesign> {

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {

  TextStyle _style(){
    return TextStyle(
      fontWeight: FontWeight.bold
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Name", style: TextStyle(fontFamily: "SpartanRegular",)),
            SizedBox(height: 4,),
            Text("Apex Plus",style: TextStyle(fontFamily: "SpartanRegular",)),
            SizedBox(height: 16,),

            Text("CNPJ", style: TextStyle(fontFamily: "SpartanRegular",)),
            SizedBox(height: 4,),
            Text("451.428.744-58", style: TextStyle(fontFamily: "SpartanRegular",)),
            SizedBox(height: 16,),

            Text("Location",style: TextStyle(fontFamily: "SpartanRegular",)),
            SizedBox(height: 4,),
            Text("São Paulo, Brazil", style: TextStyle(fontFamily: "SpartanRegular",)),
            SizedBox(height: 16,),

          ],
        ),
      ),
    );
  }
}


final String url = "https://upload.wikimedia.org/wikipedia/commons/0/05/Di_logo_apex.jpg";

class CustomAppBar extends StatelessWidget
  with PreferredSizeWidget{

  @override
  Size get preferredSize => Size(double.infinity, 320);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
          gradient: new LinearGradient(
                  colors: [
                    Color(0xff00FF00),
                    Color(0xffFFFF32),
                    
                    
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1],),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 20,
              offset: Offset(0, 1)
            )
          ]
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text("Profile", style: TextStyle(
                  fontFamily: "SpartanRegular",
                  color: Colors.white,
                  fontSize: 16,
                ),),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[

                Column(
                  children: <Widget>[
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(url)
                          )
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Apex Plus", style: TextStyle(
                      fontFamily: "SpartanRegular",
                      color: Colors.white,
                      fontSize: 20
                    ),)
                  ],
                ),

                Column(
                  children: <Widget>[
                    Text("Roadmap\n Finished", style: TextStyle(
                      fontFamily: "SpartanRegular",
                      color: Colors.white
                    ),),
                    Text("3", style: TextStyle(
                      fontFamily: "SpartanRegular",
                        fontSize: 20,
                        color: Colors.white
                    ),)
                  ],
                ),

                Column(
                  children: <Widget>[
                    Text("Exportations", style: TextStyle(
                      fontFamily: "SpartanRegular",
                        color: Colors.white
                    ),),
                    Text("12", style: TextStyle(
                      fontFamily: "SpartanRegular",
                        fontSize: 20,
                        color: Colors.white
                    ),)
                  ],
                ),


                Column(
                  children: <Widget>[
                    Text("Contacts", style: TextStyle(
                      fontFamily: "SpartanRegular",
                        color: Colors.white
                    ),),
                    Text("24", style: TextStyle(
                      fontFamily: "SpartanRegular",
                        fontSize: 20,
                        color: Colors.white
                    ),)
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                Column(
                  children: <Widget>[
                    Text("Savings", style: TextStyle(
                      fontFamily: "SpartanRegular",
                      color: Colors.white
                    ),),
                    Text("20K", style: TextStyle(
                      fontFamily: "SpartanRegular",
                      color: Colors.white,
                      fontSize: 20
                    ),)
                  ],
                ),

                SizedBox(width: 22,),

                Column(
                  children: <Widget>[
                    Text("July Goals",
                    style: TextStyle(
                      fontFamily: "SpartanRegular",
                      color: Colors.white
                    ),),
                    Text("50K", style: TextStyle(
                      fontFamily: "SpartanRegular",
                        color: Colors.white,
                        fontSize: 20
                    ))
                  ],
                ),

                SizedBox(width: 16,)

              ],
            ),
            SizedBox(height: 8,),

            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: (){
                  print("//TODO: button clicked");
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 16, 10),
                  child: Transform.rotate(
                    angle: (math.pi * 0.05),
                    child: Container(
                      width: 110,
                      height: 32,
                      child: Center(child: Text("Edit Profile", style: TextStyle(fontFamily: "SpartanRegular",)),),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20
                          )
                        ]
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    Path p = Path();

    p.lineTo(0, size.height-70);
    p.lineTo(size.width, size.height);

    p.lineTo(size.width, 0);

    p.close();

    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}