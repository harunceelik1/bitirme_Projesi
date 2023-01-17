import 'dart:ui';

import 'package:bitirme_projesi/model/travel.dart';
import 'package:bitirme_projesi/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeroScreen extends StatefulWidget {
  final Travel travel;

  const HeroScreen({super.key, required this.travel});

  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final color_Theme = Color.fromARGB(255, 52, 112, 161);
    String text;

    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.travel.image,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image(
                    image: AssetImage(
                      widget.travel.image,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Material(
                        color: Colors.transparent,
                        child: ClipRRect(
                            child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 5,
                                  sigmaY: 5,
                                ),
                                child: Container(
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.transparent,
                                    child: IconButton(
                                      onPressed: () => {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    HomePage())))
                                      },
                                      icon: Icon(Icons.arrow_back),
                                      color: Colors.white,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.white.withOpacity(0.6),
                                          Colors.white.withOpacity(0.1),
                                        ]),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Material(
                        color: Colors.transparent,
                        child: ClipRRect(
                            child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 5,
                                  sigmaY: 5,
                                ),
                                child: Container(
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.transparent,
                                    child: IconButton(
                                      onPressed: () => {},
                                      icon: Image.asset(
                                        "images/menu.webp",
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.white.withOpacity(0.6),
                                          Colors.white.withOpacity(0.1),
                                        ]),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ))),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 130,
                    left: 20,
                    right: 20,
                    child: Material(
                      color: Colors.transparent,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: Container(
                            height: 310,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white.withOpacity(0.6),
                                    Colors.black54.withOpacity(0.1),
                                  ]),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.travel.location,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 22),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(widget.travel.name,
                                          style: TextStyle(fontSize: 22)),
                                      Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: color_Theme,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(Icons.star),
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Rating",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(widget.travel.rate),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    widget.travel.descp,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: (() {}),
                                    child: Container(
                                      width: width * 0.9,
                                      decoration: BoxDecoration(
                                          color: color_Theme,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Center(
                                            child: Text(
                                          "Choose Dates",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 410,
                    left: 40,
                    child: Center(
                      child: Material(
                        color: Colors.transparent,
                        child: CircleAvatar(
                          backgroundColor: color_Theme,
                          radius: 25,
                          child: IconButton(
                            onPressed: () => {},
                            icon: Icon(Icons.bookmark_add),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          deneme(
                            width: width,
                            text: "Mo. 16 Sep",
                            text2: "21°",
                            image: Image.asset("images/rain.png"),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          deneme(
                            width: width,
                            text: "Price From",
                            text2: widget.travel.price,
                            image: Image.asset("images/coins.png"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class deneme extends StatelessWidget {
  final String text;
  final String text2;
  final Image image;
  const deneme({
    Key? key,
    required this.width,
    required this.text,
    required this.text2,
    required this.image,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: width * 0.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey.withOpacity(0.6),
              Colors.black54.withOpacity(0.5),
            ]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Material(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(color: Colors.grey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text2,
                    style: TextStyle(fontSize: 22),
                  ),
                  image
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}