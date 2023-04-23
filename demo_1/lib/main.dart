import 'package:flutter/material.dart';

import 'welcome.dart';
import 'home.dart';

import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void test() async {
  print("IN HERE");

  String pathToReference = "Sites";
  //Intializing geoFire
  Geofire.initialize(pathToReference);

  Map<String, dynamic> response2 = await Geofire.getLocation("Bruin Bear");

  print(response2);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "lahacks2023",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //test();
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
  );
}
