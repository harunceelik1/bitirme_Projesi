import 'package:bitirme_projesi/db/user.dart';
import 'package:bitirme_projesi/model/Colors.dart';
import 'package:bitirme_projesi/widget/inputWidget.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({super.key});

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  String name = "";
  String email = "";
  String phone = "";
  String passwd = "";
  late Isar isar;
  bool flag = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwdController = TextEditingController();
  TextEditingController passwdController1 = TextEditingController();

  Edituser() async {
    final k = await isar.users.where().filter().emailEqualTo(email).findFirst();
    if (k?.email == email) {
      flag = true;
      final edittuser = User()
        ..email = email
        ..name = k?.name
        ..passwd = passwd
        ..id = k!.id
        ..phone = k.phone;

      await isar.writeTxn(
        () async {
          await isar.users.put(edittuser);
          setState(() {});
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Şifre Değişti."),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Mail Adresi Bulunamadı."),
        ),
      );
    }
  }

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
                        "Change Password",
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
              InputWidget(
                icon: Icons.vpn_key,
                text: "Confirm Password",
                obscureText: true,
                showImage: true,
                onChanged: (value) {
                  setState(() {
                    // passwd = value;
                  });
                },
                textEdit: passwdController1,
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    if (flag) {
                      Edituser();
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
