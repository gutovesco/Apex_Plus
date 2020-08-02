import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:expansion_card/expansion_card.dart';

// Enum for rotation direction
enum RotationDirection { clockwise, anticlockwise }

class ImageView360 extends StatefulWidget {
  final List<AssetImage> imageList;
  final List<AssetImage> countryList;
  final List<String> textList;
  final List<String> descList;
  final bool autoRotate, allowSwipeToRotate;
  final int rotationCount, swipeSensitivity;
  final Duration frameChangeDuration;
  final RotationDirection rotationDirection;

  ImageView360({
    @required Key key,
    @required this.imageList,
    @required this.countryList,
    @required this.textList,
    @required this.descList,
    this.autoRotate = false,
    this.allowSwipeToRotate = true,
    this.rotationCount = 1,
    this.swipeSensitivity = 1,
    this.rotationDirection = RotationDirection.clockwise,
    this.frameChangeDuration = const Duration(milliseconds: 80),
  }) : super(key: key);

  @override
  _ImageView360State createState() => _ImageView360State();
}

class _ImageView360State extends State<ImageView360> {
  int rotationIndex, senstivity;
  int rotationCompleted = 0;
  double localPosition = 0.0;

  @override
  void initState() {
    senstivity = widget.swipeSensitivity;
    // To bound the sensitivity range from 1-5
    if (senstivity < 1) {
      senstivity = 1;
    } else if (senstivity > 5) {
      senstivity = 5;
    }

    rotationIndex = widget.rotationDirection == RotationDirection.anticlockwise
        ? 0
        : (widget.imageList.length - 1);

    if (widget.autoRotate) {
      // To start the image rotation
      rotateImage();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        GestureDetector(
          onHorizontalDragEnd: (details) {
            localPosition = 0.0;
          },
          onHorizontalDragUpdate: (details) {
            // Swipe check,if allowed than only will image move
            if (widget.allowSwipeToRotate) {
              if (details.delta.dx > 0) {
                handleRightSwipe(details);
              } else if (details.delta.dx < 0) {
                handleLeftSwipe(details);
              }
            }
          },
          child: Image(image: widget.imageList[rotationIndex]),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Text('🌍 Clique, segure e arraste 🌍'),
            ),
          ],
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Baseado no seu produto e perfil,\nselecionamos os melhores países para você exportar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'SpartanRegular',
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          width: 300,
          child: Neumorphic(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  depth: 8,
                  lightSource: LightSource.topLeft,
                  color: Colors.white),
              child: ExpansionCard(
                initiallyExpanded: true,
                borderRadius: 30,
                leading: SizedBox(
                  width: 50,
                  height: 40,
                  child: Image(
                    image: widget.countryList[rotationIndex],
                    fit: BoxFit.contain,
                  ),
                ),
                backgroundColor: Colors.lightGreenAccent[300],
                title: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.textList[rotationIndex],
                        style: TextStyle(
                          fontFamily: 'BalooBhai',
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8, right: 8),
                        child: Text(widget.descList[rotationIndex],
                            style: TextStyle(
                                fontFamily: 'BalooBhai',
                                fontSize: 17,
                                color: Colors.black)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 30, bottom: 20),
                            child: Container(
                              width: 100.0,
                              height: 35.0,
                              child: RaisedButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                padding: EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xff41ea5d),
                                          Color(0xffb5f2bf)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 300.0, minHeight: 50.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Entenda",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )),
        ),
      ],
    );
  }

  void rotateImage() async {
    // Check for rotationCount
    if (rotationCompleted < widget.rotationCount) {
      // Frame change duration logic
      await Future.delayed(widget.frameChangeDuration);
      if (mounted) {
        setState(() {
          if (widget.rotationDirection == RotationDirection.anticlockwise) {
            // Logic to bring the frame to initial position on cycle complete in positive direction
            if (rotationIndex < widget.imageList.length - 1) {
              rotationIndex++;
            } else {
              rotationCompleted++;
              rotationIndex = 0;
            }
          } else {
            // Logic to bring the frame to initial position on cycle complete in negative direction
            if (rotationIndex > 0) {
              rotationIndex--;
            } else {
              rotationCompleted++;
              rotationIndex = widget.imageList.length - 1;
            }
          }
        });
      }
      //Recursive call
      rotateImage();
    }
  }

  void handleRightSwipe(DragUpdateDetails details) {
    if ((localPosition +
            (pow(4, (6 - senstivity)) / (widget.imageList.length))) <=
        details.localPosition.dx) {
      rotationIndex = rotationIndex + 1;
      localPosition = details.localPosition.dx;
    }
    setState(() {
      if (rotationIndex < widget.imageList.length - 1) {
        rotationIndex = rotationIndex;
      } else {
        rotationIndex = 0;
      }
    });
  }

  void handleLeftSwipe(DragUpdateDetails details) {
    double distancedifference = (details.localPosition.dx - localPosition);
    if (distancedifference < 0) {
      distancedifference = (-distancedifference);
    }
    if (distancedifference >=
        (pow(4, (6 - senstivity)) / (widget.imageList.length))) {
      rotationIndex = rotationIndex - 1;
      localPosition = details.localPosition.dx;
    }
    setState(() {
      if (rotationIndex > 0) {
        rotationIndex = rotationIndex;
      } else {
        rotationIndex = widget.imageList.length - 1;
      }
    });
  }
}
