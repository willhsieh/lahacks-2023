import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';

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
      appBar: AppBar(title: const Text('ARKit in Flutter')),
      body: ARKitSceneView(onARKitViewCreated: onARKitViewCreated));

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    final node = ARKitNode(
        geometry: ARKitSphere(radius: 0.1), position: Vector3(0, 0, -0.5));
    this.arkitController.add(node);
  }
}

// //ARkit stuff
// class ARkit extends StatefulWidget {
//   const ARkit({super.key});

//   @override
//   State<ARkit> createState() => _ARkitState();
// }

// class _ARkitState extends State<ARkit> {
//   late ARKitController arkitController;

//   @override
//   void dispose() {
//     arkitController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//       body: Container(
//           width: 300,
//           height: 400,
//           child: ARKitSceneView(onARKitViewCreated: onARKitViewCreated)));

//   void onARKitViewCreated(ARKitController arkitController) {
//     this.arkitController = arkitController;
//     final node = ARKitNode(
//         geometry: ARKitSphere(radius: 0.1), position: Vector3(0, 0, -0.5));
//     this.arkitController.add(node);
//   }
// }
// //END ARkit stuff