import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  var lastPosition = 0.0;
  var random = Random();

  late AnimationController animationController;

  double getRandomNumber() {
    lastPosition = random.nextDouble();
    return lastPosition;
  }

  @override
  void initState() {
    super.initState();
    spinTheBottle();
  }

  spinTheBottle() {
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
              "assets/floor.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: SizedBox(
                child: RotationTransition(
                    turns: Tween(begin: lastPosition, end: getRandomNumber())
                        .animate(CurvedAnimation(
                            parent: animationController, curve: Curves.linear)),
                    child: GestureDetector(
                      onTap: () {
                        if (animationController.isCompleted) {
                          setState(() {
                            spinTheBottle();
                          });
                        }
                      },
                      child: Image.asset(
                        "assets/bottle.jpg",
                        width: 250,
                        height: 250,
                      ),
                    ))),
          )
        ],
      ),
    );
  }
}
