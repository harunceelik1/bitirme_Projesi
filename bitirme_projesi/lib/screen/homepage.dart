// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:bitirme_projesi/model/travel.dart';
import 'package:bitirme_projesi/screen/mobileScreen.dart';
import 'package:bitirme_projesi/screen/responsive/responsive_layout.dart';
import 'package:bitirme_projesi/widget/bottomNav.dart';
import 'package:bitirme_projesi/widget/category.dart';
import 'package:bitirme_projesi/widget/customappBar.dart';
import 'package:bitirme_projesi/widget/inputSearch.dart';
import 'package:bitirme_projesi/widget/list.dart';
import 'package:bitirme_projesi/widget/locations.dart';
import 'package:bitirme_projesi/widget/titleWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final title = "Where do you want to be ?";
  final color_Theme = Color.fromARGB(27, 24, 43, 255);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: ResponsiveLayout(
              mobileBody: mobileScreen(),
              desktopBody: Container(),
              tabletBody: Container()),
        ),
        bottomNavigationBar: bottomNavigation(color_Theme: color_Theme));
  }
}
