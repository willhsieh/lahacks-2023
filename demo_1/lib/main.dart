import 'package:flutter/material.dart';
// import 'welcome.dart';
import 'home.dart';

void main() {
  return runApp(
      const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
}