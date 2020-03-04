
import 'package:flutter/material.dart';
import 'package:apex_plus/ui/login_page.dart';
import 'package:apex_plus/_shared/lib/env.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  static String _pkg = "gooey_edge";
  static String get pkg => Env.getPackage(_pkg);

  @override
  Widget build(BuildContext context) {
     return new MaterialApp(
      title: 'Apex Plus',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
