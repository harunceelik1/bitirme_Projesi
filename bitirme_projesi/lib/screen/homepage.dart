// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:bitirme_projesi/screen/mobileScreen.dart';
import 'package:bitirme_projesi/screen/responsive/responsive_layout.dart';
import 'package:bitirme_projesi/widget/bottomNav.dart';
import 'package:bitirme_projesi/widget/customappBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String? name;
  const HomePage({super.key, this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final title = "Where do you want to be ?";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: CustomAppBar(),
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
            child: mobileScreen(
          name: widget.name,
        )),
        bottomNavigationBar: bottomNavigation());
  }
}
