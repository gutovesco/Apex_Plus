import 'package:flutter/material.dart';
import 'package:apex_plus/ui/login_page.dart';
import 'package:apex_plus/_shared/lib/env.dart';
import 'package:flutter_showcase/flutter_showcase.dart';

void main() {
  runApp(
    Showcase(
      theme: TemplateThemeData(
          brightness: Brightness.dark,
          backgroundColor: Colors.deepOrangeAccent,
          titleTextStyle: TextStyle(
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.1,
              letterSpacing: 5),
          descriptionTextStyle: TextStyle(
              fontFamily: 'WorkSans',
              color: Colors.white70,
              fontWeight: FontWeight.w400,
              letterSpacing: 2),
          flutterLogoColor: FlutterLogoColor.white,
          frameTheme: FrameThemeData(
            frameColor: Colors.white,
            statusBarBrightness: Brightness.dark,
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            textTheme: ButtonTextTheme.accent,
            padding: EdgeInsets.all(16),
          ),
          buttonTextStyle: TextStyle(
              fontFamily: 'WorkSans',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
          buttonIconTheme: IconThemeData(color: Colors.black)),
      links: [
        LinkData(
            title: 'Demo',
            icon: Image.asset('images/youtube.png', fit: BoxFit.fitHeight),
            url: 'https://www.youtube.com/watch?v=n6aQlLRiCPc'),
        LinkData.github(
            'https://github.com/KyleKun/Hackathon-CCR-2020-Prototype'),
      ],
      logoLink: LinkData(
          icon: Image.asset('assets/img/login_logo.png'), title: 'Apex Plus'),
      title: 'Apex Plus',
      description:
          'Bem vindo(a) ao protótipo Apex Plus!\nFaça Login no celular ao lado para começar.\n\nUsuário: teste@gmail.com\nSenha: teste123',
      app: App(),
    ),
  );
}

class App extends StatelessWidget {
  static String _pkg = "gooey_edge";
  static String get pkg => Env.getPackage(_pkg);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Apex Plus',
      theme: new ThemeData(primaryColor: Color(0xFF4dff4d)),
      home: new LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
