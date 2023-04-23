import 'package:demo_1/geofire.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'welcome.dart';
import 'home.dart';

void test() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void main() {
  test();
  runApp(WelcomePage());
}

class MyColors {
  static const MaterialColor c1 = MaterialColor(
    0xFF00649C,
    <int, Color>{
      50: Color(0x7700649C),
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
  );
  static const MaterialColor c2 = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );
  static const MaterialColor c3 = MaterialColor(
    0x7700649C,
    <int, Color>{
      50: Color(0x7700649C),
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
  );
  static const MaterialColor c4 = MaterialColor(
    0x00000000,
    <int, Color>{
      50: Color(0x7700649C),
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
  );
  static const MaterialColor c5 = MaterialColor(
    0x33000000,
    <int, Color>{
      50: Color(0x7700649C),
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
  );
}
