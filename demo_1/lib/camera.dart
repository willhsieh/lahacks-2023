import 'package:demo_1/main.dart';
import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'dart:async';

class VoyagAR extends StatefulWidget {
  @override
  _VoyagARState createState() => _VoyagARState();
}

int rand() {
  return Random().nextInt(3);
}

class _VoyagARState extends State<VoyagAR> {
  late ARKitController arkitController;
  final _animationDuration = const Duration(seconds: 2);
  late Timer _timer1;
  late Timer _timer2;
  late Color _color1;
  late Color _color2;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _timer1 = Timer.periodic(_animationDuration, (timer) => _changeColorLeft());
    _timer2 =
        Timer.periodic(_animationDuration, (timer) => _changeColorRight());
    _color1 = MyColors.c4;
    _color2 = MyColors.c4;
  }

  void _changeColorLeft() {
    Color newColor = MyColors.c4;
    int direction = rand();
    if (direction == 1) {
      newColor = MyColors.c3;
    }
    setState(() {
      _color1 = newColor;
    });
  }

  void _changeColorRight() {
    Color newColor = MyColors.c4;
    int direction = rand();
    if (direction == 1) {
      newColor = MyColors.c3;
    }
    setState(() {
      _color2 = newColor;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('voyagAR'),
          backgroundColor: MyColors.c1,
        ),
        body: Stack(
          children: [
            ARKitSceneView(onARKitViewCreated: onARKitViewCreated),
            AnimatedContainer(
              margin: const EdgeInsets.only(left: 30, right: 260, top: 300),
              duration: _animationDuration,
              child: Icon(CupertinoIcons.arrow_left_circle_fill,
                  size: 120, color: _color1),
            ),
            Container(
              margin: const EdgeInsets.only(left: 260, right: 30, top: 300),
              child: Icon(CupertinoIcons.arrow_right_circle_fill,
                  size: 120, color: _color2),
            ),
          ],
        ),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    final text = ARKitText(
      text: 'ur mom',
      extrusionDepth: 1,
      materials: [
        ARKitMaterial(
          diffuse: ARKitMaterialProperty.color(MyColors.c2),
        )
      ],
    );
    final node = ARKitNode(
      geometry: text,
      position: Vector3(0, 0, -0.5),
      scale: Vector3(0.02, 0.02, 0.02),
    );
    this.arkitController.add(node);
  }
}
