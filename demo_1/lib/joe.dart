import 'package:demo_1/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  void initState() {
    runApp(MaterialApp(home: VoyagAR()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        foregroundColor: Colors.black,
        onPressed: () {
          runApp(MaterialApp(home: VoyagAR()));
        },
        child: const Icon(Icons.arrow_forward),
      ),
    ));
  }
}
