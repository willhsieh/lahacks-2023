import 'package:demo_1/camera.dart';
import 'package:demo_1/main.dart';
import 'package:demo_1/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:location/location.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

import 'dart:async';
import 'package:flutter/services.dart';

import 'package:flutter_geofire/flutter_geofire.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: CupertinoThemeData(brightness: Brightness.light),
      home: NavBarExample(),
    );
  }
}

class NavBarExample extends StatefulWidget {
  const NavBarExample({super.key});

  @override
  State<NavBarExample> createState() => _NavBarExampleState();
}

class _NavBarExampleState extends State<NavBarExample> {
  Location location = Location();
  String lat = "";
  String long = "";
  double _deslat = 34;
  double _deslong = -130;
  String desAng = "";
  double desAng2 = 10;
  double bias = 10;
  double _x_delta = 0;
  double _y_delta = 0;
  List<String> keysRetrieved = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //initializeAng();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    LocationData _locationData = await location.getLocation();
    //print("grabbed location data");
    String pathToReference = "Sites";

    //Intializing geoFire
    Geofire.initialize(pathToReference);

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      Geofire.queryAtLocation(
              _locationData.latitude!, _locationData.longitude!, 0.1)!
          .listen((map) async {
        //
        //print(map);
        if (map != null) {
          var callBack = map['callBack'];

          //latitude will be retrieved from map['latitude']
          //longitude will be retrieved from map['longitude']

          switch (callBack) {
            case Geofire.onKeyEntered:
              keysRetrieved.add(map["key"]);
              break;

            case Geofire.onKeyExited:
              keysRetrieved.remove(map["key"]);
              break;

            case Geofire.onKeyMoved:
//              keysRetrieved.add(map[callBack]);
              break;

            case Geofire.onGeoQueryReady:
//              map["result"].forEach((key){
//                keysRetrieved.add(key);
//              });

              break;
          }
        }
        Map<String, dynamic> response =
            await Geofire.getLocation(keysRetrieved[0]);
        setState(() {
          lat = _locationData.latitude!.toStringAsFixed(5);
          long = _locationData.longitude!.toStringAsFixed(5);

          //print(response);
          //print(response["lng"]);
          //print(response["lat"]);
          double _x_delta = response["lng"] - _locationData.longitude!;
          double _y_delta = response["lat"] - _locationData.latitude!;
          desAng2 = (math.atan2(_y_delta, _x_delta)) * 180 / math.pi;
          //print(_x_delta);
          //print(_y_delta);
          if (desAng2 < 0) {
            desAng2 += 360;
          }
          desAng = desAng2.toString();
        });
      }).onError((error) {
        print(error);
      });
    } on PlatformException {
//      response = 'Failed to get platform version.';
    }

    if (!mounted) return;
  }

  Future<void> updateLocation() async {
    location.onLocationChanged.listen((LocationData currentLocation) {
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        Geofire.queryAtLocation(
                currentLocation.longitude!, currentLocation.longitude!, 0.1)!
            .listen((map) async {
          //print(map);
          if (map != null) {
            var callBack = map['callBack'];

            switch (callBack) {
              case Geofire.onKeyEntered:
                keysRetrieved.add(map["key"]);
                break;

              case Geofire.onKeyExited:
                keysRetrieved.remove(map["key"]);
                break;

              case Geofire.onKeyMoved:
//              keysRetrieved.add(map[callBack]);
                break;

              case Geofire.onGeoQueryReady:
//              map["result"].forEach((key){
//                keysRetrieved.add(key);
//              });

                break;
            }
          }
          Map<String, dynamic> response =
              await Geofire.getLocation(keysRetrieved[0]);
          setState(() {
            lat = currentLocation.latitude!.toStringAsFixed(5);
            long = currentLocation.longitude!.toStringAsFixed(5);
            _x_delta = response["lng"] - currentLocation.longitude!;
            _y_delta = response["lat"] - currentLocation.latitude!;

            desAng2 = (math.atan2(_y_delta, _x_delta)) * 180 / math.pi;
            if (desAng2 < 0) {
              desAng2 += 360;
            }
            desAng = desAng2.toString();
          });
        }).onError((error) {
          //(error);
        });
      } on PlatformException {
//      response = 'Failed to get platform version.';
      }

      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      // setState to update our non-existent appearance.
      if (!mounted) return;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('voyagAR'),
          backgroundColor: MyColors.c1,
        ),
        body: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 1,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // print("Container clicked");
                      runApp(MaterialApp(home: VoyagAR()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      // color: MyColors.c1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                            color: MyColors.c5,
                            offset: const Offset(
                              0,
                              5,
                            ),
                            blurRadius: 6.0,
                            spreadRadius: 6.0,
                          ), //BoxShadow
                        ],
                        image: DecorationImage(
                          image: AssetImage("images/bear.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Text("Bruin Bear",
                          style: TextStyle(
                              fontFamily: 'Noto Sans',
                              fontSize: 54,
                              color: MyColors.c2)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    // color: MyColors.c1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: MyColors.c5,
                          offset: const Offset(
                            0,
                            5,
                          ),
                          blurRadius: 6.0,
                          spreadRadius: 6.0,
                        ), //BoxShadow
                      ],
                      image: DecorationImage(
                        image: AssetImage("images/bear.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Text("Bruin Bear",
                        style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 54,
                            color: MyColors.c2)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    // color: MyColors.c1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: MyColors.c5,
                          offset: const Offset(0, 5),
                          blurRadius: 6.0,
                          spreadRadius: 6.0,
                        ), //BoxShadow
                      ],
                      image: DecorationImage(
                        image: AssetImage("images/bear.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Text("Bruin Bear",
                        style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 54,
                            color: MyColors.c2)),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class CupertinoButtonExample extends StatelessWidget {
  const CupertinoButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 460),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                  child: Center(
                child: CupertinoButton(
                    onPressed: () {},
                    // child: const Text('Camera'),
                    color: MyColors.c1,
                    child: const Icon(CupertinoIcons.camera,
                        size: 30, color: MyColors.c2)),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
