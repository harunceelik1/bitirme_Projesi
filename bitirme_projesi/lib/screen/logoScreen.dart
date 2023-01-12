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
    startTimer();
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
                colors: [(new Color(0xff1f3b83)), new Color(0xff058cc0)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(child: FlutterLogo())
        ],
      ),
    );
  }
}
