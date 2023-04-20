import 'package:bitirme_projesi/db/user.dart';
import 'package:bitirme_projesi/model/Colors.dart';
import 'package:bitirme_projesi/widget/inputWidget.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name = "";
  String email = "";
  String phone = "";
  String passwd = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwdController = TextEditingController();
  bool goster = true;
  addUser() async {
    if (name.isEmpty || phone.isEmpty || email.isEmpty || passwd.isEmpty) {
      goster = false;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Çalışan bilgilerini girmeniz gerekiyor'),
      ));
    } else {
      goster = true;
      final newUser = User()
        ..name = name
        ..email = email
        ..phone = phone
        ..passwd = passwd;

      await isar.writeTxn(() async {
        await isar.users.put(newUser);

        nameController = TextEditingController(text: "");
        emailController = TextEditingController(text: "");
        phoneController = TextEditingController(text: "");
        passwdController = TextEditingController(text: "");

        setState(() {});
      });
    }
  }

  late Isar isar;

  @override
  void initState() {
    super.initState();
    isar = Provider.of<Isar>(context, listen: false);
  }

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
              InputWidget(
                icon: Icons.person,
                text: "Full Name",
                obscureText: false,
                showImage: false,
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                textEdit: nameController,
              ),
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
              InputWidget(
                icon: Icons.phone,
                text: "Phone Number",
                obscureText: false,
                showImage: false,
                onChanged: (value) {
                  setState(() {
                    phone = value;
                  });
                },
                textEdit: phoneController,
              ),
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
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    addUser();
                    if (goster) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Eklendi'),
                      ));
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
