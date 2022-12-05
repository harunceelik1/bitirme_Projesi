// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:bitirme_projesi/widget/bottomNav.dart';
import 'package:bitirme_projesi/widget/category.dart';
import 'package:bitirme_projesi/widget/customappBar.dart';
import 'package:bitirme_projesi/widget/inputSearch.dart';
import 'package:bitirme_projesi/widget/list.dart';
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
        body: LayoutBuilder(
            builder: (context, constraints) => Column(
                  children: [
                    // Başlık Yazı Kısmı
                    Expanded(
                        flex: 1,
                        child: titleWidget(width: width, title: title)),

                    /// İnputDecoration - Arama Kısmı
                    SizedBox(
                      height: 5,
                    ),
                    // FractionallySizedBox(
                    //   heightFactor: 0,
                    // ),
                    Expanded(flex: 1, child: inputSearch(width: width)),
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
                )),
        bottomNavigationBar: bottomNavigation(color_Theme: color_Theme));
  }

//   BottomNavigationBar bottomNavigation() {
//     return BottomNavigationBar(
//           selectedItemColor: Color.fromARGB(255, 52, 112, 161),
//           unselectedItemColor: Colors.grey.shade800,
//           type: BottomNavigationBarType.fixed,
//           currentIndex: _currentIndex,
//           onTap: (index) {
//             setState(() {
//               if (_currentIndex != index) {
//                 _currentIndex = index;
//               }
//             });
//           },
//           items: [
//             BottomNavigationBarItem(
//               icon: Container(
//                 child: Column(
//                   children: [
//                     Icon(Icons.home),
//                     CircleAvatar(
//                       radius: 2,
//                       backgroundColor: Color.fromARGB(255, 52, 112, 161),
//                     ),
//                   ],
//                 ),
//               ),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//                 icon: Card(
//                     color: Colors.blue,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8)),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(
//                         Icons.add,
//                         color: Colors.white,
//                       ),
//                     )),
//                 label: ''),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.bookmark_add), label: ''),
//           ]);
//   }
}
