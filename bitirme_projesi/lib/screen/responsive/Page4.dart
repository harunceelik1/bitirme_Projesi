import 'package:bitirme_projesi/screen/responsive/Page2.dart';
import 'package:bitirme_projesi/screen/responsive/Page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  int currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentTab,
        children: [
          Container(
            color: Colors.red,
            child: Page2(),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            color: Colors.deepPurple,
            alignment: Alignment.topCenter,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(color: Colors.orange),
            ),
          ),
          Container(
            color: Colors.purple,
            child: Page3(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          height: 50,
          color: Colors.red,
          child: Row(
            children: [
              Expanded(
                  child: InkWell(
                      onTap: (() {
                        setState(() {
                          currentTab = 0;
                        });
                      }),
                      child: Icon(Icons.home))),
              Expanded(
                  child: InkWell(
                      onTap: (() {
                        setState(() {
                          currentTab = 1;
                        });
                      }),
                      child: Icon(Icons.home))),
              Expanded(
                  child: InkWell(
                      onTap: (() {
                        setState(() {
                          currentTab = 2;
                        });
                      }),
                      child: Icon(Icons.home))),
            ],
          )),
    );
  }
}
