import 'package:demo_1/main.dart';
import 'package:demo_1/welcome.dart';
import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;
import 'joe.dart';
import 'package:collection/collection.dart';

import 'package:flutter/services.dart';

import 'package:flutter_geofire/flutter_geofire.dart';

class VoyagAR extends StatefulWidget {
  @override
  _VoyagARState createState() => _VoyagARState();
}

int rand() {
  return Random().nextInt(3);
}

class _VoyagARState extends State<VoyagAR> {
  late ARKitController arkitController;
  final _animationDuration = const Duration(seconds: 1);
  late Timer _timer1;
  late Timer _timer2;
  late Color _color1;
  late Color _color2;
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
  dynamic _heading;
  ValueNotifier<int> _direction = ValueNotifier(1);

  Future<void> initPlatformState() async {
    LocationData _locationData = await location.getLocation();
    print("grabbed location data");
    String pathToReference = "Sites";

    //Intializing geoFire
    Geofire.initialize(pathToReference);

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      Geofire.queryAtLocation(
              _locationData.latitude!, _locationData.longitude!, 0.1)!
          .listen((map) async {
        print(map);
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
          print(_x_delta);
          print(_y_delta);
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
          print(map);
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
          print(error);
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
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _timer1 = Timer.periodic(_animationDuration, (timer) => _changeColorLeft());
    _timer2 =
        Timer.periodic(_animationDuration, (timer) => _changeColorRight());
    _color1 = MyColors.c4;
    _color2 = MyColors.c4;
    FlutterCompass.events!.listen((heading) {
      _heading = heading;
    });
    _direction.addListener(() {
      //refreshAR(point);
    });
  }

  void compassCalc() {
    int exit = 0;
    //print(_heading);
    double direction = _heading.heading!;
    //print(direction);
    direction += 90;
    direction = 180 - direction;
    if (direction < 0) {
      direction += 360;
    }
    // if direction is null, then device does not support this sensor
    // show error message

    if (direction <= desAng2 + bias && direction >= desAng2 - bias) {
      exit = 0; //correct
    } else if (direction - desAng2 < 0) {
      exit = 1; //left
    } else {
      exit = 2; //right
    }
    //print(exit);

    _direction.value = exit;
  }

  void _changeColorLeft() {
    Color newColor = MyColors.c4;
    compassCalc();
    int direction = _direction.value;
    if (direction == 1) {
      newColor = MyColors.c3;
    }
    setState(() {
      _color1 = newColor;
    });
  }

  void _changeColorRight() {
    Color newColor = MyColors.c4;
    compassCalc();
    int direction = _direction.value;
    if (direction == 2) {
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
            ARKitSceneView(
                enableTapRecognizer: true,
                onARKitViewCreated: onARKitViewCreated),
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
            /*Container(
              margin: const EdgeInsets.only(left: 300, right: 30, top: 650),
              child: FloatingActionButton.extended(
                backgroundColor: MyColors.c1,
                foregroundColor: MyColors.c2,
                onPressed: () {
                  runApp(HomePage());
                },
                label: const Icon(Icons.home),
              ),
            ),*/
          ],
        ),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onARTap = (ar) {
      final point = ar.firstWhereOrNull(
        (o) => o.type == ARKitHitTestResultType.featurePoint,
      );
      if (point != null) {
        refreshAR(point);
      }
    };
  }

  void refreshAR(ARKitTestResult point) async {
    //vector.Matrix4? camMatrix = await arkitController.cameraProjectionMatrix();
    //print(camMatrix!.toString());
    //vector.Vector4 pos = camMatrix!.getColumn(3);

    final position = vector.Vector3(
      point.worldTransform.getColumn(3).x,
      point.worldTransform.getColumn(3).y,
      point.worldTransform.getColumn(3).z,
    );

    final text = ARKitText(
      text: 'ur mom',
      extrusionDepth: 1,
      materials: [
        ARKitMaterial(
          diffuse: ARKitMaterialProperty.color(MyColors.c2),
        )
      ],
    );

    try {
      if (_direction.value is int) {
        print("correct");

        final node = ARKitNode(
            geometry: text,
            position: position,
            scale: vector.Vector3(0.02, 0.02, 0.02));
        arkitController.add(node);
        print("spawned");
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
