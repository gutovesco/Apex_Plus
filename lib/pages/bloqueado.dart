import 'package:flutter/material.dart';

class Bloqueado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bloqueado"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.lock,
              color: Colors.grey,
              size: 95,
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Oops!\nParece que esse conteúdo ainda não foi liberado!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SpartanRegular',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
