// import 'package:location/location.dart';
import 'package:sensors_plus/sensors_plus.dart';

Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() =>
    // Imagine that this function is
    // more complex and slow.
    Future.delayed(
      const Duration(seconds: 2),
      () => 'Large Latte',
    );


Future<void> main() async {
  // //print('Fetching user order...');\
  // var location = Location();
  // final locationdata = await location.getLocation();
  // print("Location: ${locationdata.latitude}, ${locationdata.longitude}");
  // print(await createOrderMessage());

  userAccelerometerEvents.listen((UserAccelerometerEvent event) {
  print(event);
});
// [UserAccelerometerEvent (x: 0.0, y: 0.0, z: 0.0)]

accelerometerEvents.listen((AccelerometerEvent event) {
  print(event);
});
// [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]

gyroscopeEvents.listen((GyroscopeEvent event) {
  print(event);
});
// [GyroscopeEvent (x: 0.0, y: 0.0, z: 0.0)]

magnetometerEvents.listen((MagnetometerEvent event) {
  print(event);
});
}