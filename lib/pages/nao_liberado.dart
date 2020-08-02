import 'package:flutter/material.dart';

class NaoLiberado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pra que a pressa?"),
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
                'Oops!\nVocê tem que completar as lições anteriores antes de seguir em frente!',
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
