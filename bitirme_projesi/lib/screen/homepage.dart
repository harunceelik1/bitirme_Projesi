// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:bitirme_projesi/db/user.dart';
import 'package:bitirme_projesi/screen/mobileScreen.dart';
import 'package:bitirme_projesi/widget/bottomNav.dart';
import 'package:bitirme_projesi/widget/customappBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final User user;
  late int? sayi;
  HomePage({super.key, this.sayi, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

int index = 0;

class _HomePageState extends State<HomePage> {
  final title = "Where do you want to be ?";

  void indexAl(int index1) {
    print("indexAl");
    print(index1);

    setState(() {
      index = index1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final screens = [
      mobileScreen(
        user: widget.user,
      ),
      CustomAppBar(
        user: widget.user,
      )
    ];
    getScreenByIndex(int index) {
      print("getscreenBy");
      print(index);
      return screens[index];
    }

    print(widget.user.email);
    return Scaffold(
      appBar: CustomAppBar(
        user: widget.user,
      ),
      body: SingleChildScrollView(
        // child: ResponsiveLayout(
        //     mobileBody: mobileScreen(
        //       name: widget.name,
        //     ),
        //     desktopBody: Container(
        //       child: Center(child: Text("Desktop..")),
        //     ),
        //     tabletBody: Container(
        //       child: Center(
        //         child: Text("Tablet.."),
        //       ),
        //     )),
        child: getScreenByIndex(index),
      ),
      bottomNavigationBar: bottomNavigation(
        changeIndex: indexAl,
      ),
    );
  }
}
