// ignore_for_file: prefer_const_constructors
import 'package:bitirme_projesi/db/user.dart';
import 'package:bitirme_projesi/model/Colors.dart';
import 'package:bitirme_projesi/widget/bottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final User user;
  CustomAppBar({super.key, required this.user});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(110);
}

late Isar isar;

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    String text;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SheetBottom(
                content: Column(
                  children: [
                    //burası fotoğrafın gözükeceği yer
                    Center(
                        child: Container(
                      child: InkWell(
                        onTap: () {
                          print("sa");
                        },
                        child: Icon(
                          Icons.photo_camera_outlined,
                          color: screenColor.black,
                          size: 50,
                        ),
                      ),
                      margin: EdgeInsets.only(top: 35),
                      height: 180,
                      width: 200,
                      decoration: BoxDecoration(
                        color: screenColor.white,
                        shape: BoxShape.circle,
                      ),
                    )),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "İsim : ${widget.user.name}",
                          style: GoogleFonts.poppins(
                              fontSize: 18, color: screenColor.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Telefon No : ${widget.user.phone}",
                          style: GoogleFonts.poppins(
                              fontSize: 18, color: screenColor.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: screenColor.cardsColor,
                      child: IconButton(
                        onPressed: () => {},
                        icon: Image.asset("images/notification.webp"),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: screenColor.cardsColor,
                      child: IconButton(
                        splashColor: screenColor.transparent,
                        onPressed: () => {
                          GoRouter.of(context).push('/loginScreen'),
                          // Navigator.pushNamed(context, '/loginScreen')
                        },
                        icon: Icon(Icons.close),
                        color: screenColor.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
