import 'package:bitirme_projesi/model/travel.dart';
import 'package:bitirme_projesi/screen/heroScreen.dart';
import 'package:bitirme_projesi/screen/homepage.dart';
import 'package:bitirme_projesi/screen/loginScreen.dart';
import 'package:bitirme_projesi/screen/logoScreen.dart';
import 'package:bitirme_projesi/screen/mobileScreen.dart';
import 'package:bitirme_projesi/screen/newScreen.dart';
import 'package:bitirme_projesi/screen/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

// final _router = GoRouter(
//   initialLocation: '/homepage',
//   routes: [
//     GoRoute(
//       path: '/new',
//       builder: (context, state) => NewScreen(),
//     ),
//     GoRoute(
//       path: '/homepage',
//       builder: (context, state) => HomePage(),
//     ),
//      GoRoute(
//       path: '/hero/:travel',
//       builder: (context, state) => HeroScreen(travel: state.params['travel'],),
//     ),
//   ],
// );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // materialapp.router yapıp configi aç kullanırken GOROUTERİ
      title: 'Travel App',
      // routerConfig: _router,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      routes: {
        '/homeScreen': (context) => HomePage(),
        '/registerScreen': (context) => RegisterScreen(),
      },
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}
