import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                    colors: [(new Color(0xff1f3b83)), new Color(0xff058cc0)],
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
              input(
                icon: Icons.email,
                text: "Enter Email",
                obscureText: false,
              ),
              input(
                icon: Icons.vpn_key,
                text: "Password",
                obscureText: true,
              ),
              Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                alignment: Alignment.centerRight,
                child: InkWell(onTap: () {}, child: Text("Forget Password ? ")),
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed("/homeScreen");
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
                      style: TextStyle(color: Colors.white),
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
                        Navigator.of(context).pushNamed("/registerScreen");
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

class input extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool obscureText;
  const input({
    Key? key,
    required this.text,
    required this.icon,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade800.withOpacity(0.5),
      ),
      alignment: Alignment.center,
      // ignore: prefer_const_constructors
      child: TextField(
        cursorColor: Colors.grey,
        obscureText: obscureText,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color(0xff058cc0),
          ),
          hintText: text,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
