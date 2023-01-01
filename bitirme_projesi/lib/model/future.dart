import 'package:bitirme_projesi/screen/loginScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FutureBuild extends StatefulWidget {
  const FutureBuild({super.key});

  @override
  State<FutureBuild> createState() => _FutureBuildState();
}

class _FutureBuildState extends State<FutureBuild> {
  bool loaded = false;

  late Future<dynamic> profile;
  Future<dynamic> downloadProfile() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  void initState() {
    super.initState();
    profile = downloadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: profile,
      builder: ((context, snapshot) {
        switch (snapshot.connectionState) {
          case (ConnectionState.active):
            return Text("Active");
          case (ConnectionState.waiting):
            return Center(
              child: CircularProgressIndicator(),
            );
          case (ConnectionState.done):
            if (snapshot.hasError) {
              return Text("Hata Oluştu");
            }
            return LoginScreen();
          default:
            return Text("Hata");
        }
      }),
    ));
  }
}
