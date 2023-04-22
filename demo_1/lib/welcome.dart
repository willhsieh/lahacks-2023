import 'package:demo_1/home.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 125, right: 100, top: 140),
                height: 150,
                width: 150,
                child: Image.asset('images/logo.png'),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 10, top: 370),
                
                child: const Text("welcome to voyagAR",
                                  style: TextStyle(fontFamily: 'Noto Sans', fontStyle: FontStyle.italic, fontSize: 24)),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF00649C),
          // elevation: 0,
          foregroundColor: Colors.white,
          onPressed: () {
            runApp(const HomePage());
          },
          child: const Icon(Icons.arrow_forward),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}