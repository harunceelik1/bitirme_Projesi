import 'package:bitirme_projesi/db/user.dart';
import 'package:bitirme_projesi/model/Colors.dart';
import 'package:bitirme_projesi/screen/homepage.dart';
import 'package:bitirme_projesi/widget/inputWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

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
  TextEditingController passwdController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  checkUser() async {
    final user =
        await isar.users.where().filter().emailEqualTo(email).findAll();
    for (var i in user) {
      String dbEmail = i.email.toString();
      String dbPass = i.passwd.toString();

      if (dbEmail == email && dbPass == passwd) {
        flag = true;
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return HomePage(
              //kullanıcı adını da atabiliriz bilgileri değiştirmek için.
              user: i,
            );
          },
        ));
        // GoRouter.of(context).push('/screen1');
      } else {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Şifreniz Hatalı.'),
          ));
        });
      }
    }
    if (user.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Böyle Bir Kullanıcı Bulunamamaktadır'),
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isar = Provider.of<Isar>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final color_Transparent = Colors.transparent;
    final inputText = 'Name';
    final inputText2 = 'Surname';
    final width = MediaQuery.of(context).size.width;

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
                    colors: [
                      (new Color(0xff1f3b83)),
                      new Color(0xff058cc0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
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
                        style: TextStyle(fontSize: 16),
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
                icon: Icons.email,
                text: "Enter Email",
                obscureText: false,
                showImage: false,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                textEdit: emailController,
              ),
              // ignore: prefer_const_constructors
              InputWidget(
                icon: Icons.vpn_key,
                text: "Password",
                obscureText: true,
                showImage: true,
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
                        colors: [
                          (new Color(0xff1f3b83)),
                          new Color(0xff058cc0)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
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
                        style: TextStyle(color: Color(0xff058cc0)),
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
