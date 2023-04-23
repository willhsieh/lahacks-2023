import 'package:demo_1/camera.dart';
import 'package:demo_1/main.dart';
import 'package:demo_1/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';

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
                    child: const Text("Bruin Bear", style: TextStyle(fontFamily: 'Noto Sans', fontSize: 54, color: MyColors.c2)),
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
                  child: const Text("Bruin Bear", style: TextStyle(fontFamily: 'Noto Sans', fontSize: 54, color: MyColors.c2)),
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
                  child: const Text("Bruin Bear", style: TextStyle(fontFamily: 'Noto Sans', fontSize: 54, color: MyColors.c2)),
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
