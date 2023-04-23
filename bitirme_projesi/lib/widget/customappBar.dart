// ignore_for_file: prefer_const_constructors

import 'package:bitirme_projesi/model/Colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Center(
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: screenColor.transparent,
                  backgroundImage: AssetImage("images/man.png"),
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

  @override
  Size get preferredSize => Size.fromHeight(110);
}
