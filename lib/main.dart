import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
























class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var lastPosition = 0.0;
  var random = Random();
  late AnimationController animationController;

  double randomNumber() {
    lastPosition = random.nextDouble();
    return lastPosition;
  }

  @override
  void initState() {
    super.initState();
    spinBottle();
  }

  spinBottle() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/wallpaper.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Center(
              child: SizedBox(
            child: RotationTransition(
                turns: Tween(begin: lastPosition, end: randomNumber()).animate(
                    CurvedAnimation(
                        parent: animationController, curve: Curves.linear)),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      spinBottle();
                    });
                  },
                  child: Image.asset(
                    "assets/bottle.jpg",
                    width: 250,
                    height: 250,
                  ),
                )),
          )),
        ],
      ),
    );
  }
}






