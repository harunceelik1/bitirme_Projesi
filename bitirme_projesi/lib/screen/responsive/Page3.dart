import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  double kutuTop = 100;
  double kutuLeft = 100;

  double kutuTop2 = 200;
  double kutuLeft2 = 120;

  double kutu1width = 50;
  double kutu1height = 50;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Positioned(
            top: kutuTop,
            left: kutuLeft,
            child: GestureDetector(
              onPanUpdate: (details) {
                kutuTop = max(0, kutuTop + details.delta.dy);
                kutuLeft = max(0, kutuLeft + details.delta.dx);
                setState(() {});
              },
              child: Container(
                height: 50,
                width: 50,
                color: Colors.orange,
              ),
            )),
        Positioned(
            top: kutuTop2,
            left: kutuLeft2,
            child: GestureDetector(
              onPanUpdate: (details) {
                kutuTop2 = min(screenHeight - kutu1height,
                    max(0, kutuTop2 + details.delta.dy));
                kutuLeft2 = min(screenWidth - kutu1width,
                    max(0, kutuLeft2 + details.delta.dx));
                setState(() {});
              },
              child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.orange,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      kutu1height = constraints.maxHeight;
                      kutu1width = constraints.maxWidth;
                      return Text("Kutu");
                    },
                  )),
            )),
      ]),
    );
  }
}
