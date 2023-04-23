import 'package:bitirme_projesi/db/user.dart';
import 'package:bitirme_projesi/screen/homepage.dart';
import 'package:bitirme_projesi/screen/loginScreen.dart';
import 'package:bitirme_projesi/screen/logoScreen.dart';
import 'package:bitirme_projesi/screen/registerScreen.dart';
import 'package:bitirme_projesi/screen/updatePasswd.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await openIsar();
  runApp(Provider.value(value: isar, child: MyApp()));
}

Future<Isar> openIsar() async {
  final dir =
      await getApplicationDocumentsDirectory(); //cihazın dir konumunu alır
  final isar = await Isar.open([UserSchema], directory: dir.path);
  return isar;
}

final _router = GoRouter(
  initialLocation: '/logoinit',
  routes: [
    GoRoute(
      path: '/logoinit',
      builder: (context, state) => LogoScreen(),
    ),
    GoRoute(
      path: '/registerScreen',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/homepage',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      name:
          "changePass", //pushname kullanırsak buradaki adı yazıyoruz push kullanırsak pathteki yeri yazıyoruz
      path: '/change-Pass',
      builder: (context, state) => ChangePass(),
    ), // GoRoute(
    //   path: '/hero/:travel',
    //   builder: (context, state) => HeroScreen(
    //     travel: state.params['travel'],
    //   ),
    GoRoute(path: '/loginScreen', builder: (context, state) => LoginScreen()),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // materialapp.router yapıp configi aç kullanırken GOROUTERİ
      title: 'Travel App',
      // routerConfig: _router,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      // routes: {
      //   '/homeScreen': (context) => HomePage(),
      //   '/registerScreen': (context) => RegisterScreen(),
      //   '/changePass': (context) => ChangePass(),
      //   '/loginScreen': (context) => LoginScreen(),
      // },
      routerConfig: _router,
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      // home: LoginScreen(),
    );
  }
}
