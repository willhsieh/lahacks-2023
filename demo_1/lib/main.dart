import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:firebase_database/firebase_database.dart';


import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// import 'welcome.dart';
import 'home.dart';

void test () async {
  print("IN HERE");
  
  String pathToReference = "Sites";
  //Intializing geoFire
  Geofire.initialize(pathToReference);
  
  bool? response = await Geofire.setLocation(
        "Bruin Bear",
        34.070986640932965, 
        -118.44503609526602);
  
  Map<String, dynamic> response2 =
        await Geofire.getLocation("1682202122196");

  print(response2);
        
}

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "lahacks2023",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  test();
  print("2222222222");
}