import 'dart:async';

import 'package:bitirme_projesi/screen/loginScreen.dart';
import 'package:flutter/material.dart';

import '../enum/duration.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
    // startTimer();
  }

  startTimer() async {
    var duration = DurationEnum.NORMAL.time;
    return new Timer(duration, loginRoute);
  }

  loginRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: new Color(0xff1f3b83),
              gradient: LinearGradient(
                colors: [
                  (Color.fromARGB(255, 52, 112, 161)),
                  new Color(0xff1d71b8)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              FlutterLogo()
            ],
          ))
        ],
      ),
    );
  }
}
