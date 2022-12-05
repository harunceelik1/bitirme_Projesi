// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bitirme_projesi/model/travel.dart';
import 'package:flutter/material.dart';

class Locations extends StatelessWidget {
  final Travel travel;
  Locations(this.travel);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final color_Theme = Color.fromARGB(27, 24, 43, 255);
    final color_Transparent = Colors.transparent;

    final double containerHeight = 300;
    final double circleYukseklik = 50;

    final double top = containerHeight - circleYukseklik / 2;
    final listLocation = Travel.generateLocation();

    return LayoutBuilder(
      builder: (context, contraints) => Container(
        child: Stack(
          clipBehavior: Clip.none,
          // alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 600 / 2,
              width: width * 0.8,
              decoration: BoxDecoration(
                  color: color_Theme, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                      onTap: (() => {}),
                      child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: new DecorationImage(
                                  image: AssetImage(travel.image),
                                  fit: BoxFit.cover))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(travel.name),
                            Row(
                              children: [
                                Text(travel.rate),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 14,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              travel.icon,
                              size: 14,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              travel.location,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    )),
                  )
                ],
              ),
            ),
            Positioned(
              top: top,
              right: 20,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 52, 112, 161),
                  radius: circleYukseklik / 2,
                  child: IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.bookmark_add),
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
