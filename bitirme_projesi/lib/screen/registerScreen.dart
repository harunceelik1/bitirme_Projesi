import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
      ),
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
                        "Register",
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
                icon: Icons.person,
                text: "Full Name",
                obscureText: false,
              ),
              input(
                icon: Icons.email,
                text: "Enter Email",
                obscureText: false,
              ),
              input(
                icon: Icons.phone,
                text: "Phone Number",
                obscureText: false,
              ),
              input(
                icon: Icons.vpn_key,
                text: "Password",
                obscureText: true,
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {},
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
                      "REGISTER",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
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
        // keyboardType: TextInputType.number,
        // inputFormatters: <TextInputFormatter>[
        //   FilteringTextInputFormatter.digitsOnly
        // ],
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
