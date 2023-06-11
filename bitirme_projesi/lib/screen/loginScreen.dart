import 'package:bitirme_projesi/db/user.dart';
import 'package:bitirme_projesi/model/Colors.dart';
import 'package:bitirme_projesi/screen/homepage.dart';
import 'package:bitirme_projesi/widget/inputWidget.dart';
import 'package:bitirme_projesi/widget/snackDesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/settings_cubit.dart';
import '../storage/user_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String passwd = "";
  bool flag = false;
  late Isar isar;
  // late final SettingsCubit settings;
  final UserManager userManager = UserManager();

  TextEditingController passwdController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void checkUser() async {
    final user =
        await isar.users.where().filter().emailEqualTo(email).findAll();
    if (user.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: snackDesign(
            text1: "Dikkat ! ",
            text2: "Lütfen bilgileri doldurunuz ! ",
            colorSnack: screenColor.snackRed,
            image: Image.asset("images/danger.png"),
            image2: Image.asset("images/paint-splash.png"),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: screenColor.transparent,
          elevation: 0,
        ),
      );
      return;
    }
    for (var i in user) {
      String dbEmail = i.email.toString();
      String dbPass = i.passwd.toString();

      if (dbEmail == email && dbPass == passwd) {
        flag = true;
        // settings.userLogin();
        // await userManager.saveUserCredentials(email, passwd);

        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return HomePage(
              //kullanıcı adını da atabiliriz bilgileri değiştirmek için.
              user: i,
            );
          },
        ));
        // GoRouter.of(context).push('/screen1');
      } else if (dbEmail != email || dbPass != passwd) {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: snackDesign(
                text1: "Dikkat ! ",
                text2: "Email ya da şifreniz hatalı",
                colorSnack: screenColor.snackRed,
                image: Image.asset("images/danger.png"),
                image2: Image.asset("images/paint-splash.png"),
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: screenColor.transparent,
              elevation: 0,
            ),
          );
        });
      }
    }
    if (passwdController.text.isEmpty && emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: snackDesign(
            text1: "Dikkat ! ",
            text2: "Lütfen bilgilerinizi doldurunuz",
            colorSnack: screenColor.snackRed,
            image: Image.asset("images/danger.png"),
            image2: Image.asset("images/paint-splash.png"),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: screenColor.transparent,
          elevation: 0,
        ),
      );
    }
  }

  @override
  void initState() {
    // settings = context.read<SettingsCubit>();
    // TODO: implement initState
    super.initState();
    // checkSavedUserCredentials();

    isar = Provider.of<Isar>(context, listen: false);
  }

  // void checkSavedUserCredentials() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? savedEmail = prefs.getString('email');
  //   String? savedPassword = prefs.getString('password');

  //   if (savedEmail != null && savedPassword != null) {
  //     bool isLoggedIn =
  //         await userManager.checkUserCredentials(savedEmail, savedPassword);
  //     if (isLoggedIn) {
  //       GoRouter.of(context).replace("/homepage");
  //     } else {
  //       GoRouter.of(context).replace("/loginScreen");
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                  ),
                  color: new Color(0xff1f3b83),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(255, 44, 93, 114),
                      Color(0xFF203A43),
                    ],
                  ),
                ),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/tw.png"),
                              fit: BoxFit.cover)),
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Login",
                        style: GoogleFonts.roboto(
                            fontSize: 16, color: screenColor.white),
                      ),
                    )
                  ],
                )),
              ),
              SizedBox(
                height: 70,
              ),
              // ignore: prefer_const_constructors
              InputWidget(
                icon: Iconsax.sms,
                text: "Enter Email",
                obscureText: false,
                showImage: false,
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter,
                  LengthLimitingTextInputFormatter(20),
                ],
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                textEdit: emailController,
              ),
              // ignore: prefer_const_constructors
              InputWidget(
                icon: Iconsax.key,
                text: "Password",
                obscureText: true,
                showImage: true,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15),
                  FilteringTextInputFormatter.singleLineFormatter,
                ],
                onChanged: (value) {
                  setState(() {
                    passwd = value;
                  });
                },
                textEdit: passwdController,
              ),

              Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () {
                      // Navigator.of(context).pushNamed("/changePass");
                      GoRouter.of(context).pushNamed('changePass');
                    },
                    child: Text("Forget Password ? ")),
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    // Navigator.of(context).pushReplacementNamed("/homeScreen");
                    if (flag) {
                    } else {
                      checkUser();
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: new Color(0xff1f3b83),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color.fromARGB(255, 44, 93, 114),
                          Color(0xFF203A43),
                        ],
                      ),
                    ),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: screenColor.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("dont't have account ? "),
                    GestureDetector(
                      onTap: (() {
                        // Navigator.of(context)
                        //     .pushReplacementNamed('/registerScreen');
                        // Navigator.of(context).pushNamed("/registerScreen");
                        GoRouter.of(context).push("/registerScreen");
                      }),
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                          color: Color(0xff058cc0),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
