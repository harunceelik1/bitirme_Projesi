import 'package:bitirme_projesi/db/user.dart';
import 'package:bitirme_projesi/screen/homepage.dart';
import 'package:bitirme_projesi/screen/loginScreen.dart';
import 'package:bitirme_projesi/screen/registerScreen.dart';
import 'package:bitirme_projesi/screen/updatePasswd.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

void main() async {
  final isar = await openIsar();
  runApp(Provider.value(value: isar, child: MyApp()));
}

Future<Isar> openIsar() async {
  final isar = await Isar.open(
    [UserSchema],
    directory: '',
  );
  return isar;
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
        '/changePass': (context) => ChangePass(),
        '/loginScreen': (context) => LoginScreen(),
      },
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}
