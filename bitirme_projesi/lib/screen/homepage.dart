// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:bitirme_projesi/model/travel.dart';
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
  // int _currentIndex = 0;
  // List<Widget> body = const [
  //   Icon(Icons.home),
  //   Icon(Icons.add),
  //   Icon(Icons.person)
  // ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            /// Başlık Yazı Kısmı
            Expanded(flex: 1, child: titleWidget()),

            /// İnputDecoration - Arama Kısmı
            SizedBox(
              height: 5,
            ),
            // FractionallySizedBox(
            //   heightFactor: 0,
            // ),
            Expanded(flex: 1, child: inputSearch()),
            SizedBox(
              height: 15,
            ),
            // Kategoriler kısmı. Listview ile yapıldı
            Flexible(flex: 1, child: Categories()),
            SizedBox(
              height: 15,
            ),
            Expanded(flex: 7, child: Listeleme()),
          ],
        ),
        // body: SafeArea(
        //   child: CustomScrollView(
        //     slivers: [
        //       SliverAppBar(
        //         elevation: 0,
        //         backgroundColor: Colors.transparent,
        //         leadingWidth: 90,
        //         toolbarHeight: 90,
        //         leading: Padding(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        //           child: Container(
        //             child: CircleAvatar(
        //               radius: 25,
        //               backgroundColor: Colors.transparent,
        //               backgroundImage: AssetImage(
        //                 "images/4.jpg",
        //               ),
        //             ),
        //           ),
        //         ),
        //         actions: [
        //           Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 20),
        //             child: Container(
        //               child: Row(
        //                 // ignore: prefer_const_literals_to_create_immutables
        //                 children: [
        //                   CircleAvatar(
        //                     radius: 25,
        //                     backgroundColor: color_Theme,
        //                     child: IconButton(
        //                       onPressed: () => {},
        //                       icon: Image.asset("images/notification.webp"),
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     width: 5,
        //                   ),
        //                   CircleAvatar(
        //                     radius: 25,
        //                     backgroundColor: color_Theme,
        //                     child: IconButton(
        //                       onPressed: () => {},
        //                       icon: Image.asset(
        //                         "images/menu.webp",
        //                       ),
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        bottomNavigationBar: bottomNavigation(color_Theme: color_Theme));
  }
}
