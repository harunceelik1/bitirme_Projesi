import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomNavigation extends StatelessWidget {
  const bottomNavigation({
    Key? key,
    required this.color_Theme,
  }) : super(key: key);

  final Color color_Theme;

  @override
  Widget build(BuildContext context) {
    GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

    int _page = 0;

    return CurvedNavigationBar(
      color: Colors.grey.shade800,
      backgroundColor: Colors.transparent,
      animationDuration: Duration(milliseconds: 400),
      buttonBackgroundColor: Colors.grey.shade600,
      items: [
        Icon(Icons.home),
        Icon(Icons.add),
        Icon(Icons.bookmark_add_outlined),
      ],
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
    );
  }
}

void setState(Null Function() param0) {}

// class googleNavbar extends StatelessWidget {
//   const googleNavbar({
//     Key? key,
//     required this.color_Theme,
//   }) : super(key: key);

//   final Color color_Theme;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         child: GNav(
//             gap: 8,
//             padding: EdgeInsets.all(25),
//             tabActiveBorder: Border.all(color: color_Theme, width: 1),
//             activeColor: Color.fromARGB(255, 52, 112, 161),
//             tabs: [
//               GButton(icon: Icons.home, text: 'Home'),
//               GButton(
//                 icon: Icons.add,
//                 text: 'Add',
//               ),
//               GButton(
//                 icon: Icons.bookmark_add,
//                 text: 'Save',
//               ),
//             ]),
//       ),
//     );
//   }
// }
