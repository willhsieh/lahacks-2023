import 'package:demo_1/main.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: MyColors.c1,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Location location = Location();
  String lat= "";
  String long ="";
  double _deslat = 34;
  double _deslong = -130;
  String desAng = "";
  double desAng2 = 10;
  double bias = 10;
  double _x_delta = 0;
  double _y_delta = 0;



  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    initializeAng();
  }

  initializeAng() async{
    LocationData _locationData = await location.getLocation();
    setState(() {
        lat = _locationData.latitude!.toStringAsFixed(5);
        long = _locationData.longitude!.toStringAsFixed(5);
        _x_delta = _deslong - _locationData.longitude!;
        _y_delta = _deslat - _locationData.latitude!;
        print("destination long" + _deslong.toString());
        print("location long" + _locationData.longitude.toString());
        print("desination lat" + _deslat.toString());
        print("location lat" + _locationData.latitude.toString());
        print(_x_delta.toString());
        print(_y_delta.toString());
        desAng2 = (math.atan2(_y_delta, _x_delta)) * 180 / math.pi;
        if (desAng2 < 0) {
          desAng2 += 360;
        }
        desAng = desAng2.toString();
      });
  }


  getLoc() async{
    
    location.onLocationChanged.listen((LocationData currentLocation) {
      print("${currentLocation.longitude} : ${currentLocation.latitude}");
      setState(() {
        lat = currentLocation.latitude!.toStringAsFixed(5);
        long = currentLocation.longitude!.toStringAsFixed(5);
        _x_delta = _deslong - currentLocation.longitude!;
        _y_delta = _deslat - currentLocation.latitude!;
        desAng2 = (math.atan2(_y_delta, _x_delta)) * 180 / math.pi;
        desAng = desAng2.toString();
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "Location: ${lat ?? "Loading ..."}, ${long ?? "Loading ..." }",
            ),
            Text(
              "Desired Location: ${_deslat}, ${_deslong}",
            ),
            Text(
              "Angle to Loc: ${desAng ?? "Loading ..."}",
            ),
            const Text(
              "Finding Nearest Landmark...",
            ),
            StreamBuilder<CompassEvent>(
                stream: FlutterCompass.events,
                  builder: (context, snapshot) {
                if (snapshot.hasError) {
                    return Text('Error reading heading: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                            child: CircularProgressIndicator(),
                            );
                }

                double direction = snapshot.data!.heading!;
                direction += 90;
                direction = 180 - direction;
                if (direction < 0){
                  direction += 360;
                }
        // if direction is null, then device does not support this sensor
        // show error message
              if (direction == null)
                    return Center(
                    child: Text("Device does not have sensors !"),
              );
              if(direction <= desAng2 + bias && direction >= desAng2 - bias ){
                return Text("Alignment Complete do AR"+ direction.toString());
              }
              else if(direction - desAng2 < 0){
                return Text("Turn Left" + desAng2.toString());
              }
              else{
                return Text("Turn Right" + desAng2.toString());
              }

        return Text((direction * (math.pi / 180) * -1).toString(),);
              
              
                  }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.camera),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




