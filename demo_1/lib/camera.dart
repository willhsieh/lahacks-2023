import 'package:demo_1/main.dart';
import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/cupertino.dart';


class VoyagAR extends StatefulWidget {
  @override
  _VoyagARState createState() => _VoyagARState();
}

class _VoyagARState extends State<VoyagAR> {
  late ARKitController arkitController;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
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
        Container(
          margin: const EdgeInsets.only(left: 30, right: 260, top: 300),
          child: const Icon(CupertinoIcons.arrow_left_circle_fill, size: 120, color: MyColors.c3),
        ),
        Container(
          margin: const EdgeInsets.only(left: 260, right: 30, top: 300),
          child: const Icon(CupertinoIcons.arrow_right_circle_fill, size: 120, color: MyColors.c3),
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