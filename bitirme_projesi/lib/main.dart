import 'package:bitirme_projesi/screen/homepage.dart';
import 'package:bitirme_projesi/screen/logoScreen.dart';
import 'package:bitirme_projesi/screen/registerScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
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
      // theme: ThemeData.dark(),

      home: LogoScreen(),
    );
  }
}
