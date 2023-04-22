import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
=======
>>>>>>> fba6048e295fa3f65735062354126acf94590ced

import 'welcome.dart';
import 'home.dart';

<<<<<<< HEAD
void test() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void main() {
  test();
  return runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
=======
void main() {
  runApp(WelcomePage());
}

class MyColors {
  static const MaterialColor c1 = MaterialColor(
    0xFF00649C,
    <int, Color>{
      50: Color(0xFF00649C),
      100: Color(0xFF00649C),
      200: Color(0xFF00649C),
      300: Color(0xFF00649C),
      400: Color(0xFF00649C),
      500: Color(0xFF00649C),
      600: Color(0xFF00649C),
      700: Color(0xFF00649C),
      800: Color(0xFF00649C),
      900: Color(0xFF00649C),
    },
>>>>>>> fba6048e295fa3f65735062354126acf94590ced
  );
}
